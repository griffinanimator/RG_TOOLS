__author__ = 'Nathan Horne'

#Source code for some common Maya/PyQt functions we will be using
import sip
sip.setapi('QString', 2)
sip.setapi('QVariant', 2)
from PyQt4 import QtGui, QtCore
import maya.OpenMayaUI as apiUI

def getMayaWindow():
	"""
	Get the main Maya window as a QtGui.QMainWindow instance
	@return: QtGui.QMainWindow instance of the top level Maya windows
	"""
	ptr = apiUI.MQtUtil.mainWindow()
	if ptr is not None:
		return sip.wrapinstance(long(ptr), QtCore.QObject)

def toQtObject(mayaName):
	"""
	Convert a Maya ui path to a Qt object
	@param mayaName: Maya UI Path to convert (Ex: "scriptEditorPanel1Window|TearOffPane|scriptEditorPanel1|testButton" )
	@return: PyQt representation of that object
	"""
	ptr = apiUI.MQtUtil.findControl(mayaName)
	if ptr is None:
		ptr = apiUI.MQtUtil.findLayout(mayaName)
	if ptr is None:
		ptr = apiUI.MQtUtil.findMenuItem(mayaName)
	if ptr is not None:
		return sip.wrapinstance(long(ptr), QtCore.QObject)



#This relies on the earlier getMayaWindow() function, so make sure that this code has access to that.
from PyQt4 import uic

#If you put the .ui file for this example elsewhere, just change this path.
listExample_form, listExample_base = uic.loadUiType('c:/example1.ui')
class ListExample(listExample_form, listExample_base):
	def __init__(self, parent=getMayaWindow()):
		super(ListExample, self).__init__(parent)
		self.setupUi(self)

		#The names "addItemBtn" and "removeItemBtn"
		#come from the "objectName" attribute in Qt Designer
		#the attributes to access them are automatically created
		#for us when we call setupUi()
		#Designer ensures that the names are unique for us.
		self.addItemBtn.clicked.connect(self.addItem)
		self.removeItemBtn.clicked.connect(self.removeItem)

	def addItem(self):
		"""
		Add a new item to the end of the listWidget
		"""
		item = QtGui.QListWidgetItem(self.listWidget)
		item.setText('Item #%s!'%self.listWidget.count())

	def removeItem(self):
		"""
		Remove the last item from the listWidget
		"""
		count = self.listWidget.count()
		if count:
			self.listWidget.takeItem(count-1)