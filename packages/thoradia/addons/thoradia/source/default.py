from urlparse import urlparse
import xbmc
import xbmcaddon
import xbmcgui
import xml.etree.ElementTree as etree

REPO_LE = 'repository.libreelec.tv'
REPO_TH = 'https://raw.githubusercontent.com/thoradia/thoradia/master/'

try:
  addon = xbmcaddon.Addon()
  strings = addon.getLocalizedString

  xml_le = xbmcaddon.Addon(REPO_LE).getAddonInfo('path') + '/addon.xml'
  path = urlparse(etree.parse(xml_le).iter(tag='datadir').next().text).path.strip('/').split('/')
  vpa = path[-3] + '/' +  path[-2] + '/' +  path[-1] + '/'
  new = REPO_TH + vpa
  
  xml_th = addon.getAddonInfo('path') + '/addon.xml'
  xml = etree.parse(xml_th)
  old = xml.iter(tag='datadir').next()
  if old.text == new:
    addon.setSetting('vpa', vpa)
  else:
    addon.setSetting('vpa', strings(30020))
    old.text = new
    xml.iter(tag='info').next().text = new + 'addons.xml'
    xml.iter(tag='checksum').next().text = new + 'addons.xml.md5'
    xml.write(xml_th)
    if xbmcgui.Dialog().yesno(addon.getAddonInfo('name'),
                              strings(30010),
                              strings(30011),
                              nolabel=strings(30012),
                              yeslabel=strings(30013)) == False:
      xbmc.executebuiltin('RestartApp')

except:
  addon.setSetting('vpa', strings(30021))
