import os
import subprocess
import xbmcaddon
import xbmcgui

ADDON = xbmcaddon.Addon()
ADDON_NAME = ADDON.getAddonInfo('name')
ADDON_PATH = ADDON.getAddonInfo('path')
NORDVPN = os.path.join(ADDON_PATH, 'bin', 'nordvpn')


class NordVPN():

    def __init__(self, command):
        self.command = NORDVPN + ' ' + command
        try:
            self.text = subprocess.check_output(self.command.split())
            self.code = 0
        except subprocess.CalledProcessError as error:
            self.text = error.output
            self.code = error.returncode
        self.text = self.text[self.text.rfind(b'\r') + 1:-1].decode('utf-8')


def ui_account():
    ui_show('account')


def ui_connect():
    country = ui_select_country()
    if country is None:
        return
    NordVPN('connect {}'.format(country))
    ui_information()


def ui_disconnect():
    NordVPN('disconnect')
    ui_information()


def ui_get_header(text):
    return '{} - {}'.format(ADDON_NAME, text)


def ui_information():
    xbmcgui.Dialog().textviewer(
        ui_get_header('Information'),
        (os.linesep * 2).join((
            NordVPN(command).text for command in (
                'status',
                'settings',
                '--version',
            ))))


def ui_login():
    username = xbmcgui.Dialog().input(
        ui_get_header('Enter email/username:'),
        defaultt=ADDON.getSetting('username')
    )
    if username == '':
        return
    password = xbmcgui.Dialog().input(
        ui_get_header('Enter password:'),
        option=xbmcgui.ALPHANUM_HIDE_INPUT
    )
    if password == '':
        return
    if NordVPN('login -u {} -p {}'.format(username, password)).code == 0:
        ADDON.setSetting('username', username)
    ui_account()


def ui_logout():
    NordVPN('logout')
    ui_account()


def ui_select_country():
    countries = NordVPN('countries').text.replace(',', '').split()
    index = xbmcgui.Dialog().select(ui_get_header('Select a country:'), countries)
    if index < 0:
        return None
    return countries[index]


def ui_set_autoconnect():
    states = ['disable', 'enable']
    state = xbmcgui.Dialog().select('Disable/enable autoconnect:', states)
    if state < 0:
        return
    if state == 0:
        country = ''
    else:
        country = ui_select_country()
        if country is None:
            return
    ui_show('set autoconnect {} {}'.format(state, country))


def ui_set_technology():
    technologies = ['NordLynx', 'OpenVPN']
    technology = xbmcgui.Dialog().select('Select a technology:', technologies)
    if technology < 0:
        return
    ui_show('set technology {}'.format(technologies[technology]))


def ui_show(command):
    xbmcgui.Dialog().ok(ui_get_header(command), NordVPN(command).text)


def ui_menu():
    while True:
        status = NordVPN('status')
        if status.code:
            xbmcgui.Dialog().ok('Error', status.text)
            break
        if len(status.text.splitlines()) > 1 or len(NordVPN('account').text.splitlines()) > 1:
            menu = [
                ['Information', ui_information],
                ['Connect', ui_connect],
                ['Disconnect', ui_disconnect],
                ['Set autoconnect', ui_set_autoconnect],
                ['Set technology', ui_set_technology],
                ['Account', ui_account],
                ['Logout', ui_logout],
            ]
        else:
            menu = [
                ['Login', ui_login],
            ]
        index = xbmcgui.Dialog().select(
            ui_get_header('Select a function:'), [item[0] for item in menu])
        if index < 0:
            break
        menu[index][1]()


if __name__ == '__main__':
    ui_menu()
