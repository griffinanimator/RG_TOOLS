import os
from lxml import etree
import pymel.core as pm
import core.settings as settings
from core import log
from core.plugins import Plugin
from core.ui.menu import add_menu_item
from core.filesystem import resolve
from skyvillage.exporters import alchemy, export_materials
from skyvillage.converters import convert_ig_to_lambert
from skyvillage.converters import fix_material_names

def split_ref(name):
    return tuple(name.split('.'))
    
def clean_file_ref(name):
    return name[name.find('*') + 1:]

class BatchToolsPlugin(Plugin):
    __name__ = 'Skyvillage Batch Tools'
    __desc__ = 'Requires an Alchemy plugin.'
    __version__ = 1
    
    def __init__(self):
        add_menu_item('Skyvillage/Batch/Export Models', self.maya_export_dialog)
       
        self.export_maya_ui = None

    def maya_export_dialog(self):
        if self.export_maya_ui is None:
            from skyvillage.batchtools.exportmayaui import ExportMayaUI
            win = ExportMayaUI()
            def _close():
                win.close()
                self.export_maya_ui = None
            def _export():
                export_rig = win.is_export_rig_checked()
                export_char_animations = win.is_export_char_animations_checked()
                export_asset = win.is_export_asset_checked()
                export_assetAnim = win.is_export_assetAnim_checked()
                export_path = win.get_exportPath()
                fix_material_names = win.is_fix_materials_checked()
                force_mats = win.is_force_material_export_checked()
                chk_out_tex = win.is_check_out_textures_checked()
                win.close()
                for model_path in win.model_paths:
                    export_maya_model(model_path, export_path, rig=export_rig, char_animations=export_char_animations, asset=export_asset, assetAnim=export_assetAnim, fix_materials=fix_material_names, force_materials=force_mats, check_out_tex=chk_out_tex)
                self.export_maya_ui = None
            win.ui.btn_close.clicked.connect(_close)
            win.ui.btn_export.clicked.connect(_export)
            self.export_maya_ui = win
        self.export_maya_ui.show()
    
_xml_parser = etree.XMLParser(encoding='ISO-8859-1')

def _load_file(file_path):
    pm.system.openFile(file_path, force=True, prompt=False)

def export_maya_model(file_path, export_path, rig=True, char_animations=True, asset=True, assetAnim=True, fix_materials=True, force_materials=True, check_out_tex=True):
    #split ex: c:/models/model.ma  would be 0=c:/models/ 1= model.ma
    model_name = os.path.splitext(os.path.split(file_path)[1])[0]
    export_path.replace('/','\\')
    
    _load_file(file_path)
    
    if fix_materials and not char_animations:
        fix_material_names()
    
    if rig:
        sname = model_name.rpartition('_')
        model_name = sname[2]
        export_materials(force_materials, check_out_tex)
        alchemy.export_rig(model_name, export_path)
        
    if char_animations:
        alchemy.export_char_animation(model_name, export_path)
        
    if asset:
        if assetAnim:
            export_materials(force_materials, check_out_tex)
            alchemy.export_assetanimated(model_name, export_path)
        else:
            export_materials(force_materials, check_out_tex)
            alchemy.export_asset(model_name, export_path)
        


