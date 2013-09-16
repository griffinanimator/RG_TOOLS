import maya.OpenMayaUI as cmui
 
from PySide import QtCore
from PySide import QtGui
 
from shiboken import wrapInstance
 
def maya_main_window():
    main_window_ptr = cmui.MQtUtil.mainWindow()
    return wrapInstance(long(main_window_ptr), QtGui.QWidget)
     
def hello_world():
    label = QtGui.QLabel("Hello Wold", parent=maya_main_window())
    label.setWindowFlags(QtCore.Qt.Window)
    label.show()
     
if __name__ == "__main__":
    hello_world()