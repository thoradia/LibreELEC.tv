import os.path
import urllib2
import xbmc
import xbmcaddon
import xbmcgui
import xml.etree.ElementTree as etree


URL_D = 'https://raw.githubusercontent.com/thoradia/thoradia/master/{}/{}/{}/'
URL_L = 'https://github.com/thoradia/releases-libreelec/blob/master/{}-{}-{}'
URL_U = 'https://github.com/thoradia/updates-thoradia/blob/master/{}-{}-{}'


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
   try:
      urllib2.urlopen(URL_L.format(*release)).read()
   except:
      pass
   # fix release here
   xml = getXML()
   tree = getTree(xml)
   tag_d = getTag(tree, 'datadir')
   url_d = URL_D.format(*release)
   if tag_d.text == url_d:
      addon.setSetting('vpa', strings(30011).format(*release))
   else:
      try:
         urllib2.urlopen(URL_U.format(*release)).read()
      except:
         pass
      tag_d.text = url_d
      getTag(tree, 'info').text = url_d + 'addons.xml'
      getTag(tree, 'checksum').text = url_d + 'addons.xml.md5'
      tree.write(xml)
      addon.setSetting('vpa', strings(30012).format(*release))
      if xbmcgui.Dialog().yesno(addon.getAddonInfo('name'),
                                strings(30013),
                                nolabel=strings(30014),
                                yeslabel=strings(30015)) == False:
         xbmc.restart()
