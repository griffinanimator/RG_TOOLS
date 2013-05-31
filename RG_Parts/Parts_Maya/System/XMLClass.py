"""
    XMLDocumnet and XMLNode, for working with xml files

    Created By David Mackenzie
    dave@daveandgoliath.com

    A Very Very Quick example:

    >>> a = XMLDocument("root", filename="C:\\Test.xml")
    >>> root = a.GetRootNode()
    >>> root.AddAttribute("root", "node")
    >>> b = XMLNode("A New Node")
    >>> root.AppendNode(b)
    >>> a.SaveXML()

    To Load XML:

    >>> a = XMLDocument.LoadXML("C:\\Hosts.xml")
    >>> root = a.GetRootNode()
    >>> root
    <XML Node object, tag = 'hosts' at 48583664>
    >>> root.GetChildren()
    [<XML Node object, tag = 'host' at 48520088>, <XML.......
    
"""




import weakref
import xml.etree.ElementTree
from xml.etree.ElementTree import Element, ElementTree

class XMLDocument:
    def __init__(self, root_tag, filename='unnamed.xml', tree=None):
        if tree is None:
            _root = XMLNode(root_tag)
            _tree = ElementTree(_root._element)
        else:
            _root = XMLNode('', parent=None, element=tree.getroot())
            _tree = tree
        
        self._root = _root
        self._tree = _tree
        self.filename = filename
    
    def __str__(self):
        return self.__repr__()
    
    def __repr__(self):
        return '<XML Tree object at %d, file %s>' % (id(self), self.filename)
    
    def AddNode(self, node):
        self._root.AppendNode(node)
    
    def GetRootNode(self):
        return self._root
    
    def DeleteNode(self, node):
        node.parent.DeleteChild(node)
    
    def SaveXML(self):
        self._tree.write(self.filename)
    
    def GetAllNodes(self):
        return self._root.GetChildren()
        
    @staticmethod
    def LoadXML(filename):
        tree = xml.etree.ElementTree.ElementTree(file=filename)
        xml_document = XMLDocument('', tree=tree)
        xml_document.filename = filename
        return xml_document

class XMLNode:
    NodeCache = weakref.WeakValueDictionary()
    def __init__(self, tag, parent=None, element=None):
        if element is None:
            element = Element(tag)
        self._element = element
        self.parent = parent
        XMLNode.NodeCache[self._element] = self
        
    def AppendNode(self, new_node):
        self._element.append(new_node._element)
        new_node.parent = self
    
    def AddAttribute(self, attribute, value):
        if not self._element.attrib.has_key(attribute):
            self._element.attrib[attribute] = value
        else:
            #raise "XML Node already has the attribute %s. Use node.SetAttributeValue" % attribute        
            print "XML Node already has the attribute %s. Use node.SetAttributeValue" % attribute        
    
    def __repr__(self):
        return self.__str__()
    
    def __str__(self):
        return "<XML Node object, tag = '%s' at %d>" % (self._element.tag, id(self))
    
    def __eq__(self, other):
        if self._element == other._element:
            return True
        else:
            return False
    
    def GetAttribute(self, attribute):
        return self._element.attrib[attribute]
    
    def GetAllAttributes(self):
        return self._element.attrib
    
    def SetAttributeValue(self, attribute, value):
        if self._element.attrib.has_key(attribute):
            self._element.attrib[attribute] = value
        else:
            raise "XML Node already has the attribute %s. Use node.AddAttributeValue" % attribute        
    
    def GetChildren(self):
        nodelist = []
        for child in self._element.getchildren():
            try:
                nodelist.append(XMLNode.NodeCache[child])
            except:
                node = XMLNode('', element=child) #this will get cached
                node.parent = self
                nodelist.append(node)
        return nodelist
    
    def DeleteChildren(self):
        children = self._element.getchildren()
        for child in children:
            XMLNode.NodeCache[child].parent = None
            self._element.remove(child)
    
    def DeleteChild(self, child):
            self._element.remove(child._element)
            child.parent = None
    
    def DeleteAttribute(self, attr):
        del self._element.attrib[attr]
    
    def SetText(self, text):
        self._element.text = text
    
    def GetText(self):
        return self._element.text
    
    def SetTag(self, tag):
        self._element.tag = tag
    
    def GetTag(self):
        return self._element.tag

    def HasAttribute(self, attribute):
        if self._element.attrib.has_key(attribute) == True:
            return True
        else:
            return False
    def GetParent(self):
        return self.parent

    """
    def FindSubNode(self, subnode):
        if type(subnode) == str:
            t = self._element.find(subnode)
            a = XMLNode.NodeCache[t]
            return a 
        else:
            raise 'subnode should be str type'
    
    def FindAllSubNodes(self, subnode):
        if type(subnode) == str:
            self._element.findall(subnode)
        else:
            raise 'subnode should be str type'
    """
    
        
