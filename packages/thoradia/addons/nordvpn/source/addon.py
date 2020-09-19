import os.path
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
        self.header = '{} - nordvpn {}'.format(ADDON_NAME, command)
        try:
            self.output = subprocess.check_output(self.command.split())
            self.code = 0
        except subprocess.CalledProcessError as error:
            self.output = error.output
            self.code = error.returncode
        self.output = self.output[self.output.rfind('\r') + 1:-1]

    def select(self, header):
        list = self.output.replace(',', '').split()
        if len(list) == 1:
            return ''
        list.insert(0, '')
        index = xbmcgui.Dialog().select(header, list)
        if index < 0:
            return None
        return list[index]

    def show(self, dialog):
        dialog(self.header, self.output)

    def show_long(self):
        self.show(xbmcgui.Dialog().textviewer)

    def show_short(self):
        self.show(xbmcgui.Dialog().ok)


def ui_account():
    NordVPN('account').show_short()


def ui_set_autoconnect():
    states = ['disabled', 'enabled']
    state = xbmcgui.Dialog().select('autoconnect', states)
    if state < 0:
        return
    if state == 0:
        country = ''
    else:
        country = NordVPN('countries').select('country')
        if country is None:
            return
    NordVPN('set autoconnect {} {}'.format(
        states[state], country)).show_short()


def ui_connect():
    country = NordVPN('countries').select('country')
    if country is None:
        return
    NordVPN('connect ' + country)
    ui_status()


def ui_disconnect():
    NordVPN('disconnect')
    ui_status()


def ui_login():
    username = xbmcgui.Dialog().input('email/username',
                                      defaultt=ADDON.getSetting('username'))
    if username == '':
        return
    password = xbmcgui.Dialog().input('password',
                                      option=xbmcgui.ALPHANUM_HIDE_INPUT)
    if password == '':
        return
    if NordVPN('login -u {} -p {}'.format(username, password)).code == 0:
        ADDON.setSetting('username', username)
    ui_account()


def ui_logout():
    NordVPN('logout').show_short()


def ui_settings():
    NordVPN('settings').show_long()


def ui_status():
    NordVPN('status').show_long()


def ui_set_technology():
    technologies = ['NordLynx', 'OpenVPN']
    technology = xbmcgui.Dialog().select('technology', technologies)
    if technology < 0:
        return
    NordVPN('set technology ' + technologies[technology]).show_short()


def ui_menu():
    while True:
        status = NordVPN('status')
        if status.code:
            xbmcgui.Dialog().ok('Error', status.output)
            break
        if len(status.output.splitlines()) > 1 or len(NordVPN('account').output.splitlines()) > 1:
            menu = [['connect', ui_connect],
                    ['status', ui_status],
                    ['disconnect', ui_disconnect],
                    ['settings', ui_settings],
                    ['autoconnect', ui_set_autoconnect],
                    ['technology', ui_set_technology],
                    ['account', ui_account],
                    ['logout', ui_logout]]
        else:
            menu = [['login', ui_login]]
        index = xbmcgui.Dialog().select(
            ADDON_NAME, [row[0] for row in menu])
        if index < 0:
            break
        menu[index][1]()


if __name__ == '__main__':
    ui_menu()
