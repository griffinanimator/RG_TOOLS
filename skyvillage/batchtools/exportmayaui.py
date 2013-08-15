import os
from PyQt4 import QtGui
import core.settings as settings
from core.filesystem import resolve
from core.ui.qt import SubWindow, get_maya_window, bind_setting


class ExportMayaUI(SubWindow):
    def __init__(self):
        super(ExportMayaUI, self).__init__(ui_file=resolve('module://skyvillage/batchtools/exportmayaui.ui'))
        
        bind_setting(self.ui.rb_asset, 'skyvillage/exportmayaui/export_asset_checked', default=True)
        bind_setting(self.ui.chk_assetAnim, 'skyvillage/exportmayaui/export_assetanim_checked', default=True)
        bind_setting(self.ui.rb_rig, 'skyvillage/exportmayaui/export_rig_checked', default=False)
        bind_setting(self.ui.rb_char_anim, 'skyvillage/exportmayaui/export_charanim_checked', default=False)
        bind_setting(self.ui.chk_fixmats, 'skyvillage/exportmayaui/fix_material_names', default=False)
        bind_setting(self.ui.chk_forcemats, 'skyvillage/exportmayaui/force_material_export', default=True)
        bind_setting(self.ui.chk_chkOutTex, 'skyvillage/exportmayaui/check_out_textures', default=True)
        bind_setting(self.ui.exportPath, 'skyvillage/exportmayaui/export_exportpath', default='')
        
        self.ui.btn_close.clicked.connect(self.close)
        self.ui.btn_add_models.clicked.connect(self._add_models_clicked)
        self.ui.btn_remove_models.clicked.connect(self._remove_models_clicked)
        self.ui.btn_add_path.clicked.connect(self._add_export_path_clicked)
        
        self.model_paths = set()
    
    def is_export_rig_checked(self):
        return self.ui.rb_rig.isChecked()
    
    def is_export_char_animations_checked(self):
        return self.ui.rb_char_anim.isChecked()
        
    def is_export_asset_checked(self):
        return self.ui.rb_asset.isChecked()
        
    def is_export_assetAnim_checked(self):
        return self.ui.chk_assetAnim.isChecked()
        
    def is_fix_materials_checked(self):
        return self.ui.chk_fixmats.isChecked()
        
    def is_force_material_export_checked(self):
        return self.ui.chk_forcemats.isChecked()
        
    def is_check_out_textures_checked(self):
        return self.ui.chk_chkOutTex.isChecked()
        
    def get_exportPath(self):
        return self.ui.exportPath.text()
    
    def close(self):
        self.ui.close()
        self.ui.deleteLater()
        
    def _add_export_path_clicked(self):
        initial_dir = settings.get('skyvillage/content_root')
        path = str(QtGui.QFileDialog.getExistingDirectory(self.ui, "Select Directory", initial_dir))
        self.ui.exportPath.setText(path)
    
    def _add_models_clicked(self):
        initial_dir = settings.get('skyvillage/ignition_root')
        model_paths = [str(p) for p in QtGui.QFileDialog.getOpenFileNames(parent=get_maya_window(), caption='Export Models', directory=initial_dir, filter='Maya (*.ma);;All Files (*.*)')]
        
        for model_path in model_paths:
            if model_path not in self.model_paths:
                self.model_paths.add(model_path)
                item = QtGui.QListWidgetItem(model_path)
                self.ui.list_models.addItem(item)
    
    def _remove_models_clicked(self):
        for item in list(self.ui.list_models.selectedItems()):
            model_path = str(item.text())
            self.model_paths.remove(model_path)
            self.ui.list_models.takeItem(self.ui.list_models.indexFromItem(item).row())