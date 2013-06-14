import os
import sys
import maya.cmds as cmds
import RG_Parts.Parts_Maya.System.Parts_UI as Parts_UI
import RG_Parts.Parts_Maya.Utils.Utils_Part as partUtils

class Parts_Menu():

    def createMenu(self, *args):
        mi = cmds.window('MayaWindow', ma=True, q=True)
        for m in mi:
            if m == 'parts':
                cmds.deleteUI('parts', m=True)
               
        cmds.menu('parts', label='Parts', to=True,  p="MayaWindow")
        
        cmds.menuItem( label='RigNodeUI', c=self.load_rigNodeUi)
        cmds.menuItem( label='PartsUI', c=self.load_partsUi)

    def load_rigNodeUi(self, *args):
        #IconPath = os.environ['Parts_Maya_Icons']
        import WidgetParam_UI as wp_ui
        reload(wp_ui)
        wp_ui.PartParam_UI()    


    def load_partsUi(self, *args):
        import System.Parts_UI as Parts_UI
        ui = Parts_UI.Parts_UI()
  