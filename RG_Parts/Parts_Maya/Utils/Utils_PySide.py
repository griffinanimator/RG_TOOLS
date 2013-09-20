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




###### Example 2 #####
import pysideuic
import xml.etree.ElementTree as xml
from cStringIO import StringIO

def loadUiType(uiFile):
		"""
		Pyside lacks the "loadUiType" command, so we have to convert the ui file to py code in-memory first
		and then execute it in a special frame to retrieve the form_class.
		"""
		parsed = xml.parse(uiFile)
		widget_class = parsed.find('widget').get('class')
		form_class = parsed.find('class').text
	
		with open(uiFile, 'r') as f:
			o = StringIO()
			frame = {}
			
			pysideuic.compileUi(f, o, indent=0)
			pyc = compile(o.getvalue(), '<string>', 'exec')
			exec pyc in frame
			
			#Fetch the base_class and form class based on their type in the xml from designer
			form_class = frame['Ui_%s'%form_class]
			base_class = eval('QtGui.%s'%widget_class)
		return form_class, base_class
		
		
loadUiType('C:/Users/rgriffin/Documents/GitHub/RG_ARTTOOLS/RG_TOOLS/RG_Parts/Parts_Maya/QT_UI/Parts_UI/example1.ui')




############# Example 3 ##############

from PySide import QtCore
from PySide import QtGui

from shiboken import wrapInstance

import maya.cmds as cmds
import maya.OpenMayaUI as omui

def maya_main_window():
    main_window_ptr = omui.MQtUtil.mainWindow()
    return wrapInstance(long(main_window_ptr), QtGui.QWidget)

class PrimitiveUi(QtGui.QDialog):

	def __init__(self, parent=maya_main_window()):
		super(PrimitiveUi, self).__init__(parent)

		self.setWindowTitle("Primitives")
		self.setWindowFlags(QtCore.Qt.Tool)
		self.setAttribute(QtCore.Qt.WA_DeleteOnClose)

		self.create_layout()
		self.create_connections()

	def create_layout(self):
		self.cube_btn = QtGui.QPushButton("Cube")
		self.sphere_btn = QtGui.QPushButton("Sphere")
		self.cone_btn = QtGui.QPushButton("Cone")
		self.cylinder_btn = QtGui.QPushButton("Cylinder")

		main_layout = QtGui.QVBoxLayout()
		main_layout.setContentsMargins(2, 2, 2, 2)
		main_layout.setSpacing(2)
		main_layout.addWidget(self.cube_btn)
		main_layout.addWidget(self.sphere_btn)
		main_layout.addWidget(self.cone_btn)
		main_layout.addWidget(self.cylinder_btn)
		main_layout.addStretch()

		self.setLayout(main_layout)

	def create_connections(self):
		self.cube_btn.clicked.connect(PrimitiveUi.make_cube)
		self.sphere_btn.clicked.connect(PrimitiveUi.make_sphere)
		self.cone_btn.clicked.connect(PrimitiveUi.make_cone)
		self.cylinder_btn.clicked.connect(PrimitiveUi.make_cylinder)

	@classmethod
	def make_cube(cls):
		cmds.polyCube()

	@classmethod
	def make_sphere(cls):
		cmds.polySphere()

	@classmethod
	def make_cone(cls):
		cmds.polyCone()

	@classmethod
	def make_cylinder(cls):
		cmds.polyCylinder()					

if __name__ == "__main__":

	try:
		ui.close()
	except:
		pass

	ui = PrimitiveUi()
	ui.show()


################  Example 4 #######################
###############################################################################
# Name: 
#   test_ui_start.py
#
# Description: 
#   Starting point for demonstrating using PySide signals and slots
#
# Author: 
#   Chris Zurbrigg (http://zurbrigg.com)
# http://zurbrigg.com/maya-tutorials/item/signals-and-slots-in-pyside?category_id=24
###############################################################################

import traceback

from PySide import QtCore
from PySide import QtGui

from shiboken import wrapInstance

import maya.cmds as cmds
import maya.OpenMayaUI as omui


def maya_main_window():
    '''
    Return the Maya main window widget as a Python object
    '''
    main_window_ptr = omui.MQtUtil.mainWindow()
    return wrapInstance(long(main_window_ptr), QtGui.QWidget)
    


class TestUi(QtGui.QDialog):
    
    test_signal = QtCore.Signal()
    
    def __init__(self, parent=maya_main_window()):
        super(TestUi, self).__init__(parent)
        
    def create(self):
        '''
        Set up the UI prior to display
        '''
        self.setWindowTitle("TestUi")
        self.setWindowFlags(QtCore.Qt.Tool)
        
        self.create_controls()
        self.create_layout()
        self.create_connections()
        
    def create_controls(self):
        '''
        Create the widgets for the dialog
        '''
        self.push_button = QtGui.QPushButton("QPushButton")
        self.check_box_01 = QtGui.QCheckBox("QCheckBox 01")
        self.check_box_02 = QtGui.QCheckBox("QCheckBox 02")
        
        self.line_edit = QtGui.QLineEdit("QLineEdit")
        self.list_wdg = QtGui.QListWidget()
        self.list_wdg.addItems(["QListWidgetItem 01", 
                                "QListWidgetItem 02", 
                                "QListWidgetItem 03", 
                                "QListWidgetItem 04"])
        self.list_wdg.setCurrentRow(0)
        self.list_wdg.setMaximumHeight(60)
        
    def create_layout(self):
        '''
        Create the layouts and add widgets
        '''
        check_box_layout = QtGui.QHBoxLayout()
        check_box_layout.setContentsMargins(2, 2, 2, 2)
        check_box_layout.addWidget(self.check_box_01)
        check_box_layout.addWidget(self.check_box_02)
        
        main_layout = QtGui.QVBoxLayout()
        main_layout.setContentsMargins(6, 6, 6, 6)
        
        main_layout.addWidget(self.push_button)
        main_layout.addLayout(check_box_layout)
        main_layout.addWidget(self.line_edit)
        main_layout.addWidget(self.list_wdg)
        main_layout.addStretch()
        
        self.setLayout(main_layout)
                
    def create_connections(self):
        '''
        Create the signal/slot connections
        '''
        self.push_button.clicked.connect(self.on_button_pressed)
        
        self.check_box_01.toggled.connect(self.on_check_box_toggled)
        self.check_box_02.toggled.connect(self.on_check_box_toggled)
        
        self.line_edit.textChanged.connect(self.on_text_changed)
        #self.line_edit.editingFinished.connect(self.on_text_changed)
        
        self.list_wdg.currentItemChanged.connect(self.on_selection_changed)
        
        self.test_signal.connect(self.on_test_signal_emitted)
        
        
    #--------------------------------------------------------------------------
    # SLOTS
    #--------------------------------------------------------------------------
    def on_button_pressed(self):
        print("Button pressed")
        
        if self.line_edit.text() == "emit":
            self.test_signal.emit()
        
    def on_check_box_toggled(self):
        #print("Checkbox toggled")
        
        sender = self.sender()
        print("{0} toggled".format(sender.text()))
        
    def on_text_changed(self):
        text = self.line_edit.text()
        print("New text: {0}".format(text))
        
    def on_selection_changed(self, current, previous):
        print("Selection changed")
        print("Current item: {0}".format(current.text()))
        print("Previous item: {0}".format(previous.text()))
    
    def on_test_signal_emitted(self):
        print("Signal received")          
          
              
if __name__ == "__main__":
    
    # Development workaround for PySide winEvent error (in Maya 2014)
    # Make sure the UI is deleted before recreating
    try:
        test_ui.deleteLater()
    except:
        pass
    
    # Create minimal UI object
    test_ui = TestUi()
    
    # Delete the UI if errors occur to avoid causing winEvent
    # and event errors (in Maya 2014)
    try:
        test_ui.create()
        test_ui.show()
    except:
        test_ui.deleteLater()
        traceback.print_exc()