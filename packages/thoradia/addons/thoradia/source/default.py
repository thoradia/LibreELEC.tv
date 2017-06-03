import os.path
import xbmc
import xbmcaddon
import xbmcgui
import xml.etree.ElementTree as etree


URL_D = 'https://raw.githubusercontent.com/thoradia/thoradia/master/{}/{}/{}/'


def getTag(tree, tag):
   return tree.iter(tag=tag).next()

def getTree(xml):
   return etree.parse(xml)

def getXML(*id):
   return os.path.join(xbmcaddon.Addon(*id).getAddonInfo('path'), 'addon.xml')


if __name__ == '__main__':
   addon = xbmcaddon.Addon()
   strings = addon.getLocalizedString
   addon.setSetting('le', strings(30010))
   addon.setSetting('vpa', strings(30010))
   release = getTag(getTree(getXML('repository.libreelec.tv')), 'datadir').text.strip('/').split('/')[-3:]
   addon.setSetting('le', strings(30011).format(*release))

   if release[1] in ['Virtual']:
      release[1] = 'Generic'
   elif release[2] == "aarch64":
      if release[1] in ['WeTek_Hub', 'WeTek_Play_2']:
         release[1] = 'Odroid_C2'
   elif release[2] == 'arm':
      if release[1] in ['Odroid_C2', 'S905', 'S912']:
         release[1] = 'RPi2'
      elif release[1] in ['WeTek_Core', 'WeTek_Hub', 'WeTek_Play_2']:
         release[1] = 'WeTek_Play'

   xml = getXML()
   tree = getTree(xml)
   tag_d = getTag(tree, 'datadir')
   url_d = URL_D.format(*release)
   if tag_d.text == url_d:
      addon.setSetting('vpa', strings(30011).format(*release))
   else:
      tag_d.text = url_d
      getTag(tree, 'info').text = url_d + 'addons.xml'
      getTag(tree, 'checksum').text = url_d + 'addons.xml.md5'
      tree.write(xml)
      addon.setSetting('vpa', strings(30012).format(*release))
      if xbmcgui.Dialog().yesno(addon.getAddonInfo('name'),
                                strings(30013),
                                nolabel=strings(30014),
                                yeslabel=strings(30015)) == False:
         xbmc.executebuiltin('RestartApp')
