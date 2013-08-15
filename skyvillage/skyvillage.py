from core.plugins import Plugin
from core.ui.menu import add_menu_item
from . import converters
from . import characterTools
import maya.cmds as cmds


class skyvillagePlugin(Plugin):
    __name__ = 'Skyvillage Tools'
    __desc__ = ''
    __version__ = 1
    
    def __init__(self):
        add_menu_item('Skyvillage/Materials/Convert to Lamberts', converters.convert_ig_to_lambert)
        add_menu_item('Skyvillage/Materials/Fix Material Names', converters.fix_material_names)
        add_menu_item('Skyvillage/Character_Tools/Easy Export Skin Weights', characterTools.EasyExportSkinWeightMaps)
        add_menu_item('Skyvillage/Character_Tools/Easy Import Skin Weights', characterTools.EasyImportSkinWeightMaps)