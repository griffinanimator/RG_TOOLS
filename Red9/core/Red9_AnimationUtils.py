'''
------------------------------------------
Red9 Studio Pack: Maya Pipeline Solutions
Author: Mark Jackson
email: rednineinfo@gmail.com

Red9 blog : http://red9-consultancy.blogspot.co.uk/
MarkJ blog: http://markj3d.blogspot.co.uk
------------------------------------------

This is the core of the Animation Toolset Lib, a suite of tools 
designed from production experience to automate an animators life.

Setup : Follow the Install instructions in the Modules package
================================================================

Code examples: =================================================

#######################
 ProcessNodes 
#######################

    All of the functions which have the ProcessNodes call share the same
    underlying functionality as described below. This is designed to process the 
    given input nodes in a consistent manor across all the functions. 
    Params: 'nodes' and 'filterSettings' are treated as special and build up a 
    MatchedNode object that contains a tuple of matching pairs based on the given settings.

#######################
 snapTransform example: 
#######################
        
    import Red9_CoreUtils as r9Core
    import maya.cmds as cmds

    #Make a settings object and set the internal filters
    settings=r9Core.FilterNode_Settings()
    settings.nodeTypes='nurbsCurve'
    settings.searchAttrs='Control_Marker'
    settings.printSettings()
    
    #Option 1: Run the snap using the settings object to filter the hierarchies
    #for specific nodes within each root hierarchy
    anim=r9Anim.AnimFunctions()
    anim.snapTransform(nodes=cmds.ls(sl=True),time=r9Anim.timeLineRangeGet(),filterSettings=settings)
    
    #Option 2: Run the snap by passing in an already processed MatchedNodeInput object
    #Make the MatchedNode object and process the hierarchies by passing the settings object in
    matched=r9Core.MatchedNodeInputs(nodes=cmds.ls(sl=True),filterSettings=settings)
    matched.processMatchedPairs()
    for n in matched.MatchedPairs:print n #see what's been filtered
    
    #Rather than passing in the settings or nodes, pass in the already processed MatchedNode
    anim.snapTransform(nodes=matched,time=r9Anim.timeLineRangeGet())
        
'''


from __future__ import with_statement #required only for Maya2009/8
import maya.cmds as cmds
import maya.mel as mel

import Red9.startup.setup as r9Setup
import Red9_CoreUtils as r9Core
import Red9_General as r9General
import Red9_PoseSaver as r9Pose
import Red9_Meta as r9Meta

from functools import partial
import os
import random
import sys

import Red9.packages.configobj as configobj
#import configobj

import logging
logging.basicConfig()
log = logging.getLogger(__name__)
log.setLevel(logging.INFO)



#===========================================================================
# Generic Utility Functions
#===========================================================================

def checkRunTimeCmds():
    '''
    Ensure the RedRuntime Command plugin is loaded. 
    '''
    try:
        if not cmds.pluginInfo('SnapRuntime.py', query=True, loaded=True):
            try:
                cmds.loadPlugin('SnapRuntime.py')
            except:
                raise StandardError('SnapRuntime Plug-in could not be loaded')
    except:
        raise StandardError('SnapRuntime Plug-in not found')
 
def getChannelBoxSelection():
    '''
    return a list of attributes selected in the ChannelBox
    '''
    return cmds.channelBox('mainChannelBox', q=True, selectedMainAttributes=True)

def getChannelBoxAttrs(node=None,asDict=True,incLocked=True):
    '''
    return a dict of attributes in the ChannelBox by their status
    @param node: given node
    @param asDict:  True returns a dict with keys 'keyable','locked','nonKeyable' of attrs
                    False returns a list (non ordered) of all attrs available on the channelBox
    @param incLocked: True by default - whether to include locked channels in the return (only valid if not asDict)
    '''
    statusDict={}
    if not node:
        node = cmds.ls(sl=True, l=True)[0]
    statusDict['keyable']=cmds.listAttr(node, k=True, u=True)
    statusDict['locked'] =cmds.listAttr(node, k=True, l=True)
    statusDict['nonKeyable'] =cmds.listAttr(node,cb=True)
    if asDict:
        return statusDict
    else:
        attrs=[]
        if statusDict['keyable']:
            attrs.extend( statusDict['keyable'])
        if statusDict['nonKeyable']:
            attrs.extend(statusDict['nonKeyable'])
        if incLocked and statusDict['locked']:
            attrs.extend(statusDict['locked'])
        return attrs

def getSettableChannels(node=None, incStatics=True):
    '''
    return a list of settable attributes on a given node
    @param node: node to inspect
    @param incStatics: whether to include non-keyable static channels (On by default)
    
    FIXME: BUG some Compound attrs such as constraints return invalid data for some of the
    base functions using this as they can't be simply set. Do we strip them here?
    ie: pointConstraint.target.targetWeight
    '''
    if not node:
        node = cmds.ls(sl=True, l=True)[0]
    if not incStatics:
        #keyable and unlocked only
        return cmds.listAttr(node, k=True, u=True)
    else:
        #all settable attrs in the channelBox
        return getChannelBoxAttrs(node,asDict=False,incLocked=False)
        

def getAnimLayersFromGivenNodes(nodes):
    '''
    return all animLayers associated with the given nodes
    '''
    if not isinstance(nodes,list):
        #This is a hack as the cmds.animLayer call is CRAP. It doesn't mention
        #anywhere in the docs that you can even pass in Maya nodes, yet alone 
        #that it has to take a list of nodes and fails with invalid flag if not
        nodes=[nodes]
    return cmds.animLayer(nodes, q=True, affectedLayers=True)

def timeLineRangeGet():
    '''
    Return the current PlaybackTimeline OR if a range is selected in the
    TimeLine, (Highlighted in Red) return that instead.
    @rtype: tuple
    @return: (start,end)
    '''
    playbackRange = None
    PlayBackSlider = mel.eval('$tmpVar=$gPlayBackSlider')
    if cmds.timeControl(PlayBackSlider , q=True, rangeVisible=True):
        time = cmds.timeControl(PlayBackSlider , q=True, rangeArray=True)
        playbackRange = (time[0], time[1])
    else:
        playbackRange = (cmds.playbackOptions(q=True, min=True), cmds.playbackOptions(q=True, max=True))
    return playbackRange

def timeLineRangeProcess(start, end, step, incEnds=True):
    '''
    Simple wrapper function to take a given framerange and return
    a list[] containing the actual keys required for processing.
    This manages whether the step is negative, if so it reverses the 
    times. Basically just a wrapper to the python range function.
    '''
    startFrm = start
    endFrm = end
    if step < 0:
        startFrm = end
        endFrm = start
    rng=[time for time in range(int(startFrm), int(endFrm), int(step))]
    if incEnds:
        rng.append(end)
    return rng
 
def animCurveDrawStyle(style='simple', forceBuffer=True, 
                   showBufferCurves=False, displayTangents=False, displayActiveKeyTangents=True, *args):
    '''
    Toggle the state of the graphEditor curve display, used in the Filter and Randomizer to 
    simplify the display abnd the curve whilst processing. This allows you to also pass in 
    the state directly, used by the UI close event to return the editor to the last cached state
    '''
    print 'toggleCalled', style, showBufferCurves, displayTangents, displayActiveKeyTangents

    if style == 'simple':
        print 'toggle On'
        if forceBuffer:
            mel.eval('doBuffer snapshot;')
        mel.eval('animCurveEditor -edit -showBufferCurves 1 -displayTangents false -displayActiveKeyTangents false graphEditor1GraphEd;')
    elif style == 'full':
        print 'toggleOff'
        cmd='animCurveEditor -edit'
        if showBufferCurves:
            cmd+=' -showBufferCurves 1'
        else:
            cmd+=' -showBufferCurves 0'
        if displayTangents:
            cmd+=' -displayTangents true'
        else:
            cmd+=' -displayTangents false'
        if displayActiveKeyTangents:
            cmd+= ' -displayActiveKeyTangents true'
        else:
            cmd+= ' -displayActiveKeyTangents false'
        mel.eval('%s graphEditor1GraphEd;' % cmd)


#def timeLineRangeSet(time):
#    '''
#    Return the current PlaybackTimeline OR if a range is selected in the
#    TimeLine, (Highlighted in Red) return that instead.
#    '''
#    PlayBackSlider = mel.eval('$tmpVar=$gPlayBackSlider')
#    time=cmds.timeControl(PlayBackSlider ,e=True, rangeArray=True, v=time)


def pointOnPolyCmd(nodes):
    '''
    This is a BUG FIX for Maya's command wrapping of the pointOnPolyCon
    which doesn't support namespaces. This deals with that limitation
    '''
    import maya.app.general.pointOnPolyConstraint
    cmds.select(nodes)
    sourceName = nodes[0].split('|')[-1]
    
    cmdstring = "string $constraint[]=`pointOnPolyConstraint -weight 1`;"
    assembled = maya.app.general.pointOnPolyConstraint.assembleCmd()
    
    if ':' in sourceName:
        nameSpace = sourceName.replace(sourceName.split(':')[-1], '')
        assembled = assembled.replace(nameSpace, '')
    print(cmdstring + assembled)
    mel.eval(cmdstring + assembled)
    
def eulerSelected():
    '''
    cheap trick! for selected objects run a Euler Filter and then delete Static curves
    NOTE: delete sc fails if the nodes are in animLayers
    '''
    cmds.filterCurve(cmds.ls(sl=True,l=True))
    cmds.delete(cmds.ls(sl=True,l=True),sc=True)



class AnimationUI(object):
    
    def __init__(self, dockUI=True):
        self.buttonBgc = r9Setup.red9ButtonBGC(1)
        self.win = 'Red9AnimToolsWin'
        self.dockCnt = 'Red9AnimToolsDoc'
        self.label = 'Red9 AnimationTools'
        self.internalConfigPath=False
        self.dock = dockUI
        
        #take generic filterSettings Object
        self.filterSettings = r9Core.FilterNode_Settings()
        self.filterSettings.transformClamp = True
        self.presetDir = os.path.join(r9Setup.red9ModulePath(), 'presets')
        
        #Pose Management variables
        self.posePath = None #working variable
        self.posePathLocal = 'Local Pose Path not yet set' 
        self.posePathProject = 'Project Pose Path not yet set'
        self.posePathMode = 'localPoseMode' # or 'project' : mode of the PosePath field and UI
        self.poseSelected = None 
        self.poseGridMode = 'thumb'  # or text
        self.poseRootMode = 'RootNode' # or MetaRig
        self.poses=None
        self.poseButtonBGC = [0.27,0.3,0.3]        
        self.poseButtonHighLight = [0.7,0.95,0.75]  
        
        #Internal config file setup for the UI state
        if self.internalConfigPath:
            self.ui_optVarConfig = os.path.join(self.presetDir,'__red9config__')
        else:
            self.ui_optVarConfig = os.path.join(r9Setup.mayaPrefs(),'__red9config__')
        self.ANIM_UI_OPTVARS=dict()
        self.__uiCache_readUIElements()

    @classmethod
    def show(cls):
        animUI=cls()
        if r9General.getModifier()=='Ctrl':
            print 'False'
            animUI.dock=False
        animUI._showUI() 
           
    def _showUI(self):
        try:
            #'Maya2011 dock delete'
            if cmds.dockControl(self.dockCnt, exists=True):
                cmds.deleteUI(self.dockCnt, control=True)  
        except:
            self.dock=False
        
        if cmds.window(self.win, exists=True): cmds.deleteUI(self.win, window=True)
        animwindow=cmds.window(self.win , title=self.label)
        
        cmds.menuBarLayout()
        cmds.menu(l="VimeoHelp")
        cmds.menuItem(l="Open Vimeo > WalkThrough",\
                      c="import Red9.core.Red9_General as r9General;r9General.os_OpenFile('https://vimeo.com/56431983')") 
        cmds.menuItem(l="Open Vimeo > HierarchyControl",\
                      c="import Red9.core.Red9_General as r9General;r9General.os_OpenFile('https://vimeo.com/56551684')") 
        cmds.menuItem(l="Open Vimeo > Track or Stabilize",\
                      c="import Red9.core.Red9_General as r9General;r9General.os_OpenFile('https://vimeo.com/33440361')") 
        cmds.menuItem(l="Open Vimeo > CopyKeys & TimeOffsets",\
                      c="import Red9.core.Red9_General as r9General;r9General.os_OpenFile('https://vimeo.com/33440348')") 
        cmds.menuItem(l="Open Vimeo > MirrorSetups",\
                      c="import Red9.core.Red9_General as r9General;r9General.os_OpenFile('https://vimeo.com/57882801')")
        cmds.menuItem(l="Open Vimeo > PoseSaver - Advanced Topics",\
                      c="import Red9.core.Red9_General as r9General;r9General.os_OpenFile('https://vimeo.com/66269033')")          
        cmds.menuItem(divider=True) 
        cmds.menuItem(l="Contact Me",c=lambda *args:(r9Setup.red9ContactInfo()))

        self.MainLayout = cmds.scrollLayout('red9MainScroller',rc=self.__uiCB_resizeMainScroller)
        self.form = cmds.formLayout()
        self.tabs = cmds.tabLayout(innerMarginWidth=5, innerMarginHeight=5)
        cmds.formLayout(self.form, edit=True, attachForm=((self.tabs, 'top', 0), 
                                                          (self.tabs, 'left', 0), 
                                                          (self.tabs, 'bottom', 0), 
                                                          (self.tabs, 'right', 0)))

        #TAB1: ####################################################################
        
        self.AnimLayout = cmds.columnLayout(adjustableColumn=True)
        cmds.separator(h=5, style='none')
        
        #====================
        # CopyAttributes
        #====================
        cmds.frameLayout(label='Copy Attributes', cll=True, borderStyle='etchedOut')
        cmds.columnLayout(adjustableColumn=True)
        cmds.button(label='Copy Attributes', bgc=self.buttonBgc, 
                    ann='CopyAttributes : Modes:\n------------------------------' + \
                     '\nDefault > Selected Object Pairs (Obj2 to Obj1), (Obj3 to Obj4)' + \
                     '\nHierarchy > Uses Selection Filters on Hierarchy Tab' + \
                     '\nCopyToMany > Copy data from First selected to all Subsequent nodes' + \
                     '\nNote: This also handles CharacterSets and SelectionSets if selected, processing all members', 
                    command=partial(self.__uiCall, 'CopyAttrs'))
       
        cmds.separator(h=5, style='none')
        cmds.rowColumnLayout(numberOfColumns=3, columnWidth=[(1, 100), (2, 100), (3, 100)], columnSpacing=[(1, 10), (2, 10)])
        self.uicbCAttrHierarchy = cmds.checkBox('uicbCAttrHierarchy', l='Hierarchy', al='left', v=False, 
                                                ann='Copy Attributes Hierarchy : Filter Hierarchies for transforms & joints then Match NodeNames')
                                                #onc="cmds.checkBox('uicbCAttrToMany', e=True, v=False)")    
        self.uicbCAttrToMany = cmds.checkBox('uicbCAttrToMany', l='CopyToMany', al='left', v=False, 
                                                ann='Copy Matching Attributes from First selected to all Subsequently selected nodes')
                                                #onc="cmds.checkBox('uicbCAttrHierarchy', e=True, v=False)")      
        self.uicbCAttrChnAttrs = cmds.checkBox(ann='Copy only those channels selected in the channelBox', 
                                            l='ChBox Attrs', al='left', v=False)       
        cmds.setParent(self.AnimLayout)
              
        #====================
        # CopyKeys
        #====================
        cmds.separator(h=10, st='in')
        cmds.frameLayout(label='Copy Keys', cll=True, borderStyle='etchedOut')
        cmds.columnLayout(adjustableColumn=True)
        cmds.button(label='Copy Keys', bgc=self.buttonBgc, 
                    ann='CopyKeys : Modes:\n-------------------------' + \
                     '\nDefault > Selected Object Pairs (Obj2 to Obj1), (Obj3 to Obj4)' + \
                     '\nHierarchy > Uses Selection Filters on Hierarchy Tab' + \
                     '\nCopyToMany > Copy data from First selected to all Subsequent nodes' + \
                     '\nNote: This also handles CharacterSets and SelectionSets if selected, processing all members', 
                    command=partial(self.__uiCall, 'CopyKeys'))
       
        cmds.separator(h=5, style='none')
        cmds.rowColumnLayout(numberOfColumns=3, columnWidth=[(1, 100), (2, 100), (3, 100)], columnSpacing=[(1, 10), (2, 10)])
        self.uicbCKeyHierarchy = cmds.checkBox('uicbCKeyHierarchy', l='Hierarchy', al='left', v=False, 
                                            ann='Copy Keys Hierarchy : Filter Hierarchies for transforms & joints then Match NodeNames')#, \
                                            #onc="cmds.checkBox('uicbCKeyToMany', e=True, v=False)")      
        self.uicbCKeyToMany = cmds.checkBox('uicbCKeyToMany', l='CopyToMany', al='left', v=False, 
                                            ann='Copy Animation from First selected to all Subsequently selected nodes')#, \
                                            #onc="cmds.checkBox('uicbCKeyHierarchy', e=True, v=False)")  
        self.uicbCKeyChnAttrs = cmds.checkBox(ann='Copy only those channels selected in the channelBox', 
                                            l='ChBox Attrs', al='left', v=False)   

        cmds.setParent('..')
        cmds.separator(h=2, style='none')  
        cmds.rowColumnLayout(numberOfColumns=3, columnWidth=[(1, 100), (2, 70), (3, 130)], columnSpacing=[(1, 10), (2, 10)])
        self.uicbCKeyRange = cmds.checkBox(ann='ONLY Copy Keys over PlaybackTimeRange or Selected TimeRange (in Red on the timeline)', 
                                            l='TimeRange', al='left', v=False)
        cmds.text(l='Paste by ' , align='right') 
        cmds.optionMenu('om_PasteMethod',
                        ann='Default = "replace", paste method used by the copy code internally',
                        cc=partial(self.__uiCB_setCopyKeyPasteMethod))                                               
        for preset in ["insert", "replace", "replaceCompletely", "merge", "scaleInsert", "scaleReplace", "scaleMerge", "fitInsert", "fitReplace", "fitMerge"]: 
            cmds.menuItem(l=preset)
        cmds.optionMenu('om_PasteMethod', e=True, v='replace')   
        cmds.setParent(self.AnimLayout)


        #====================
        # SnapTransforms
        #====================
        cmds.separator(h=10, st='in')
        cmds.frameLayout(label='Snap Transforms', cll=True, borderStyle='etchedOut')
        cmds.columnLayout(adjustableColumn=True)
        cmds.button(label='Snap Transforms', bgc=self.buttonBgc, 
                     ann='Snap Selected Object Pairs (Obj2 to Obj1), (Obj4 to Obj3) or Snap Filtered Hierarchies' + \
                    '    Note: This also handles CharacterSets if selected, processing all members', 
                     command=partial(self.__uiCall, 'Snap'))
        cmds.separator(h=5, style='none')

        cmds.rowColumnLayout(numberOfColumns=3, columnWidth=[(1, 100), (2, 100), (3, 100)], columnSpacing=[(1, 10), (2, 10)])

        self.uicbSnapRange = cmds.checkBox(ann='Snap Nodes over PlaybackTimeRange or Selected TimeRange (in Red on the timeline)', 
                                            l='TimeRange', al='left', v=False, 
                                            cc=partial(self.__uiCB_manageSnapTime))  
        self.uicbSnapPreCopyKeys = cmds.checkBox(l='PreCopyKeys', al='left', 
                                                 ann='Copy all animation data for all channels prior to running the Snap over Time',
                                                 en=False, v=True)               
        self.uiifgSnapStep = cmds.intFieldGrp('uiifgSnapStep', l='FrmStep', en=False, value1=1, cw2=(50, 40), 
                                           ann='Frames to advance the timeline after each Process Run')
        cmds.separator(h=2, style='none')
        cmds.separator(h=2, style='none')
        cmds.separator(h=2, style='none')
        self.uicbSnapHierarchy = cmds.checkBox(ann='Filter Hierarchies with given args - then Snap Transforms for matched nodes', 
                                            l='Hierarchy', al='left', v=False, 
                                            cc=partial(self.__uiCB_manageSnapHierachy)) 
        self.uicbSnapPreCopyAttrs = cmds.checkBox(ann='Copy all Values for all channels prior to running the Snap', 
                                            l='PreCopyAttrs', al='left', en=False, v=True) 
        self.uiifSnapIterations = cmds.intFieldGrp('uiifSnapIterations', l='Iterations', en=False, value1=1, cw2=(50, 40), 
                                           ann='This is the number of iterations over each hierarchy node during processing, if you get issues during snap then increase this')
        cmds.setParent(self.AnimLayout)  


        #====================
        # Stabilizer
        #====================
        cmds.separator(h=10, st='in')
        cmds.frameLayout(label='Track or Stabilize', cll=True, borderStyle='etchedOut')
        cmds.columnLayout(adjustableColumn=True)
        
        cmds.rowColumnLayout(numberOfColumns=3, columnWidth=[(1, 80), (2, 110), (3, 115)], columnSpacing=[(1, 10), (3, 5)])
        self.uicbStabRange = cmds.checkBox(ann='Process over PlaybackTimeRange or Selected TimeRange (in Red on the timeline)', 
                                            l='TimeRange', al='left', v=False) 
        self.uiifgStabStep = cmds.intFieldGrp('uiifgStabStep', l='FrmStep', value1=1, cw2=(50, 50), 
                                           ann='Frames to advance the timeline between Processing - accepts negative values')
        cmds.button(label='Process', bgc=self.buttonBgc, 
                     ann='Stabilize Mode : Select a SINGLE Object - this will stabilize it in place over time\
                     \nTrack Object Mode : Select TWO Objects - first is source, second will track with offset\
                     \nTrack Component Mode :  Select a Component (poly,vert,edge) then an Object - second will track the component with offset',
                     command=partial(self.__uiCall, 'Stabilize'))   

        cmds.setParent(self.AnimLayout)  
        
        
        #====================
        # TimeOffset
        #====================
        cmds.separator(h=10, st='in')
        cmds.frameLayout(label='TimeOffset', cll=True, borderStyle='etchedOut')
        cmds.columnLayout(adjustableColumn=True)

        cmds.rowColumnLayout(numberOfColumns=3, columnWidth=[(1, 100), (2, 100), (3, 100)], columnSpacing=[(1, 10), (2, 10), (3, 5)])
        self.uicbTimeOffsetHierarchy = cmds.checkBox('uicbTimeOffsetHierarchy', 
                                            l='Hierarchy', al='left', en=True, v=False, 
                                            ann='Offset Hierarchy', 
                                            ofc=partial(self.__uiCB_manageTimeOffsetChecks, 'Off'), 
                                            onc=partial(self.__uiCB_manageTimeOffsetChecks))
              
        self.uicbTimeOffsetScene = cmds.checkBox('uicbTimeOffsetScene', 
                                            l='FullScene', 
                                            ann='ON:Scene Level Processing: OFF:SelectedNode Processing - Offsets Animation, Sound and Clip data as appropriate', 
                                            al='left', v=False, 
                                            ofc=partial(self.__uiCB_manageTimeOffsetChecks, 'Off'), 
                                            onc=partial(self.__uiCB_manageTimeOffsetChecks, 'Full'))    
        
        self.uicbTimeOffsetPlayback = cmds.checkBox('OffsetTimelines', l='OffsetTimelines', 
                                            ann='ON:Scene Level Processing: OFF:SelectedNode Processing - Offsets Animation, Sound and Clip data as appropriate', 
                                            al='left', v=False, en=False)        
        cmds.setParent('..')   
        cmds.separator(h=2, style='none')
        cmds.rowColumnLayout(numberOfColumns=3, columnWidth=[(1, 100), (2, 100), (3, 100)], columnSpacing=[(1, 10), (2, 10), (3, 5)])
        self.uicbTimeOffsetFlocking = cmds.checkBox('uicbTimeOffsetFlocking', 
                                            l='Flocking', al='left', en=True, v=False, 
                                            ann='Offset Selected Nodes by incremental amounts')
        self.uicbTimeOffsetRandom = cmds.checkBox('uicbTimeOffsetRandom', l='Randomizer', 
                                            ann='Randomize the offsets using the offset field as the max such that offsets are random(0,offset)', 
                                            al='left', v=False)  
        self.uiffgTimeOffset = cmds.floatFieldGrp('uiffgTimeOffset', l='Offset ', value1=1, cw2=(35, 60), 
                                            ann='Frames to offset the data by')
        cmds.setParent('..')
        cmds.button(label='Offset', bgc=self.buttonBgc, 
                     ann='If processing at Scene Level then this will offset all appropriate: AnimCurves,Sound and Clips\n\
                     If processing on selected it will deal with each node type as it finds', 
                     command=partial(self.__uiCall, 'TimeOffset'))  
        cmds.setParent(self.AnimLayout) 
        
        
        #====================
        # Mirror Controls
        #====================
        cmds.separator(h=10, st='in')
        cmds.frameLayout(label='Mirror Controls', cll=True, borderStyle='etchedOut')
        cmds.columnLayout(adjustableColumn=True)

        cmds.rowColumnLayout(numberOfColumns=3, columnWidth=[(1, 100), (2, 100), (3, 100)], columnSpacing=[(1, 10), (2, 10), (3, 5)])
        self.uicbMirrorHierarchy = cmds.checkBox('uicbMirrorHierarchy', 
                                            l='Hierarchy', al='left', en=True, v=False, 
                                            ann='Mirror Hierarchy, or Mirror Selected nodes if they have the Mirror Marker data')
              
        cmds.setParent('..')   
        
        cmds.rowColumnLayout(numberOfColumns=2, columnWidth=[(1, 160), (2, 160)], columnSpacing=[(2, 2)])
        cmds.button(label='Mirror Animation', bgc=self.buttonBgc, 
                     ann='Mirror the Animation - NOTE Layers and Trax are NOT supported yet', 
                     command=partial(self.__uiCall, 'MirrorAnim'))  
        cmds.button(label='Mirror Pose', bgc=self.buttonBgc, 
                     ann='Mirror the Current Pose', 
                     command=partial(self.__uiCall, 'MirrorPose'))
 
        cmds.button(label='Symmetry Animation', bgc=self.buttonBgc, 
                     ann='Symmetry the Animation - NOTE Layers and Trax are NOT supported yet', 
                     command=partial(self.__uiCall, 'SymmetryAnim'))  
        cmds.button(label='Symmetry Pose', bgc=self.buttonBgc, 
                     ann='Symmetry the Current Pose', 
                     command=partial(self.__uiCall, 'SymmetryPose'))  
        cmds.setParent(self.AnimLayout) 
        cmds.setParent(self.tabs)
        
    
        #TAB2: ####################################################################
        
        #=====================================================================
        # Hierarchy Controls Main filterSettings Object
        #=====================================================================
        
        self.FilterLayout = cmds.columnLayout(adjustableColumn=True)
        
        cmds.separator(h=15, style='none')
        cmds.text('Filter Settings : A Hierarchy search pattern\n'\
                  'used by all the Hierarchy checkboxes on the main tabs\n'\
                  'Particularly relevant for complex Animation Rigs\n'\
                  'as it allows you to pin-point required controllers\n\n'\
                  'Note that if these are all blank then hierarchy\n'\
                  'checkBoxes will process all children of the roots')
        cmds.separator(h=20,style='in')
                                          
        #This bit is bullshit! the checkBox align flag is now obsolete so the label is always on the left regardless :(                                  
        self.uiclHierarchyFilters = cmds.columnLayout('uiclHierarchyFilters', adjustableColumn=True, enable=True)
        cmds.rowColumnLayout(numberOfColumns=2, columnWidth=[(1,120),(2,200)],columnSpacing=[2,3])
        cmds.text(label='MetaRig',align='right')
        self.uicbMetaRig = cmds.checkBox('uicbMetaRig',
                                          ann='Switch to MetaRig Sub Systems', 
                                          l='', 
                                          v=True,
                                          cc=lambda x:self.__uiCB_managePoseRootMethod('uicbMetaRig'))
        cmds.setParent(self.uiclHierarchyFilters)
        
        self.uitfgSpecificNodeTypes = cmds.textFieldGrp('uitfgSpecificNodeTypes', 
                                            ann='RMB QuickSelector for Common Types : Search for "Specific NodeTypes" in the hierarchy, list separated by ","', 
                                            label='Specific NodeTypes', text="", cw2=(120, 200))
        cmds.popupMenu()
        cmds.menuItem(label='ClearAll', command=partial(self.__uiCB_addToNodeTypes, 'clearAll'))
        cmds.menuItem(label='nodeType : Transform', command=partial(self.__uiCB_addToNodeTypes, 'transform'))
        cmds.menuItem(label='nodeType : NurbsCurves', command=partial(self.__uiCB_addToNodeTypes, 'nurbsCurve'))
        cmds.menuItem(label='nodeType : NurbsSurfaces', command=partial(self.__uiCB_addToNodeTypes, 'nurbsSurface'))
        cmds.menuItem(label='nodeType : Joints', command=partial(self.__uiCB_addToNodeTypes, 'joint'))
        cmds.menuItem(label='nodeType : Locators', command=partial(self.__uiCB_addToNodeTypes, 'locator'))
        cmds.menuItem(label='nodeType : Meshes', command=partial(self.__uiCB_addToNodeTypes, 'mesh'))
        cmds.menuItem(label='nodeType : Cameras', command=partial(self.__uiCB_addToNodeTypes, 'camera'))
        cmds.menuItem(label='nodeType : hikIKEffector', command=partial(self.__uiCB_addToNodeTypes, 'hikIKEffector'))
        cmds.menuItem(label='nodeType : blendShape', command=partial(self.__uiCB_addToNodeTypes, 'blendShape'))
        self.uitfgSpecificAttrs = cmds.textFieldGrp('uitfgSpecificAttrs', 
                                            ann='Search for "Specific Attributes" on Nodes in the hierarchy, list separated by ","', 
                                            label='Search Attributes', text="", cw2=(120, 200))
        self.uitfgSpecificPattern = cmds.textFieldGrp('uitfgSpecificPattern', 
                                            ann='Search for specific nodeName Patterns, list separated by "," - Note this is a Python.regularExpression - ^ clamps to the start, $ clamps to the end', 
                                            label='Search Name Pattern', text="", cw2=(120, 200))        
        cmds.separator(h=5, style='none')
        cmds.text('Internal Node Priorities:')
        self.uitslFilterPriority = cmds.textScrollList('uitslFilterPriority', numberOfRows=8, allowMultiSelection=False, 
                                               height=60, enable=True, append=self.filterSettings.filterPriority)
        cmds.popupMenu()
        cmds.menuItem(label='Clear Process Priorities', command=lambda x:self.__uiSetPriorities('clear'))
        cmds.menuItem(label='Set Priorities from Selected', command=lambda x:self.__uiSetPriorities('set'))
        cmds.menuItem(label='Append Priorities from Selected', command=lambda x:self.__uiSetPriorities('append'))
        cmds.menuItem(label='Remove selected from list', command=lambda x:self.__uiSetPriorities('remove'))
        cmds.menuItem(divider=True)
        cmds.menuItem(label='Move Up', command=lambda x:self.__uiSetPriorities('moveUp'))
        cmds.menuItem(label='Move Down', command=lambda x:self.__uiSetPriorities('moveDown'))        
        cmds.separator(h=20,style='in')
        cmds.text('Available Presets:')      
        self.uitslPresets = cmds.textScrollList(numberOfRows=8, allowMultiSelection=False, 
                                               selectCommand=partial(self.__uiPresetSelection), 
                                               height=80)
        cmds.popupMenu()
        cmds.menuItem(label='DeletePreset', command=partial(self.__uiPresetDelete))
        cmds.menuItem(label='OpenPresetDir', command=partial(self.__uiPresetOpenDir))
        
        cmds.separator(h=10, style='none')
        cmds.rowColumnLayout(numberOfColumns=2, columnWidth=[(1, 140), (2, 162)])
        self.uicbIncRoots = cmds.checkBox('uicbIncRoots',
                                            ann='include RootNodes in the Filter', 
                                            l='Include Roots', 
                                            al='left', v=True,
                                            cc=lambda x:self.__uiCache_storeUIElements())   
        
#        cmds.optionMenuGrp('uiomMatchMethod',label='MatchMethod:',
#                        ann='Default = "replace", paste method used by the copy code internally',
#                        cc=partial(self.__uiCB_setCopyKeyPasteMethod))                                               
#        for preset in ["base","stripPrefix","index"]: 
#            cmds.menuItem(l=preset)
#        cmds.optionMenu('om_PasteMethod', e=True, v='replace')   
            
        self.uicbMatchMethod = cmds.checkBox('uicbMatchMethod',
                                            ann='Match method allow prefix stripping?', 
                                            l='MatchMethod = stripPrefixes', 
                                            al='left', v=True,
                                            cc=lambda x:self.__uiCache_addCheckbox('uicbMatchMethod'))
        cmds.setParent(self.FilterLayout)
        cmds.separator(h=10, style='none')
        cmds.rowColumnLayout(numberOfColumns=2, columnWidth=[(1, 162), (2, 162)])
        cmds.button(label='Test Filter', bgc=self.buttonBgc, 
                     ann='Test the Hierarchy Filter on the selected root node', 
                     command=partial(self.__uiCall, 'HierarchyTest')) 
        cmds.button(label='Store New Filter', bgc=self.buttonBgc, 
                     ann='Store this filterSetting Object', 
                     command=partial(self.__uiPresetStore)) 
        cmds.setParent(self.FilterLayout)
        cmds.setParent(self.tabs)
        

        #TAB3: ####################################################################
        
        #=====================================================================
        # Pose Saver Tab
        #=====================================================================
        
        self.poseUILayout = cmds.columnLayout(adjustableColumn=True)
        cmds.separator(h=10, style='none')
        self.uitfgPosePath = cmds.textFieldButtonGrp('uitfgPosePath', 
                                            ann='PosePath', 
                                            text="", 
                                            bl='PosePath',
                                            bc=lambda *x: self.__uiCB_setPosePath(fileDialog=True),
                                            cc=lambda *x: self.__uiCB_setPosePath(fileDialog=False),
                                            cw=[(1,260),(2,40)])
        
        cmds.rowColumnLayout(nc=2,columnWidth=[(1, 120), (2, 120)],columnSpacing=[(1, 10)])
        self.uircbPosePathMethod = cmds.radioCollection('posePathMode')
        cmds.radioButton('localPoseMode', label='Local Poses',
                                        ann='local mode gives you full control to save,delete and load the library',
                                        onc=partial(self.__uiCB_switchPosePathMode,'local'),
                                        ofc=partial(self.__uiCB_switchPosePathMode,'project'))
        cmds.radioButton('projectPoseMode',label='Project Poses' ,
                                        ann='Project mode disables all but the load functionality of the library',
                                        onc=partial(self.__uiCB_switchPosePathMode,'project'),
                                        ofc=partial(self.__uiCB_switchPosePathMode,'local'))
        cmds.setParent(self.poseUILayout)
        
        cmds.rowColumnLayout(nc=2,columnWidth=[(1, 260), (2, 60)])       
        cmds.textFieldButtonGrp('uitfgPoseSubPath', 
                                            ann='PosePath SubFolders', 
                                            text="", 
                                            bl='SubFolders',
                                            bc=lambda * x:self.__uiCB_switchSubFolders(),
                                            #cc=lambda * x:self.__uiCB_setSubFolder(),
                                            ed=False,
                                            cw=[(1,190),(2,40)])
        cmds.button(label='Clear', 
                     ann='Load Pose data for the given Hierarchy or Selections', 
                     command=partial(self.__uiCB_clearSubFolders)) 
        cmds.setParent(self.poseUILayout)
         
        cmds.separator(h=10, style='in')
        
        if r9Setup.mayaVersion()>2012: #tcc flag not supported in earlier versions
            self.searchFilter=cmds.textFieldGrp('tfPoseSearchFilter', label='searchFilter : ',text='', 
                                                cw=((1,87),(2,160)),
                                                tcc=lambda x:self.__uiCB_fillPoses(searchFilter=cmds.textFieldGrp('tfPoseSearchFilter',q=True,text=True)))         
        else :
            self.searchFilter=cmds.textFieldGrp('tfPoseSearchFilter', label='searchFilter : ',text='', 
                                                cw=((1,87),(2,160)),
                                                fcc=True,
                                                cc=lambda x:self.__uiCB_fillPoses(searchFilter=cmds.textFieldGrp('tfPoseSearchFilter',q=True,text=True)))
        cmds.separator(h=10, style='none')
        
        #SubFolder Scroller
        self.uitslPoseSubFolders = cmds.textScrollList('uitslPoseSubFolders',numberOfRows=8, 
                                                       allowMultiSelection=False, 
                                                       height=350,vis=False)
        
        #Main PoseFields       
        self.uitslPoses = cmds.textScrollList('uitslPoses',numberOfRows=8, allowMultiSelection=False, 
                                               #selectCommand=partial(self.__uiPresetSelection), \
                                               height=350, vis=False)
        self.posePopupText = cmds.popupMenu()
        
        self.uiglPoseScroll = cmds.scrollLayout('uiglPoseScroll', 
                                                cr=True, 
                                                height=350, 
                                                hst=16,  
                                                vst=16, 
                                                vis=False, 
                                                rc=self.__uiCB_gridResize)
        self.uiglPoses = cmds.gridLayout('uiglPoses', cwh=(100,100), cr=False, ag=True)
        self.posePopupGrid = cmds.popupMenu()
        
        cmds.setParent(self.poseUILayout)
        cmds.rowColumnLayout(numberOfColumns=2, columnWidth=[(1, 162), (2, 162)])
        cmds.button('loadPoseButton',label='Load Pose', bgc=self.buttonBgc, 
                     ann='Load Pose data for the given Hierarchy or Selections', 
                     command=partial(self.__uiCall, 'PoseLoad')) 
        cmds.button('savePoseButton',label='Save Pose', bgc=self.buttonBgc, 
                     ann='Save Pose data for the given Hierarchy or Selections', 
                     command=partial(self.__uiCall, 'PoseSave')) 
        cmds.setParent(self.poseUILayout)
        cmds.separator(h=10, style='in')
        cmds.rowColumnLayout(numberOfColumns=2, columnWidth=[(1, 80), (2, 250)])
        self.uicbPoseHierarchy = cmds.checkBox('uicbPoseHierarchy', 
                                            l='Hierarchy', al='left', en=True, v=False, 
                                            ann="Hierarchy: if OFF during Load then the pose will load to the selected nodes IF they're in the pose file",
                                            cc=lambda x:self.__uiCache_addCheckbox('uicbPoseHierarchy'))
        self.uitfgPoseRootNode = cmds.textFieldButtonGrp('uitfgPoseRootNode', 
                                            ann='Hierarchy Root Node for the Pose', 
                                            text="", 
                                            bl='SetRootNode',
                                            bc=lambda * x: self.__uiCB_setPoseRootNode(),
                                            cw=[(1,180),(2,60)])

        cmds.setParent(self.poseUILayout)
        cmds.separator(h=10,style='in')
        self.uicbPoseRelative = cmds.checkBox('uicbPoseRelative', 
                                            l='RelativePose', al='left', en=True, v=False, 
                                            cc=lambda x:self.__uiCB_enableRelativeSwitches())

        cmds.separator(h=5,style='none')
        self.uiflPoseRelativeFrame=cmds.frameLayout('PoseRelativeFrame', label='Relative Offset Methods',cll=True,en=False)
        cmds.rowColumnLayout(nc=3,columnWidth=[(1, 120), (2, 80),(3,80)])
        
        self.uircbPoseRotMethod = cmds.radioCollection('relativeRotate')
        cmds.text(label='Rotate Method')
        cmds.radioButton('rotProjected', label='projected' )
        cmds.radioButton('rotAbsolute', label='absolute' )
        self.uircbPoseTranMethod = cmds.radioCollection('relativeTranslate')
        cmds.text(label='Translate Method')
        cmds.radioButton('tranProjected', label='projected' )
        cmds.radioButton('tranAbsolute', label='absolute' )
        cmds.setParent(self.poseUILayout)
        
        cmds.radioCollection(self.uircbPoseRotMethod, edit=True, select='rotProjected' )
        cmds.radioCollection(self.uircbPoseTranMethod, edit=True, select='tranProjected')
        
        self.uiflPosePointFrame=cmds.frameLayout('PosePointCloud', label='Pose Point Cloud',cll=True,cl=True,en=True)
        cmds.rowColumnLayout(nc=4,columnWidth=[(1,80), (2, 80),(3,80),(4,80)])
        cmds.button(label='Make PPC', bgc=self.buttonBgc, 
                     ann='Make a Pose Point Cloud - have to use hierarchy for this! - optional second selected node is a reference mesh', 
                     command=partial(self.__uiCall, 'PosePC_Make')) 
        cmds.button(label='Delete PPC', bgc=self.buttonBgc, 
                     ann='Delete the current Pose Point Cloud', 
                     command=partial(self.__uiCall, 'PosePC_Delete')) 
        cmds.button(label='Snap Pose', bgc=self.buttonBgc, 
                     ann='Snap the RIG to the PPC pose', 
                     command=partial(self.__uiCall, 'PosePC_Snap')) 
        cmds.button(label='Update PPC', bgc=self.buttonBgc, 
                     ann='Update the PPC to the RIGS current pose', 
                     command=partial(self.__uiCall, 'PosePC_Update')) 
        cmds.setParent(self.poseUILayout)        
        #====================
        #TabsEnd
        #====================
        cmds.tabLayout(self.tabs, edit=True, tabLabel=((self.AnimLayout, 'Animation_Toolkit'), 
                                                       (self.poseUILayout,'PoseManager'),
                                                       (self.FilterLayout, 'Hierarchy_Control')))
        #====================
        # Header
        #====================
        if not r9Setup.mayaVersion()==2009:
            cmds.setParent(self.MainLayout)
        cmds.separator(h=10, style='none')
        self.r9strap=cmds.iconTextButton('r9strap', style='iconOnly', bgc=(0.7, 0, 0), image1='Rocket9_buttonStrap2.bmp', 
                             c=lambda * args:(r9Setup.red9ContactInfo()), h=22, w=340)
        
        #needed for 2009
        cmds.scrollLayout('uiglPoseScroll',e=True,h=330)
        
        #====================
        # Show and Dock
        #====================
        if self.dock:
            try:
                #Maya2011 QT docking
                allowedAreas = ['right', 'left']
                cmds.dockControl(self.dockCnt, area='right', label=self.label, 
                                 content=animwindow, 
                                 floating=False, 
                                 allowedArea=allowedAreas, 
                                 width=350)
            except:
                #Dock failed, opening standard Window
                cmds.showWindow(animwindow)
                cmds.window(self.win, edit=True, widthHeight=(355, 720))
                self.dock = False
        else:
            cmds.showWindow(animwindow)
            cmds.window(self.win, edit=True, widthHeight=(355, 720))
            
        #Set the initial Interface up
        self.__uiPresetsUpdate()
        self.__uiPresetReset() 
        self.__uiCache_loadUIElements()
          

    # UI Callbacks
    #------------------------------------------------------------------------------
    
    def __uiCB_manageSnapHierachy(self, *args):
        '''
        Disable all hierarchy filtering ui's when not running hierarchys
        '''
        val = False
        if cmds.checkBox(self.uicbSnapHierarchy, q=True, v=True):val = True
        cmds.intFieldGrp('uiifSnapIterations', e=True, en=val)
        cmds.checkBox(self.uicbSnapPreCopyAttrs, e=True, en=val)  
            
    def __uiCB_manageSnapTime(self, *args):
        '''
        Disable the frmStep and PreCopy when not running timeline
        '''
        val = False
        if cmds.checkBox(self.uicbSnapRange, q=True, v=True):val = True     
        cmds.checkBox(self.uicbSnapPreCopyKeys, e=True, en=val)        
        cmds.intFieldGrp('uiifgSnapStep', e=True, en=val)
        
    def __uiCB_manageTimeOffsetChecks(self, *args):
        '''
        Disable the frmStep and PreCopy when not running timeline
        '''
        if args[0] == 'Full':
            cmds.checkBox(self.uicbTimeOffsetHierarchy, e=True, v=False)
            cmds.checkBox(self.uicbTimeOffsetPlayback, e=True, en=True)
            cmds.checkBox(self.uicbTimeOffsetFlocking, e=True, en=False)
            cmds.checkBox(self.uicbTimeOffsetRandom, e=True, en=False)
        else:
            cmds.checkBox(self.uicbTimeOffsetPlayback, e=True, en=False)
            cmds.checkBox(self.uicbTimeOffsetScene, e=True, v=False)
            cmds.checkBox(self.uicbTimeOffsetFlocking, e=True, en=True)
            cmds.checkBox(self.uicbTimeOffsetRandom, e=True, en=True)
        
    def __uiCB_addToNodeTypes(self, nodeType, *args):
        '''
        Manage the RMB PopupMenu entries for easy adding nodeTypes to the UI
        '''
        nodeTypes = []
        if nodeType == 'clearAll':
            cmds.textFieldGrp('uitfgSpecificNodeTypes', e=True, text="")
            return
        current = cmds.textFieldGrp('uitfgSpecificNodeTypes', q=True, text=True)    
        if current:
            nodeTypes = current.split(',')
            if nodeType not in nodeTypes:
                nodeTypes.append(nodeType)
            else:
                nodeTypes.remove(nodeType)
        else:
            nodeTypes.append(nodeType)
        cmds.textFieldGrp('uitfgSpecificNodeTypes', e=True, text=','.join(nodeTypes))
 
    def __uiCB_resizeMainScroller(self,*args):
        if self.dock:
            width=cmds.dockControl(self.dockCnt, q=True, w=True)
            height=cmds.dockControl(self.dockCnt, q=True, h=True)
        else:
            newSize=cmds.window(self.win, q=True, wh=True)
            width=newSize[0]
            height=newSize[1]
        if width>350:
            cmds.formLayout(self.form, edit=True, w=width-10)
            #cmds.iconTextButton(self.r9strap, e=True, w=width-10)
        else:
            cmds.scrollLayout(self.MainLayout,e=True,w=350)
        if height>440:
            cmds.scrollLayout('uiglPoseScroll',e=True,h=height-430)
            
    def __uiCB_setCopyKeyPasteMethod(self, *args):
        self.ANIM_UI_OPTVARS['AnimationUI']['keyPasteMethod'] = cmds.optionMenu('om_PasteMethod', q=True, v=True)
        self.__uiCache_storeUIElements()
        
    
    # Preset FilterSettings Object Management
    #------------------------------------------------------------------------------    
    
    def __uiPresetReset(self):
        '''
        Just reset the FilterUI widgets
        '''
        cmds.textFieldGrp('uitfgSpecificNodeTypes', e=True, text="")
        cmds.textFieldGrp('uitfgSpecificAttrs', e=True, text="")
        cmds.textFieldGrp('uitfgSpecificPattern', e=True, text="")
        cmds.textScrollList('uitslFilterPriority', e=True, ra=True)
        cmds.checkBox(self.uicbMetaRig, e=True, v=False)
        
    def __uiPresetsUpdate(self): 
        '''
        Fill the Preset TextField with files in the presets Dirs
        '''
        self.presets = os.listdir(self.presetDir)
        try:
            [self.presets.remove(hidden) for hidden in ['__red9config__','.svn','__config__'] \
                                            if hidden in self.presets]
        except:
            pass
        self.presets.sort()
        cmds.textScrollList(self.uitslPresets, edit=True, ra=True)
        cmds.textScrollList(self.uitslPresets, edit=True, append=self.presets)
        
    def __uiPresetStore(self, *args):
        '''
        Write a new Config Preset for the current UI state. Launches a ConfirmDialog
        '''
        result = cmds.promptDialog(
                title='Preset FileName',
                message='Enter Name:',
                button=['OK', 'Cancel'],
                defaultButton='OK',
                cancelButton='Cancel',
                dismissString='Cancel')
        if result == 'OK':
            self.__uiPresetFillFilter() #Fill the internal filterSettings object from the UI elements 
            self.filterSettings.printSettings()
            path=os.path.join(self.presetDir, '%s.cfg' % cmds.promptDialog(query=True, text=True))
            self.filterSettings.write(path)
            #self.filterSettings.write('%s\%s.cfg' % (self.presetDir, cmds.promptDialog(query=True, text=True)))
            self.__uiPresetsUpdate() 
    
    def __uiPresetDelete(self, *args):
        '''
        Delete the selected preset file from disk
        '''
        preset = cmds.textScrollList(self.uitslPresets, q=True, si=True)[0]
        os.remove(os.path.join(self.presetDir, preset))
        self.__uiPresetsUpdate()
        
    def __uiPresetOpenDir(self,*args):
        import subprocess
        path=os.path.normpath(self.presetDir)
        subprocess.Popen('explorer "%s"' % path)
      
    def __uiPresetSelection(self, Read=True):
        '''
        Fill the UI from on config preset file select in the UI
        '''
        if Read:
            preset = cmds.textScrollList(self.uitslPresets, q=True, si=True)[0]
            self.filterSettings.read(os.path.join(self.presetDir, preset))
            #fill the cache up for the ini file
            self.ANIM_UI_OPTVARS['AnimationUI']['filterNode_preset']=preset
            log.info('preset loaded : %s' % preset)

        #JUST reset the UI elements
        self.__uiPresetReset()
        
        if self.filterSettings.nodeTypes:
            cmds.textFieldGrp('uitfgSpecificNodeTypes', e=True, 
                              text=r9General.forceToString(self.filterSettings.nodeTypes))
        if self.filterSettings.searchAttrs:
            cmds.textFieldGrp('uitfgSpecificAttrs', e=True, 
                                text=r9General.forceToString(self.filterSettings.searchAttrs))
        if self.filterSettings.searchPattern:
            cmds.textFieldGrp('uitfgSpecificPattern', e=True, 
                              text=r9General.forceToString(self.filterSettings.searchPattern))
        if self.filterSettings.filterPriority:
            cmds.textScrollList('uitslFilterPriority', e=True, 
                              append=self.filterSettings.filterPriority)

        cmds.checkBox(self.uicbMetaRig, e=True, v=self.filterSettings.metaRig) 
        cmds.checkBox(self.uicbIncRoots,e=True, v=self.filterSettings.incRoots)
        
        #need to run the callback on the PoseRootUI setup
        self.__uiCB_managePoseRootMethod()
        
        self.filterSettings.printSettings()
        self.__uiCache_storeUIElements()

    def __uiPresetFillFilter(self):
        '''
        Fill the internal filterSettings Object for the AnimationUI class calls
        '''
        self.filterSettings.resetFilters()
        self.filterSettings.transformClamp=True
        
        if cmds.textFieldGrp('uitfgSpecificNodeTypes', q=True, text=True): 
            self.filterSettings.nodeTypes = (cmds.textFieldGrp('uitfgSpecificNodeTypes', q=True, text=True)).split(',')
        if cmds.textFieldGrp('uitfgSpecificAttrs', q=True, text=True): 
            self.filterSettings.searchAttrs = (cmds.textFieldGrp('uitfgSpecificAttrs', q=True, text=True)).split(',')
        if cmds.textFieldGrp('uitfgSpecificPattern', q=True, text=True): 
            self.filterSettings.searchPattern = (cmds.textFieldGrp('uitfgSpecificPattern', q=True, text=True)).split(',')  
        if cmds.textScrollList('uitslFilterPriority', q=True, ai=True):
            self.filterSettings.filterPriority = cmds.textScrollList('uitslFilterPriority', q=True, ai=True)
       
        self.filterSettings.metaRig =cmds.checkBox(self.uicbMetaRig, q=True,v=True)
        self.filterSettings.incRoots=cmds.checkBox(self.uicbIncRoots,q=True,v=True)

        #If the above filters are blank, then the code switches to full hierarchy mode
        if not self.filterSettings.filterIsActive():  
            self.filterSettings.hierarchy = True      
        
    def __uiSetPriorities(self, mode='set',*args):
        if mode=='set' or mode=='clear':
            cmds.textScrollList('uitslFilterPriority', e=True, ra=True)
        if mode=='set' or mode=='append':
            node=[r9Core.nodeNameStrip(node) for node in cmds.ls(sl=True)]
            cmds.textScrollList('uitslFilterPriority', e=True, append=[r9Core.nodeNameStrip(node) for node in cmds.ls(sl=True)])
        
        if mode=='moveUp' or mode=='moveDown' or mode=='remove':
            selected=cmds.textScrollList('uitslFilterPriority', q=True, si=True)[0]
            data=cmds.textScrollList('uitslFilterPriority', q=True, ai=True)
            cmds.textScrollList('uitslFilterPriority', e=True, ra=True)
        if mode=='moveUp':
            data.insert(data.index(selected)-1, data.pop(data.index(selected)))
            cmds.textScrollList('uitslFilterPriority', e=True, append=data)
        if mode=='moveDown':
            data.insert(data.index(selected)+1, data.pop(data.index(selected)))
            cmds.textScrollList('uitslFilterPriority', e=True, append=data)
        if mode=='remove':
            data.remove(selected)
            cmds.textScrollList('uitslFilterPriority', e=True, append=data)
        self.__uiPresetFillFilter()
        self.__uiCache_storeUIElements()
    
    
    #------------------------------------------------------------------------------ 
    #PoseSaver Path Management Callbacks ------------------------------------------
   
    def setPoseSelected(self,val=None,*args):
        '''
        set the PoseSelected cache for the UI calls
        '''
        if not self.poseGridMode=='thumb':
            self.poseSelected=cmds.textScrollList(self.uitslPoses, q=True,si=True)[0]
        else:
            self.poseSelected=val
        log.debug('PoseSelected : %s' % self.poseSelected)
        
    def getPoseSelected(self):
        if not self.poseSelected:
            raise StandardError('No Pose Selected in the UI')
        return self.poseSelected

    def buildPoseList(self):
        '''
        Get a list of poses from the PoseRootDir, this allows us to 
        filter much faster as it stops all the os calls, cached list instead
        '''
        self.poses=[]
        if not os.path.exists(self.posePath):
            log.debug('posePath is invalid')
            return self.poses
        files=os.listdir(self.posePath)
        files.sort()
        for f in files:
            if f.lower().endswith('.pose'):
                self.poses.append(f.split('.pose')[0])
        return self.poses
  
    def buildFilteredPoseList(self,searchFilter):
        filteredPoses=[]
        for pose in self.poses:
            if searchFilter and not searchFilter.upper() in pose.upper():
                continue
            filteredPoses.append(pose)
        return filteredPoses
    
    def __validatePoseFunc(self,func):
        '''
        called in some of the funcs so that they raise an error when called in 'Project' mode
        '''
        if self.posePathMode=='projectPoseMode':
            raise StandardError('%s : function disabled in Project Pose Mode!' % func)
        else:
            return True
         
    def __uiCB_selectPose(self,pose):
        '''
        select the pose in the UI from the name
        '''
        if pose:
            if not self.poseGridMode=='thumb':
                cmds.textScrollList(self.uitslPoses, e=True,si=pose)
            else:
                self.__uiCB_iconGridSelection(pose)

    def __uiCB_switchPosePathMode(self,mode,*args):
        '''
        Switch the Pose mode from Project to Local. In project mode save is disabled.
        Both have different caches to store the 2 mapped root paths
        @param mode: 'local' or 'project', in project the poses are load only, save=disabled
        '''
        if mode=='local':
            self.posePath=os.path.join(self.posePathLocal,self.getPoseSubFolder())
            if not os.path.exists(self.posePath):
                log.warning('No Matching Local SubFolder path found - Reverting to Root')
                self.__uiCB_clearSubFolders()
                self.posePath=self.posePathLocal
                
            self.posePathMode='localPoseMode'
            cmds.button('savePoseButton',edit=True,en=True,bgc=r9Setup.red9ButtonBGC(1))
            cmds.textFieldButtonGrp('uitfgPosePath',edit=True,text=self.posePathLocal)
        elif mode=='project':
            self.posePath=os.path.join(self.posePathProject,self.getPoseSubFolder())
            if not os.path.exists(self.posePath):
                log.warning('No Matching Project SubFolder path found - Reverting to Root')
                self.__uiCB_clearSubFolders()
                self.posePath=self.posePathProject
                
            self.posePathMode='projectPoseMode'
            cmds.button('savePoseButton',edit=True,en=False,bgc=r9Setup.red9ButtonBGC(2))      
            cmds.textFieldButtonGrp('uitfgPosePath',edit=True,text=self.posePathProject)
        cmds.scrollLayout('uiglPoseScroll',edit=True,sp='up') #scroll the layout to the top!
        
        self.ANIM_UI_OPTVARS['AnimationUI']['posePathMode'] = self.posePathMode  
        self.__uiCB_fillPoses(rebuildFileList=True)
            
    def __uiCB_setPosePath(self,path=None,fileDialog=False):
        '''
        Manage the PosePath textfield and build the PosePath
        ''' 
        if fileDialog:
            try:
                if r9Setup.mayaVersion()>=2011:
                    self.posePath=cmds.fileDialog2(fileMode=3,dir=cmds.textFieldButtonGrp('uitfgPosePath',q=True,text=True))[0]
                else:
                    print 'Sorry Maya2009 and Maya2010 support is being dropped'
                    def setPosePath( fileName, fileType):
                        self.posePath=fileName
                    cmds.fileBrowserDialog( m=4, fc=setPosePath, ft='image', an='setPoseFolder', om='Import' )
            except:
                log.warning('No Folder Selected or Given')
        else:
            if not path:
                self.posePath=cmds.textFieldButtonGrp('uitfgPosePath',q=True,text=True)
            else:
                self.posePath=path
                
        cmds.textFieldButtonGrp('uitfgPosePath',edit=True,text=self.posePath)    
        cmds.textFieldButtonGrp('uitfgPoseSubPath',edit=True,text="") 
        #internal cache for the 2 path modes        
        if self.posePathMode=='localPoseMode':
            self.posePathLocal=self.posePath
        else:
            self.posePathProject=self.posePath
        self.__uiCB_pathSwitchInternals()
          
    def __uiCB_pathSwitchInternals(self):           
        '''
        fill the UI Cache and update the poses in eth UI
        '''
        self.__uiCB_fillPoses(rebuildFileList=True)
    
        #fill the cache up for the ini file
        self.ANIM_UI_OPTVARS['AnimationUI']['posePath']=self.posePath
        self.ANIM_UI_OPTVARS['AnimationUI']['poseSubPath']=self.getPoseSubFolder()
        self.ANIM_UI_OPTVARS['AnimationUI']['posePathLocal']=self.posePathLocal
        self.ANIM_UI_OPTVARS['AnimationUI']['posePathProject']=self.posePathProject
        self.ANIM_UI_OPTVARS['AnimationUI']['posePathMode'] = self.posePathMode
        self.__uiCache_storeUIElements()
 
 
    #SubFolder Pose Calls ----------   
    def __uiCB_switchSubFolders(self,*args):
        '''
        switch the scroller from pose mode to subFolder select mode
        note we prefix the folder with '/' to help denote it's a folder in the UI
        '''
        basePath=cmds.textFieldButtonGrp('uitfgPosePath', query=True, text=True)
        
        #turn OFF the 2 main poseScrollers
        cmds.textScrollList(self.uitslPoses, edit=True, vis=False)
        cmds.scrollLayout(self.uiglPoseScroll, edit=True, vis=False)
        #turn ON the subFolder scroller
        cmds.textScrollList(self.uitslPoseSubFolders, edit=True, vis=True)
        cmds.textScrollList(self.uitslPoseSubFolders, edit=True, ra=True)
        
        if not os.path.exists(basePath):
            #path not valid clear all
            log.warning('No current PosePath set')
            return
        
        dirs=[subdir for subdir in os.listdir(basePath) if os.path.isdir(os.path.join(basePath, subdir))]
        if not dirs:
            raise StandardError('Folder has no subFolders for pose scanning')        
        for subdir in dirs:
            cmds.textScrollList(self.uitslPoseSubFolders, edit=True, 
                                            append='/%s' % subdir,
                                            sc=partial(self.__uiCB_setSubFolder))
            
    def __uiCB_setSubFolder(self,*args):
        '''
        Select a subFolder from the scrollList and update the systems
        '''
        basePath=cmds.textFieldButtonGrp('uitfgPosePath', query=True, text=True)
        subFolder=cmds.textScrollList(self.uitslPoseSubFolders, q=True,si=True)[0].split('/')[-1]
        
        cmds.textFieldButtonGrp('uitfgPoseSubPath',edit=True,text=subFolder)
        cmds.textScrollList(self.uitslPoseSubFolders, edit=True, vis=False)
        self.posePath=os.path.join(basePath,subFolder)
        self.__uiCB_pathSwitchInternals()

                  
    def __uiCB_clearSubFolders(self,*args):
        cmds.textScrollList(self.uitslPoseSubFolders, edit=True, vis=False)
        self.__uiCB_setPosePath()
               
         

    #------------------------------------------------------------------------------
    #Build Pose UI calls  -------------------------------------------------------     
     
    def getPoseSubFolder(self):
        '''
        Return the given pose subFolder if set
        '''
        try:
            return cmds.textFieldButtonGrp('uitfgPoseSubPath',q=True,text=True)
        except:
            return "" 
                
    def getPoseDir(self):
        '''
        Return the poseDir including subPath
        '''
        return os.path.join(cmds.textFieldButtonGrp('uitfgPosePath', query=True, text=True),
                            self.getPoseSubFolder()) 
        
    def getPosePath(self):
        '''
        Return the full posePath for loading
        '''
        return os.path.join(self.getPoseDir(), '%s.pose' % self.getPoseSelected())
        
    def getIconPath(self):
        '''
        Return the full posePath for loading
        '''
        return os.path.join(self.getPoseDir(), '%s.bmp' % self.getPoseSelected())   
                           
    def __uiCB_fillPoses(self, rebuildFileList=False, searchFilter=None, *args):
        '''
        Fill the Pose List/Grid from the given directory
        '''

        #Store the current mode to the Cache File
        self.ANIM_UI_OPTVARS['AnimationUI']['poseMode'] = self.poseGridMode 
        self.__uiCache_storeUIElements()
        searchFilter=cmds.textFieldGrp('tfPoseSearchFilter',q=True,text=True)
        
        if rebuildFileList:
            self.buildPoseList()
            log.debug('Rebuilt Pose internal Lists') 
            #Project mode and folder contains NO poses so switch to subFolders
            if not self.poses and self.posePathMode =='projectPoseMode':
                log.warning('No Poses found in Root Project directory, switching to subFolder pickers')
                self.__uiCB_switchSubFolders()
                return
        log.debug( 'searchFilter  : %s : rebuildFileList : %s' %(searchFilter, rebuildFileList))
            
        #TextScroll Layout
        #================================ 
        if not self.poseGridMode=='thumb':
            cmds.textScrollList(self.uitslPoseSubFolders, edit=True, vis=False) #subfolder scroll OFF
            cmds.textScrollList(self.uitslPoses, edit=True, vis=True)           #pose TexScroll ON
            cmds.scrollLayout(self.uiglPoseScroll, edit=True, vis=False)        #pose Grid OFF
            cmds.textScrollList(self.uitslPoses, edit=True, ra=True)            #clear textScroller
            
            if searchFilter:
                cmds.scrollLayout('uiglPoseScroll',edit=True,sp='up')
                
            for pose in self.buildFilteredPoseList(searchFilter):
                cmds.textScrollList(self.uitslPoses, edit=True, 
                                        append=pose,
                                        sc=partial(self.setPoseSelected))
        #Grid Layout
        #================================ 
        else:
            cmds.textScrollList(self.uitslPoseSubFolders, edit=True, vis=False) #subfolder scroll OFF
            cmds.textScrollList(self.uitslPoses, edit=True, vis=False)          #pose TexScroll OFF
            cmds.scrollLayout(self.uiglPoseScroll, edit=True, vis=True)         #pose Grid ON
            self.__uiCB_gridResize()

            #Clear the Grid if it's already filled
            try:
                [cmds.deleteUI(button) for button in cmds.gridLayout(self.uiglPoses,q=True,ca=True)]
            except StandardError,error:
                print error
            for pose in self.buildFilteredPoseList(searchFilter):
                try:
                    #:NOTE we prefix the buttons to get over the issue of non-numeric 
                    #first characters which are stripped my Maya!
                    cmds.iconTextCheckBox( '_%s' % pose, style='iconAndTextVertical', \
                                            image=os.path.join(self.posePath,'%s.bmp' % pose), \
                                            label=pose,\
                                            bgc=self.poseButtonBGC,\
                                            parent=self.uiglPoses,\
                                            ann=pose,\
                                            onc=partial(self.__uiCB_iconGridSelection, pose),\
                                            ofc="import maya.cmds as cmds;cmds.iconTextCheckBox('_%s', e=True, v=True)" % pose) #we DONT allow you to deselect
                except StandardError,error:
                    raise StandardError(error)
             
            if searchFilter:
                #with search scroll the list to the top as results may seem blank otherwise
                cmds.scrollLayout('uiglPoseScroll',edit=True,sp='up')   
          
        #Finally Bind the Popup-menu                
        self.__uiCB_PosePopup()

          
    def __uiCB_PosePopup(self):
        '''
        RMB popup menu for the Pose functions
        '''   
        enableState=True            
        if self.posePathMode=='projectPoseMode':
            enableState=False
            
        if self.poseGridMode=='thumb':
            parent=self.posePopupGrid
            cmds.popupMenu(self.posePopupGrid, e=True, deleteAllItems=True) 
        else:
            parent=self.posePopupText
            cmds.popupMenu(self.posePopupText, e=True, deleteAllItems=True) 
            
        cmds.menuItem(label='Delete Pose', en=enableState, p=parent, command=partial(self.__uiPoseDelete))
        cmds.menuItem(label='Rename Pose', en=enableState, p=parent, command=partial(self.__uiPoseRename))
        cmds.menuItem(label='Select IntenalPose Objects', p=parent, command=partial(self.__uiPoseSelectObjects))
        
        cmds.menuItem(divider=True, p=parent)
        cmds.menuItem(label='Update : Pose Only', en=enableState, p=parent, command=partial(self.__uiPoseUpdate,False))
        cmds.menuItem(label='Update : Pose and Thumb', en=enableState, p=parent, command=partial(self.__uiPoseUpdate,True))
        
        if self.poseGridMode=='thumb':
            cmds.menuItem(label='Update : Thumb Only', p=parent, command=partial(self.__uiPoseUpdateThumb))
            
        cmds.menuItem(divider=True, p=parent)
        cmds.menuItem(label='Make Subfolder', en=enableState, p=parent, command=partial(self.__uiPoseMakeSubFolder))  
        cmds.menuItem(label='Refresh List', en=True, p=parent, command=lambda x: self.__uiCB_fillPoses(rebuildFileList=True))
        cmds.menuItem(divider=True, p=parent)
        cmds.menuItem(label='Debug: Open Pose File', p=parent, command=partial(self.__uiPoseOpenFile))
        cmds.menuItem(label='Debug: Open Pose Directory', p=parent, command=partial(self.__uiPoseOpenDir))
        cmds.menuItem(label='Debug: Pose Compare with current', p=parent, command=partial(self.__uiPoseCompare))
        cmds.menuItem(label='Debug: Copy poseHandler.py to folder', en=enableState, p=parent, command=partial(self.__uiPoseAddPoseHandler))  
        cmds.menuItem(divider=True, p=parent)
        cmds.menuItem(label='Copy Pose >> Project Poses', en=enableState, p=parent, command=partial(self.__uiPoseCopyToProject))     
        
        cmds.menuItem(divider=True, p=parent)
        cmds.menuItem(label='Switch Pose Mode - Thumb/Text', p=parent, command=self.__uiCB_switchPoseMode)

        if self.poseGridMode=='thumb':
            cmds.menuItem(divider=True, p=parent)
            cmds.menuItem(label='Grid Size: Small', p=parent, command=partial(self.__uiCB_setPoseGrid,'small'))
            cmds.menuItem(label='Grid Size: Medium', p=parent, command=partial(self.__uiCB_setPoseGrid,'medium'))
            cmds.menuItem(label='Grid Size: Large', p=parent, command=partial(self.__uiCB_setPoseGrid,'large'))
            
        if self.posePath:
            self.addPopupMenusFromFolderConfig(parent)
                                    
    def addPopupMenusFromFolderConfig(self, parentPopup):
        '''
        if the poseFolder has a poseHandler.py file see if it has the 'posePopupAdditions' func
        and if so, use that to extend the standard menu's
        '''
        poseHandler=r9Pose.getFolderPoseHandler(self.getPoseDir())
        if poseHandler:
            import imp,inspect
            print 'Adding to menus From PoseHandler File!!!!'
            tempPoseFuncs = imp.load_source(poseHandler.split('.py')[0], os.path.join(self.getPoseDir(), poseHandler))
            if [func for name,func in inspect.getmembers(tempPoseFuncs, inspect.isfunction) if name=='posePopupAdditions']:
                #NOTE we pass in self so the new additions have the same access as everything else!
                tempPoseFuncs.posePopupAdditions(parentPopup, self)
            del(tempPoseFuncs)

    def __uiCB_setPoseGrid(self,size,*args):
        '''
        Set size of the Thumnails used in the PoseGrid Layout
        '''
        if size=='small':
            cmds.gridLayout(self.uiglPoses,e=True,cwh=(75,80),nc=4)
        if size=='medium':
            cmds.gridLayout(self.uiglPoses,e=True,cwh=(100,90),nc=3)
        if size=='large':
            cmds.gridLayout(self.uiglPoses,e=True,cwh=(150,120),nc=2)     
        self.__uiCB_fillPoses()
        self.__uiCB_selectPose(self.poseSelected) 
        
    def __uiCB_iconGridSelection(self,current=None,*args):
        '''
        Unselect all other iconTextCheckboxes than the currently selected
        without this you would be able to multi-select the thumbs
        
        NOTE: because we prefix the buttons to get over the issue of non-numeric 
        first characters we now need to strip the first character back off
        '''
        for button in cmds.gridLayout(self.uiglPoses,q=True,ca=True):
            if current and not button[1:]==current:
                cmds.iconTextCheckBox(button,e=True,v=False,bgc=self.poseButtonBGC)
            else:
                cmds.iconTextCheckBox(button,e=True,v=True,bgc=self.poseButtonHighLight)
        self.setPoseSelected(current) 
        
    def __uiCB_gridResize(self,*args):
        if r9Setup.mayaVersion()>=2010:
            cells=int(cmds.scrollLayout('uiglPoseScroll',q=True,w=True)/cmds.gridLayout('uiglPoses',q=True,cw=True))
            cmds.gridLayout('uiglPoses',e=True,nc=cells)
        else:
            log.debug('this call FAILS in 2009???') 
    
    
    #------------------------------------------------------------------------------
    #Main Pose Function Wrappers --------------------------------------------------  
      
    def __uiCB_switchPoseMode(self,*args):
        '''
        Toggle PoseField mode between Grid mode and TextScroll
        '''
        if self.poseGridMode=='thumb':
            self.poseGridMode='text'
        else:
            self.poseGridMode='thumb'
        self.__uiCB_fillPoses()
        self.__uiCB_selectPose(self.poseSelected)     
              
    def __uiCB_savePosePath(self,existingText=None):
        '''
        Build the path for the pose to be saved too
        '''
        result = cmds.promptDialog(
                title='Pose',
                message='Enter Name:',
                button=['OK', 'Cancel'],
                text=existingText,
                defaultButton='OK',
                cancelButton='Cancel',
                dismissString='Cancel')
        if result == 'OK':
            name=cmds.promptDialog(query=True, text=True)
            try:
                if r9Core.validateString(name):
                    return os.path.join(self.getPoseDir(), '%s.pose' % name)
            except ValueError,error:
                raise ValueError(error)
   
    def __uiCB_setPoseRootNode(self):
        '''
        This changes the mode for the Button that fills in rootPath in the poseUI
        Either fills with the given node, or fill it with the connected MetaRig
        '''
        rootNode=cmds.ls(sl=True,l=True)
        
        def fillTextField(text):
            #bound to a function so it can be passed onto the MetaNoode selector UI
            cmds.textFieldButtonGrp('uitfgPoseRootNode',e=True,text=text)
            
        if self.poseRootMode=='RootNode':
            if not rootNode:
                raise StandardError('Warning nothing selected')
            fillTextField(rootNode[0])        
        elif self.poseRootMode=='MetaRoot':
            if rootNode:
                #metaRig=r9Meta.getConnectedMetaNodes(rootNode[0])
                metaRig=r9Meta.getConnectedMetaSystemRoot(rootNode[0])
                if not metaRig:
                    raise StandardError("Warning selected node isn't connected to a MetaRig node")
                fillTextField(metaRig.mNode)
            else:
                metaRigs=r9Meta.getMetaNodes(dataType='mClass')
                if metaRigs:
                    r9Meta.MClassNodeUI(closeOnSelect=True,\
                                        funcOnSelection=fillTextField,\
                                        mInstances=['MetaRig'],\
                                        allowMulti=False)._showUI()
                else:
                    
                    raise StandardError("Warning: No MetaRigs found in the Scene")
        #fill the cache up for the ini file
        self.ANIM_UI_OPTVARS['AnimationUI']['poseRoot']=cmds.textFieldButtonGrp('uitfgPoseRootNode',q=True,text=True)
        self.__uiCache_storeUIElements()
        
    def __uiCB_managePoseRootMethod(self,*args):
        '''
        Manage the PoseRootNode method, either switch to standard rootNode or MetaNode
        '''
        if cmds.checkBox('uicbMetaRig',q=True,v=True):
            self.poseRootMode='MetaRoot'
            cmds.textFieldButtonGrp('uitfgPoseRootNode',e=True,bl='MetaRoot')
        else: 
            self.poseRootMode='RootNode'  
            cmds.textFieldButtonGrp('uitfgPoseRootNode',e=True,bl='SetRoot')
        #self.__uiCache_addCheckbox('uicbMetaRig')
        self.__uiCache_storeUIElements()
        
    def __uiCB_getPoseInputNodes(self):
        '''
        Node passed into the PoseCall itself
        '''
        PoseNodes=[]
        if cmds.checkBox('uicbPoseHierarchy',q=True,v=True):
            #hierarchy processing so we MUST pass a root in
            PoseNodes=cmds.textFieldButtonGrp('uitfgPoseRootNode',q=True,text=True)
            if not PoseNodes or not cmds.objExists(PoseNodes):
                raise StandardError('RootNode not Set for Hierarchy Processing')
        else:
            PoseNodes=cmds.ls(sl=True,l=True)
        if not PoseNodes:
                raise StandardError('No Nodes Set or selected for Pose')
        return PoseNodes
    
    def __uiCB_enableRelativeSwitches(self):
        self.__uiCache_addCheckbox('uicbPoseRelative')
        cmds.frameLayout(self.uiflPoseRelativeFrame, e=True,en=cmds.checkBox(self.uicbPoseRelative,q=True,v=True))
   
                
    def __uiPoseDelete(self,*args):
        self.__validatePoseFunc('DeletePose')
        result = cmds.confirmDialog(
                title='Confirm Pose Delete',
                button=['Yes', 'Cancel'],
                message='confirm deletion of pose file: "%s"' % self.poseSelected,
                defaultButton='Yes',
                cancelButton='Cancel',
                dismissString='Cancel')
        if result == 'Yes':
            try:
                os.remove(self.getPosePath())
            except:
                log.info('Failed to Delete PoseFile')
            try:
                os.remove(self.getIconPath())
            except:
                log.info('Failed to Delete PoseIcon')
            self.__uiCB_fillPoses(rebuildFileList=True)
        
    def __uiPoseRename(self,*args):
        try:
            newName=self.__uiCB_savePosePath(self.getPoseSelected())
        except ValueError,error:
            raise ValueError(error)
        try:
            os.rename(self.getPosePath(), newName)
            os.rename(self.getIconPath(), '%s.bmp' % newName.split('.pose')[0])
        except:
            log.info('Failed to Rename Pose')
        self.__uiCB_fillPoses(rebuildFileList=True)  
        pose=os.path.basename(newName.split('.pose')[0])
        self.__uiCB_selectPose(pose)   
        
    def __uiPoseOpenFile(self,*args):
        import subprocess
        path=os.path.normpath(self.getPosePath())
        subprocess.Popen('notepad "%s"' % path)
        
    def __uiPoseOpenDir(self,*args):
        import subprocess
        path=os.path.normpath(self.getPoseDir())
        subprocess.Popen('explorer "%s"' % path)
     
    def __uiPoseUpdate(self, storeThumbnail, *args):
        self.__validatePoseFunc('UpdatePose')
        result = cmds.confirmDialog(
                title='PoseUpdate',
                message=('<< Replace & Update Pose file >>\n\n%s' % self.poseSelected),
                button=['OK', 'Cancel'],
                defaultButton='OK',
                cancelButton='Cancel',
                dismissString='Cancel')
        if result=='OK':
            if storeThumbnail:
                try:
                    os.remove(self.getIconPath())
                except:
                    log.debug('unable to delete the Pose Icon file')
            self.__PoseSave(self.getPosePath(),storeThumbnail)
            self.__uiCB_selectPose(self.poseSelected)   
    
    def __uiPoseUpdateThumb(self,*args):
        sel=cmds.ls(sl=True,l=True)
        cmds.select(cl=True)
        thumbPath=self.getIconPath()
        if os.path.exists(thumbPath):
            try:
                os.remove(thumbPath)
            except:
                log.error('Unable to delete the Pose Icon file')
        r9General.thumbNailScreen(thumbPath,128,128)
        if sel:
            cmds.select(sel)   
        self.__uiCB_fillPoses()
        self.__uiCB_selectPose(self.poseSelected)   

    def __uiPoseCompare(self,*args):

        mPoseA=r9Pose.PoseData()
        mPoseA.metaPose=True
        mPoseA.buildInternalPoseData(self.__uiCB_getPoseInputNodes())
        compare=r9Pose.PoseCompare(mPoseA,self.getPosePath(),compareDict='skeletonDict')
        
        if not compare.compare():
            info='Selected Pose is different to the rigs current pose\nsee script editor for debug details'
        else:
            info='Poses are the same'
        cmds.confirmDialog( title='Pose Compare Results',
                            button=['Close'],
                            message=info,
                            defaultButton='Close',
                            cancelButton='Close',
                            dismissString='Close')
        
    def __uiPoseSelectObjects(self,*args): 
        '''
        Select matching internal nodes
        '''
        rootNode=cmds.textFieldButtonGrp('uitfgPoseRootNode',q=True,text=True)
        if rootNode and cmds.objExists(rootNode):  
            self.__uiPresetFillFilter() #fill the filterSettings Object
            pose=r9Pose.PoseData(self.filterSettings)
            pose._readPose(self.getPosePath())
            nodes=pose.matchInternalPoseObjects(rootNode)
            if nodes:
                cmds.select(cl=True)
                [cmds.select(node,add=True) for node in nodes]
        else:
            raise StandardError('RootNode not Set for Hierarchy Processing')
      
    def __uiPoseMakeSubFolder(self,*args):
        '''
        Insert a new SubFolder to the posePath, makes the dir and sets 
        it up in the UI to be the current active path
        '''
        basePath=cmds.textFieldButtonGrp('uitfgPosePath', query=True, text=True)
        if not os.path.exists(basePath):
            raise StandardError('Base Pose Path is inValid or not yet set')
        result = cmds.promptDialog(
                title='New Folder Name',
                message='Enter Name:',
                button=['OK', 'Cancel'],
                defaultButton='OK',
                cancelButton='Cancel',
                dismissString='Cancel')
        if result == 'OK':   
            subFolder=cmds.promptDialog(query=True, text=True)
            cmds.textFieldButtonGrp('uitfgPoseSubPath',edit=True,text=subFolder)
            self.posePath=os.path.join(basePath,subFolder)
            os.mkdir(self.posePath)
            self.__uiCB_pathSwitchInternals()
                
    def __uiPoseCopyToProject(self,*args):
        '''
        Copy local pose to the Project Pose Folder
        '''
        import shutil      
        syncSubFolder=True  
        projectPath=self.posePathProject
        if not os.path.exists(self.posePathProject):
            raise StandardError('Project Pose Path is inValid or not yet set')
        if syncSubFolder:
            subFolder=self.getPoseSubFolder()
            projectPath=os.path.join(projectPath,subFolder)
            
            if not os.path.exists(projectPath):
                result = cmds.confirmDialog(
                    title='Add Project Sub Folder',
                    message='Add a matching subFolder to the project pose path?',
                    button=['Make', 'CopyToRoot', 'Cancel'],
                    defaultButton='OK',
                    cancelButton='Cancel',
                    dismissString='Cancel')
                if result == 'Make':
                    try:
                        os.mkdir(projectPath)
                        log.debug('New Folder Added to ProjectPosePath: %s' % projectPath)
                    except:
                        raise StandardError('Failed to make the SubFolder path')
                elif result =='CopyToRoot':
                    projectPath=self.posePathProject
                else:
                    return
            
        log.info('Copying Local Pose: %s >> %s' % (self.poseSelected,projectPath))
        try:
            shutil.copy2(self.getPosePath(),projectPath)
            shutil.copy2(self.getIconPath(),projectPath)
        except:
            raise StandardError('Unable to copy pose : %s > to Project dirctory' % self.poseSelected)
                     
    def __uiPoseAddPoseHandler(self,*args):
        '''
        Copy local pose to the Project Pose Folder
        '''
        import shutil      
        if not os.path.exists(self.posePath):
            raise StandardError('Project Pose Path is inValid or not yet set')
        if os.path.exists(os.path.join(self.posePath,'poseHandler.py')):
            raise StandardError('This folder already contains a poseHandler.py file!!')
        #default template poseHandler.py file
        poseHandlerTemplate=os.path.join(r9Setup.red9ModulePath(),'examples','poseHandler.py')
        
        result = cmds.confirmDialog(
                    title='Add Template poseHanlder.py?',
                    message='WARNING : Advanced Option:\
                            \n===========================\
                            \n\nThis will copy a template poseHandler.py file into\
                            \nthe current folder.\
                            \n\nThis allows you to by-pass the default Node handlers\
                            \nand gives you full control over how the node handler deals\
                            \nwith nodes for ALL POSES in this specific folder',
                    button=['Proceed', 'Abort'],
                    defaultButton='Abort',
                    cancelButton='Abort',
                    dismissString='Abort')
        if result == 'Proceed':
            log.info('Copying template poseHandler.py into folder' )
            try:
                shutil.copy2(poseHandlerTemplate,self.posePath)
            except:
                raise StandardError('Unable to copy poseHandler.py to directory' % self.posePath)
            
        
        
    #------------------------------------------------------------------------------
    #UI Elements ConfigStore Callbacks --------------------------------------------  

    def __uiCache_storeUIElements(self):
        '''
        Store some of the main components of the UI out to an ini file
        '''
        if not self.uiBoot:
            log.debug('UI configFile being written')
            ConfigObj = configobj.ConfigObj(indent_type='\t')
            self.__uiPresetFillFilter() #fill the internal filterSettings obj
            
            ConfigObj['filterNode_settings']=self.filterSettings.__dict__
            ConfigObj['AnimationUI']=self.ANIM_UI_OPTVARS['AnimationUI']
            ConfigObj.filename = self.ui_optVarConfig
            ConfigObj.write()
        
    def __uiCache_loadUIElements(self):
        '''
        Restore the main UI elements from the ini file
        '''
        self.uiBoot=True
        try: 
            log.debug('Loading UI Elements from the config file')
            def __uiCache_LoadCheckboxes():
                if self.ANIM_UI_OPTVARS['AnimationUI'].has_key('checkboxes'):
                    for cb,status in self.ANIM_UI_OPTVARS['AnimationUI']['checkboxes'].items():
                        cmds.checkBox(cb,e=True,v=r9Core.decodeString(status))
                
            AnimationUI=self.ANIM_UI_OPTVARS['AnimationUI']

            if AnimationUI.has_key('filterNode_preset') and AnimationUI['filterNode_preset']:
                cmds.textScrollList(self.uitslPresets, e=True, si=AnimationUI['filterNode_preset'])
                self.__uiPresetSelection(Read=True)   ###not sure on this yet????
                
            if AnimationUI.has_key('keyPasteMethod') and AnimationUI['keyPasteMethod']:
                cmds.optionMenu('om_PasteMethod', e=True, v=AnimationUI['keyPasteMethod'])
            
            if AnimationUI.has_key('poseMode') and AnimationUI['poseMode']:
                self.poseGridMode=AnimationUI['poseMode']
                
            if AnimationUI.has_key('posePathMode') and AnimationUI['posePathMode']:
                self.posePathMode=AnimationUI['posePathMode']        
            if AnimationUI.has_key('posePathLocal') and AnimationUI['posePathLocal']:
                self.posePathLocal=AnimationUI['posePathLocal']
            if AnimationUI.has_key('posePathProject') and AnimationUI['posePathProject']:
                self.posePathProject=AnimationUI['posePathProject']                
            if AnimationUI.has_key('poseSubPath') and AnimationUI['poseSubPath']:
                cmds.textFieldButtonGrp('uitfgPoseSubPath',edit=True,text=AnimationUI['poseSubPath'])
                
            if AnimationUI.has_key('poseRoot') and AnimationUI['poseRoot']:
                if cmds.objExists(AnimationUI['poseRoot']):
                    cmds.textFieldButtonGrp('uitfgPoseRootNode',e=True,text=AnimationUI['poseRoot'])
                    
            __uiCache_LoadCheckboxes()
            
            #callbacks
            cmds.radioCollection(self.uircbPosePathMethod, edit=True, select=self.posePathMode)
            self.__uiCB_enableRelativeSwitches()              # relativePose switch enables
            self.__uiCB_managePoseRootMethod()                # metaRig or SetRootNode for Pose Root
            self.__uiCB_switchPosePathMode(self.posePathMode) # pose Mode - 'local' or 'project'
            
            
        except StandardError,err:
            log.debug('failed to complete UIConfig load')
            log.warning(err)
        finally:
            self.uiBoot=False
                
    def __uiCache_readUIElements(self):
        '''
        read the config ini file for the initial state of the ui
        '''
        try:
            if os.path.exists(self.ui_optVarConfig):
                self.filterSettings.read(self.ui_optVarConfig) #use the generic reader for this
                self.ANIM_UI_OPTVARS['AnimationUI']=configobj.ConfigObj(self.ui_optVarConfig)['AnimationUI']
            else:
                self.ANIM_UI_OPTVARS['AnimationUI']={}
        except:
            pass
        
    def __uiCache_addCheckbox(self,checkbox):
        '''
        Now shifted into a sub dic for easier processing
        '''
        if not self.ANIM_UI_OPTVARS['AnimationUI'].has_key('checkboxes'):
            self.ANIM_UI_OPTVARS['AnimationUI']['checkboxes']={}
        self.ANIM_UI_OPTVARS['AnimationUI']['checkboxes'][checkbox]=cmds.checkBox(checkbox,q=True,v=True)
        self.__uiCache_storeUIElements()
        
        
        
    # MAIN UI FUNCTION CALLS
    #------------------------------------------------------------------------------
    
    def __CopyAttrs(self):
        '''
        Internal UI call for CopyAttrs
        '''
        self.kws['toMany'] = cmds.checkBox(self.uicbCAttrToMany, q=True, v=True)
        if cmds.checkBox(self.uicbCAttrChnAttrs, q=True, v=True):
            self.kws['attributes'] = getChannelBoxSelection()   
        if cmds.checkBox(self.uicbCAttrHierarchy, q=True, v=True): 
            if self.kws['toMany']:
                AnimFunctions(matchMethod=self.matchMethod).copyAttrs_ToMultiHierarchy(cmds.ls(sl=True, l=True), 
                                                          filterSettings=self.filterSettings, 
                                                          **self.kws)
            else:
                AnimFunctions(matchMethod=self.matchMethod).copyAttributes(nodes=None, filterSettings=self.filterSettings, **self.kws)
        else:
            print self.kws
            AnimFunctions(matchMethod=self.matchMethod).copyAttributes(nodes=None, **self.kws) 
            
    def __CopyKeys(self):
        '''
        Internal UI call for CopyKeys call
        '''
        self.kws['toMany'] = cmds.checkBox(self.uicbCKeyToMany, q=True, v=True)
        self.kws['pasteKey']=cmds.optionMenu('om_PasteMethod', q=True, v=True)
        if cmds.checkBox(self.uicbCKeyRange, q=True, v=True):
            self.kws['time'] = timeLineRangeGet()
        if cmds.checkBox(self.uicbCKeyChnAttrs, q=True, v=True):
            self.kws['attributes'] = getChannelBoxSelection()   
        if cmds.checkBox(self.uicbCKeyHierarchy, q=True, v=True):  
            if self.kws['toMany']:
                AnimFunctions(matchMethod=self.matchMethod).copyKeys_ToMultiHierarchy(cmds.ls(sl=True, l=True), 
                                                          filterSettings=self.filterSettings, 
                                                          **self.kws)
            else:
                AnimFunctions(matchMethod=self.matchMethod).copyKeys(nodes=None, filterSettings=self.filterSettings, **self.kws)
        else:
            AnimFunctions(matchMethod=self.matchMethod).copyKeys(nodes=None, **self.kws)
    
    def __Snap(self):
        '''
        Internal UI call for Snap Transforms
        '''
        self.kws['preCopyKeys'] = False
        self.kws['preCopyAttrs'] = False
        self.kws['iterations'] = cmds.intFieldGrp('uiifSnapIterations', q=True, v=True)[0]
        self.kws['step'] = cmds.intFieldGrp('uiifgSnapStep', q=True, v=True)[0]
        self.kws['pasteKey']=cmds.optionMenu('om_PasteMethod', q=True, v=True)
        
        if cmds.checkBox(self.uicbSnapRange, q=True, v=True):
            self.kws['time'] = timeLineRangeGet()
        if cmds.checkBox(self.uicbSnapPreCopyKeys, q=True, v=True):
            self.kws['preCopyKeys'] = True  
        if cmds.checkBox(self.uicbSnapPreCopyAttrs, q=True, v=True):
            self.kws['preCopyAttrs'] = True  
        if cmds.checkBox(self.uicbSnapHierarchy, q=True, v=True):
            AnimFunctions(matchMethod=self.matchMethod).snapTransform(nodes=None, filterSettings=self.filterSettings, **self.kws)     
        else:
            AnimFunctions(matchMethod=self.matchMethod).snapTransform(nodes=None, **self.kws)   
    
    def __Stabilize(self):
        '''
        Internal UI call for Stabilize
        '''
        time = ()
        step = cmds.intFieldGrp('uiifgStabStep', q=True, v=True)[0]
        if cmds.checkBox(self.uicbStabRange, q=True, v=True):
            time = timeLineRangeGet()
        AnimFunctions.stabilizer(cmds.ls(sl=True, l=True), time, step)  
                                      
    def __TimeOffset(self):
        '''
        Internal UI call for TimeOffset
        '''
        offset = cmds.floatFieldGrp('uiffgTimeOffset', q=True, v=True)[0]
        flocking = cmds.checkBox(self.uicbTimeOffsetFlocking, q=True, v=True)
        random = cmds.checkBox(self.uicbTimeOffsetRandom, q=True, v=True)
        if cmds.checkBox(self.uicbTimeOffsetScene, q=True, v=True):
            r9Core.TimeOffset.fullScene(offset, cmds.checkBox(self.uicbTimeOffsetPlayback, q=True, v=True))     
        else:
            if cmds.checkBox(self.uicbTimeOffsetHierarchy, q=True, v=True):
                r9Core.TimeOffset.fromSelected(offset, 
                                               filterSettings=self.filterSettings, 
                                               flocking=flocking, randomize=random)  
            else:
                r9Core.TimeOffset.fromSelected(offset, flocking=flocking, randomize=random)  
   
    def __Hierarchy(self):
        '''
        Internal UI call for Test Hierarchy
        '''
        if cmds.ls(sl=True):
            Filter = r9Core.FilterNode(cmds.ls(sl=True,l=True), filterSettings=self.filterSettings)
            try:
                self.filterSettings.printSettings() 
                cmds.select(Filter.ProcessFilter())
                log.info('=============  Filter Test Results  ==============')     
                print('\n'.join([node for node in Filter.intersectionData]))
                log.info('FilterTest : Object Count Returned : %s' % len(Filter.intersectionData))
            except:                             
                raise StandardError('Filter Returned Nothing')
        else:
            raise StandardError('No Root Node selected for Filter Testing')             
    
    def __PoseSave(self,path=None,storeThumbnail=True):
        '''
        Internal UI call for PoseLibrary
        '''
        if not path:
            try:
                path=self.__uiCB_savePosePath()
            except ValueError,error:
                raise ValueError(error)
        poseHierarchy=cmds.checkBox('uicbPoseHierarchy',q=True,v=True)
        
        r9Pose.PoseData(self.filterSettings).poseSave(self.__uiCB_getPoseInputNodes(), 
                                                      path,
                                                      useFilter=poseHierarchy,
                                                      storeThumbnail=storeThumbnail)
        log.info('Pose Stored to : %s' % path)
        self.__uiCB_fillPoses(rebuildFileList=True)
            
    def __PoseLoad(self):  
        poseHierarchy=cmds.checkBox('uicbPoseHierarchy',q=True,v=True)
        poseRelative=cmds.checkBox('uicbPoseRelative',q=True,v=True)
        rotRelMethod=cmds.radioCollection( self.uircbPoseRotMethod,q=True,select=True)
        tranRelMethod=cmds.radioCollection( self.uircbPoseTranMethod,q=True,select=True)
        relativeRots='projected'
        relativeTrans='projected'
        if not rotRelMethod=='rotProjected':
            relativeRots='absolute'
        if not tranRelMethod=='tranProjected':
            relativeTrans='absolute'
            
        path=self.getPosePath()
        log.info('PosePath : %s' % path)
        r9Pose.PoseData(self.filterSettings).poseLoad(self.__uiCB_getPoseInputNodes(), 
                                                      path,
                                                      useFilter=poseHierarchy,
                                                      relativePose=poseRelative,
                                                      relativeRots=relativeRots,
                                                      relativeTrans=relativeTrans) 
    def __PosePointCloud(self,func):
        '''
        Note: this is dependant on EITHER a wire from the root of the pose to a GEO
        under the attr 'renderMeshes' OR the second selected object is the reference Mesh
        Without either of these you'll just get a locator as the PPC root
        '''
        objs=cmds.ls(sl=True)
 
        ref=objs[0]
        mesh=None
        mRef=r9Meta.MetaClass(self.__uiCB_getPoseInputNodes())
        if mRef.hasAttr('renderMeshes') and mRef.renderMeshes:
            mesh=mRef.renderMeshes[0]
        elif len(objs)==2:
            if cmds.nodeType(cmds.listRelatives(objs[1])[0])=='mesh':
                mesh=objs[1]
        if func=='make':
            if not objs:
                raise StandardError('you need to select a reference object to use as pivot for the PPCloud')
            if cmds.ls('*posePointCloud',r=True):
                raise StandardError('PosePointCloud already exists in scsne')
            if not mesh:
                #turn on locator visibility
                panel=cmds.getPanel(wf=True)
                if 'modelPanel' in panel:
                    cmds.modelEditor(cmds.getPanel(wf=True), e=True, locators=True)
                else:
                    cmds.modelEditor('modelPanel4', e=True, locators=True)
            self.ppc=r9Pose.PosePointCloud(ref,self.__uiCB_getPoseInputNodes(),
                                           self.filterSettings,
                                           mesh=mesh)
        elif func=='delete':
            self.ppc.delete()
        elif func=='snap':
            self.ppc.applyPosePointCloud()
        elif func=='update':
            self.ppc.snapPosePointsToPose()
         
    def __MirrorPoseAnim(self,func):
        '''
        Internal UI call for Mirror Animation / Pose
        '''
        self.kws['pasteKey']=cmds.optionMenu('om_PasteMethod', q=True, v=True)
        mirror=MirrorHierarchy(nodes=cmds.ls(sl=True, l=True), filterSettings=self.filterSettings, **self.kws)
        mirrorMode='Anim'
        if func=='MirrorPose':
            mirrorMode='Pose' 
        if not cmds.checkBox('uicbMirrorHierarchy',q=True,v=True):
            mirror.mirrorData(cmds.ls(sl=True, l=True),mode=mirrorMode)   
        else:
            mirror.mirrorData(mode=mirrorMode)        

    def __SymmetryPoseAnim(self,func):
        '''
        Internal UI call for Mirror Animation / Pose
        '''
        mirror=MirrorHierarchy(nodes=cmds.ls(sl=True, l=True), filterSettings=self.filterSettings)
        mirrorMode='Anim'
        if func=='SymmetryPose':
            mirrorMode='Pose' 
        if not cmds.checkBox('uicbMirrorHierarchy',q=True,v=True):
            mirror.makeSymmetrical(cmds.ls(sl=True, l=True),mode=mirrorMode)   
        else:
            mirror.makeSymmetrical(mode=mirrorMode)     
                      
    # MAIN CALL
    #------------------------------------------------------------------------------                                                                                         
    def __uiCall(self, func, *args):
        '''
        MAIN ANIMATION UI CALL
        '''
        #issue : up to v2011 Maya puts each action into the UndoQueue separately
        #when called by lambda or partial - Fix is to open an UndoChunk to catch
        #everything in one block
        self.kws = {}

        #If below 2011 then we need to store the undo in a chunk
        if r9Setup.mayaVersion() < 2011:
            cmds.undoInfo(openChunk=True)
            
        # Main Hierarchy Filters ============= 
        self.__uiPresetFillFilter() #fill the filterSettings Object
        if cmds.checkBox('uicbMatchMethod',q=True,v=True):
            self.matchMethod='stripPrefix'
        else:
            self.matchMethod='base'
        #self.filterSettings.transformClamp = True
         
        try:
            if func == 'CopyAttrs':
                self.__CopyAttrs()  
            elif func == 'CopyKeys':
                self.__CopyKeys()                        
            elif func == 'Snap':
                self.__Snap()   
            elif func == 'Stabilize':
                self.__Stabilize()
            elif func == 'TimeOffset':
                self.__TimeOffset()
            elif func == 'HierarchyTest':
                self.__Hierarchy()
            elif func == 'PoseSave': 
                self.__PoseSave()    
            elif func == 'PoseLoad':
                self.__PoseLoad()
            elif func == 'PosePC_Make':
                self.__PosePointCloud('make')
            elif func == 'PosePC_Delete':
                self.__PosePointCloud('delete')
            elif func == 'PosePC_Snap':
                self.__PosePointCloud('snap')
            elif func == 'PosePC_Update':
                self.__PosePointCloud('update')
            elif func =='MirrorAnim':
                self.__MirrorPoseAnim(func)
            elif func =='MirrorPose':
                self.__MirrorPoseAnim(func)
            elif func =='SymmetryPose':
                self.__SymmetryPoseAnim(func)
            elif func =='SymmetryAnim':
                self.__SymmetryPoseAnim(func)
                
        except StandardError, error:
            traceback = sys.exc_info()[2] #get the full traceback
            raise StandardError, StandardError(error), traceback
        #except StandardError, error:
        #    raise StandardError(error)
        
        #close chunk
        if mel.eval('getApplicationVersionAsFloat') < 2011:
            cmds.undoInfo(closeChunk=True)     
            
        self.__uiCache_storeUIElements()
            
       
    
#===========================================================================
# Main AnimFunction code class
#===========================================================================
       
class AnimFunctions(object):
    
    def __init__(self,**kws):
        kws.setdefault('matchMethod','stripPrefix')
        
        self.matchMethod=kws['matchMethod'] #gives you the ability to modify the nameMatching method
              
    #===========================================================================
    # Copy Keys
    #===========================================================================

    def copyKeys_ToMultiHierarchy(self, nodes=None, time=(), pasteKey='replace', 
                 attributes=None, filterSettings=None, matchMethod=None, **kws):
        '''
        This isn't the best way by far to do this, but as a quick wrapper
        it works well enough. Really we need to process the nodes more intelligently
        prior to sending data to the copyKeys calls
        '''            
        for node in nodes[1:]:
            self.copyKeys(nodes=[nodes[0], node], 
                          time=time, 
                          attributes=attributes, 
                          pasteKey=pasteKey,
                          filterSettings=filterSettings,
                          toMany=False,
                          matchMethod=matchMethod)
               

    def copyKeys(self, nodes=None, time=(), pasteKey='replace', attributes=None, 
                 filterSettings=None, toMany=False, matchMethod=None, **kws):
        '''
        Copy Keys is a Hi-Level wrapper function to copy animation data between
        filtered nodes, either in hierarchies or just selected pairs. 
                
        @param nodes: List of Maya nodes to process. This combines the filterSettings
            object and the MatchedNodeInputs.processMatchedPairs() call, 
            making it capable of powerful hierarchy filtering and node matching methods.  
        @param filterSettings: Passed into the decorator and onto the FilterNode code
            to setup the hierarchy filters - See docs on the FilterNode_Settings class   
        @param pasteKey: Uses the standard pasteKey option methods - merge,replace,
            insert etc. This is fed to the internal pasteKey method. Default=replace
        @param time: Copy over a given timerange - time=(start,end). Default is
            to use no timeRange. If time is passed in via the timeLineRange() function
            then it will consider the current timeLine PlaybackRange, OR if you have a
            highlighted range of time selected(in red) it'll use this instead.
        @param attributes: Only copy the given attributes[]
        @param matchMethod: arg passed to the match code, sets matchMethod used to match 2 node names
        
        Generic filters passed into r9Core.MatchedNodeInputs class:
        -----------------------------------------------------------------
        @setting.nodeTypes: list[] - search for child nodes of type (wraps cmds.listRelatives types=)
        @setting.searchAttrs: list[] - search for child nodes with Attrs of name 
        @setting.searchPattern: list[] - search for nodes with a given nodeName searchPattern
        @setting.hierarchy: bool = lsHierarchy code to return all children from the given nodes      
        @setting.metaRig: bool = use the MetaRig wires to build the initial Object list up
        
        NOTE: with all the search and hierarchy settings OFF the code performs
        a Dumb copy, no matching and no Hierarchy filtering, copies using 
        selected pairs obj[0]>obj[1], obj[2]>obj[3] etc 
        -----------------------------------------------------------------
        
        TODO: add support in the UI for 'replaceCompletely' paste method....
        '''
        if not matchMethod:matchMethod=self.matchMethod
        log.debug('CopyKey params : nodes=%s\n : time=%s\n : pasteKey=%s\n : attributes=%s\n : filterSettings=%s\n : matchMethod=%s\n'\
                   % (nodes, time, pasteKey, attributes, filterSettings, matchMethod))
                
        #Build up the node pairs to process
        nodeList = r9Core.processMatchedNodes(nodes, 
                                              filterSettings, 
                                              toMany,
                                              matchMethod=matchMethod).MatchedPairs
        
        if nodeList:       
            with r9General.HIKContext([d for _,d in nodeList]):
                for src, dest in nodeList: 
                    try:
                        if attributes:
                            #copy only specific attributes
                            for attr in attributes:
                                if cmds.copyKey(src, attribute=attr, hierarchy=False, time=time):
                                    cmds.pasteKey(dest, attribute=attr, option=pasteKey)
                        else:
                            if cmds.copyKey(src, hierarchy=False, time=time):
                                cmds.pasteKey(dest, option=pasteKey)
                    except:
                        pass
        else:
            raise StandardError('Nothing found by the Hierarchy Code to process')
        return True 
    
    
    #===========================================================================
    # Copy Attributes
    #===========================================================================

    def copyAttrs_ToMultiHierarchy(self, nodes=None, attributes=None, skipAttrs=None, \
                       filterSettings=None, matchMethod=None, **kws):
        '''
        This isn't the best way by far to do this, but as a quick wrapper
        it works well enough. Really we need to process the nodes more intelligently
        prior to sending data to the copyKeys calls
        '''
        for node in nodes[1:]:
            self.copyAttributes(nodes=[nodes[0], node], 
                          attributes=attributes, 
                          filterSettings=filterSettings,
                          skipAttrs=skipAttrs,
                          toMany=False,
                          matchMethod=matchMethod)
            

    def copyAttributes(self, nodes=None, attributes=None, skipAttrs=None, 
                       filterSettings=None, toMany=False, matchMethod=None,**kws):
        '''
        Copy Attributes is a Hi-Level wrapper function to copy Attribute data between
        filtered nodes, either in hierarchies or just selected pairs. 
                
        @param nodes: List of Maya nodes to process. This combines the filterSettings
            object and the MatchedNodeInputs.processMatchedPairs() call, 
            making it capable of powerful hierarchy filtering and node matching methods.      
        @param filterSettings: Passed into the decorator and onto the FilterNode code
            to setup the hierarchy filters - See docs on the FilterNode_Settings class
        @param attributes: Only copy the given attributes[]
        @param skipAttrs: Copy all Settable Attributes OTHER than the given, not
            used if an attributes list is passed
        @param matchMethod: arg passed to the match code, sets matchMethod used to match 2 node names
        
        Generic filters passed into r9Core.MatchedNodeInputs class:
        -----------------------------------------------------------------
        @setting.nodeTypes: list[] - search for child nodes of type (wraps cmds.listRelatives types=)
        @setting.searchAttrs: list[] - search for child nodes with Attrs of name 
        @setting.searchPattern: list[] - search for nodes with a given nodeName searchPattern
        @setting.hierarchy: bool = lsHierarchy code to return all children from the given nodes      
        @setting.metaRig: bool = use the MetaRig wires to build the initial Object list up
        
        NOTE: with all the search and hierarchy settings OFF the code performs
        a Dumb copy, no matching and no Hierarchy filtering, copies using 
        selected pairs obj[0]>obj[1], obj[2]>obj[3] etc 
        -----------------------------------------------------------------

        '''
        if not matchMethod:matchMethod=self.matchMethod
        log.debug('CopyAttributes params : nodes=%s\n : attributes=%s\n : filterSettings=%s\n : matchMethod=%s\n' 
                   % (nodes, attributes, filterSettings, matchMethod))
        
        #Build up the node pairs to process
        nodeList = r9Core.processMatchedNodes(nodes, 
                                              filterSettings, 
                                              toMany, 
                                              matchMethod=matchMethod).MatchedPairs
        
        if nodeList:       
            with r9General.HIKContext([d for _,d in nodeList]):
                for src, dest in nodeList:  
                    try:
                        if attributes:
                            #copy only specific attributes
                            for attr in attributes:
                                if cmds.attributeQuery(attr, node=src, exists=True) \
                                    and cmds.attributeQuery(attr, node=src, exists=True):
                                    cmds.setAttr('%s.%s' % (dest, attr), cmds.getAttr('%s.%s' % (src, attr)))
                        else:
                            attrs = []
                            settableAttrs = getSettableChannels(src,incStatics=True)
                            if skipAttrs:
                                attrs = set(settableAttrs) - set(skipAttrs)
                            else:
                                attrs = settableAttrs
                                
                            for attr in attrs:
                                if cmds.attributeQuery(attr, node=dest, exists=True):
                                    #log.debug('attr : %s.%s' % (dest, attr))
                                    cmds.setAttr('%s.%s' % (dest, attr), cmds.getAttr('%s.%s' % (src, attr)))
                    except:
                        pass
        else:
            raise StandardError('Nothing found by the Hierarchy Code to process')
        return True 
    
    
    #===========================================================================
    # Transform Snapping 
    #===========================================================================
    
    #@processInputNodes 
    def snapTransform(self, nodes=None, time=(), step=1, preCopyKeys=1, preCopyAttrs=1, 
                      filterSettings=None, iterations=1, matchMethod=None,**kws):
        '''
        Snap objects over a timeRange. This wraps the default hierarchy filters
        so it's capable of multiple hierarchy filtering and matching methods.
        The resulting node lists are snapped over time and keyed.  
        @requires: SnapRuntime plugin to be available
        
        @param nodes: List of Maya nodes to process. This combines the filterSettings
            object and the MatchedNodeInputs.processMatchedPairs() call, 
            making it capable of powerful hierarchy filtering and node matching methods.
        @param filterSettings: Passed into the decorator and onto the FilterNode code
            to setup the hierarchy filters - See docs on the FilterNode_Settings class         
        @param time: Copy over a given timerange - time=(start,end). Default is
            to use no timeRange. If time is passed in via the timeLineRange() function
            then it will consider the current timeLine PlaybackRange, OR if you have a
            highlighted range of time selected(in red) it'll use this instead.
        @param step: Time Step between processing when using kws['time'] range
            this accepts negative values to run the time backwards if required
        @param preCopyKeys: Run a CopyKeys pass prior to snap - this means that
            all channels that are keyed have their data taken across         
        @param preCopyAttrs: Run a CopyAttrs pass prior to snap - this means that
            all channel Values on all nodes will have their data taken across    
        @param iterations: Number of times to process the frame.
        @param matchMethod: arg passed to the match code, sets matchMethod used to match 2 node names
         
        NOTE: you can also pass the CopyKey kws in to the preCopy call, see copyKeys above
        
        Generic filters passed into r9Core.MatchedNodeInputs class:
        -----------------------------------------------------------------
        @setting.nodeTypes: list[] - search for child nodes of type (wraps cmds.listRelatives types=)
        @setting.searchAttrs: list[] - search for child nodes with Attrs of name 
        @setting.searchPattern: list[] - search for nodes with a given nodeName searchPattern
        @setting.hierarchy: bool = lsHierarchy code to return all children from the given nodes      
        @setting.metaRig: bool = use the MetaRig wires to build the initial Object list up
        
        NOTE: with all the search and hierarchy settings OFF the code performs
        a Dumb copy, no matching and no Hierarchy filtering, copies using 
        selected pairs obj[0]>obj[1], obj[2]>obj[3] etc 
        -----------------------------------------------------------------    
        '''
        self.snapCacheData = {} #TO DO - Cache the data and check after first run data is all valid
        skipAttrs = ['translateX', 'translateY', 'translateZ', 'rotateX', 'rotateY', 'rotateZ']
        if not matchMethod:matchMethod=self.matchMethod
        try:
            checkRunTimeCmds()
        except StandardError, error:
            raise StandardError(error)
            
        log.debug('snapTransform params : nodes=%s : time=%s : step=%s : preCopyKeys=%s : \
                    preCopyAttrs=%s : filterSettings=%s : matchMethod=%s' \
                   % (nodes, time, step, preCopyKeys, preCopyAttrs, filterSettings, matchMethod))
        
        #Build up the node pairs to process
        nodeList = r9Core.processMatchedNodes(nodes, 
                                              filterSettings, 
                                              matchMethod=matchMethod)
        
        if nodeList.MatchedPairs:    
            nodeList.MatchedPairs.reverse() #reverse order so we're dealing with children before their parents
            
            if preCopyAttrs:
                self.copyAttributes(nodes=nodeList, skipAttrs=skipAttrs, filterSettings=filterSettings, **kws)
            
            if time:
                with r9General.AnimationContext(): #Context manager to restore settings
                    
                    cmds.autoKeyframe(state=False)   
                    #run a copyKeys pass to take all non transform data over  
                    #maybe do a channel attr pass to get non-keyed data over too?                   
                    if preCopyKeys: 
                        self.copyKeys(nodes=nodeList, time=time, filterSettings=filterSettings, **kws)
                           
                    for t in timeLineRangeProcess(time[0], time[1], step, incEnds=True):
                        dataAligned = False
                        processRepeat = iterations
                       
                        while not dataAligned:
                            for src, dest in nodeList.MatchedPairs:     
                                #we'll use the API MTimeControl in the runtime function 
                                #to update the scene without refreshing the Viewports
                                cmds.currentTime(t, e=True, u=False)
                                #pass to the plug-in SnapCommand
                                cmds.SnapTransforms(source=src, destination=dest, timeEnabled=True)    
                                #fill the snap cache for error checking later
                                #self.snapCacheData[dest]=data
                                cmds.setKeyframe(dest, at='translate')
                                cmds.setKeyframe(dest, at='rotate')
                                log.debug('Snapfrm %s : %s - %s : to : %s' % (str(t), r9Core.nodeNameStrip(src), dest, src))
        
                            processRepeat -= 1   
                            if not processRepeat:
                                dataAligned = True
            else:
                for _ in range(0, iterations):
                    for src, dest in nodeList.MatchedPairs:
                        cmds.SnapTransforms(source=src, destination=dest, timeEnabled=False) 
                        #self.snapCacheData[dest]=data 
                        log.debug('Snapped : %s - %s : to : %s' % (r9Core.nodeNameStrip(src), dest, src))   
        else:
            raise StandardError('Nothing found by the Hierarchy Code to process')
        return True 


    def snapValidateResults(self):
        '''
        Run through the stored snap values to see if, once everything is processed,
        all the nodes still match. ie, you snap the Shoulders and strore the results,
        then at the end of the process you find that the Shoulders aren't in the same
        position due to a driver controller shifting it because of hierarchy issues.
        TO IMPLEMENT
        '''
        raise NotImplemented
    
    @staticmethod
    def snap(nodes=None):
        '''
        This takes 2 given transform nodes and snaps them together. It takes into 
        account offsets in the pivots of the objects. Uses the API MFnTransform nodes
        to calculate the data via a command plugin. This is a stripped down version
        of the snapTransforms cmd
        '''
        try:
            checkRunTimeCmds()
        except StandardError, error:
            raise StandardError(error)
        
        if not nodes:
            nodes = cmds.ls(sl=True, l=True)
        if nodes:
            if not len(nodes) >= 2:
                raise StandardError('Please select at least 2 base objects for the SnapAlignment')
        else:
            raise StandardError('Please select at least 2 base objects for the SnapAlignment')
        
        #pass to the plugin SnapCommand
        for node in nodes[1:]:
            cmds.SnapTransforms(source=nodes[0], destination=node)
 
        
    @staticmethod
    def stabilizer(nodes=None, time=(), step=1):
        '''
        This is designed with 2 specific functionalities:
        If you have a single node selected it will stabilize it regardless 
        of it's inputs or parent hierarchy animations
        If you pass in 2 objects then it will Track B to A (same order as constraints)
        This is primarily designed to aid in MoCap cleanup and character interactions.
        This now also allows for Component based track inputs, ie, track this 
        nodes to this poly's normal

        @param nodes: either single (Stabilize) or twin to track
        @param time: [start,end] for a frameRange 
        @param step: int value for frame advance between process runs         
        '''
        
        #destObj = None  #Main Object being manipulated and keyed
        #snapRef = None  #Tracking ReferenceObject Used to Pass the transforms over
        deleteMe = []
        
        #can't use the anim context manager here as that resets the currentTime
        autokeyState = cmds.autoKeyframe(query=True, state=True)
        cmds.autoKeyframe(state=False)
        
        try:
            checkRunTimeCmds()
        except StandardError, error:
            raise StandardError(error)
        
        if time:
            timeRange = timeLineRangeProcess(time[0], time[1], step, incEnds=True)
            cmds.currentTime(timeRange[0], e=True) #ensure that the initial time is updated 
        else:
            timeRange = [cmds.currentTime(q=True) + step]  
        log.debug('timeRange : %s', timeRange)
        
        if not nodes:
            nodes = cmds.ls(sl=True, l=True)
             
        destObj = nodes[-1]  
        snapRef = cmds.spaceLocator()[0]   
        deleteMe.append(snapRef)
        
        #Generate the reference node that we'll use to snap too 
        #==========================================================
        if len(nodes) == 2:  
            # Tracker Mode 2 nodes passed in - Reference taken against the source node position  
            offsetRef = nodes[0]
            
            if cmds.nodeType(nodes[0]) == 'mesh':  #Component level selection method
                if r9Setup.mayaVersion() >= 2011:
                    offsetRef = cmds.spaceLocator()[0]
                    deleteMe.append(offsetRef)
                    cmds.select([nodes[0], offsetRef])
                    pointOnPolyCmd([nodes[0], offsetRef])
                else:
                    raise StandardError('Component Level Tracking is only available in Maya2011 upwards')
            
            cmds.parent(snapRef, offsetRef)
            cmds.SnapTransforms(source=destObj, destination=snapRef)
        else:
            # Stabilizer Mode - take the reference from the node position itself
            cmds.SnapTransforms(source=destObj, destination=snapRef)

        #Now run the snap against the reference node we've just made
        #==========================================================
        for time in timeRange:
            #Switched to using the Commands time query to stop  the viewport updates
            cmds.currentTime(time, e=True, u=False)
            cmds.SnapTransforms(source=snapRef, destination=destObj, timeEnabled=True) 
            try:
                cmds.setKeyframe(destObj, at='translate')
            except:
                pass
            try:
                cmds.setKeyframe(destObj, at='rotate')
            except:
                pass
                      
        cmds.delete(deleteMe)         
        cmds.autoKeyframe(state=autokeyState)               
        cmds.select(nodes)
        
        
    def bindNodes(self, nodes=None, attributes=None, filterSettings=None, 
                  bindMethod='connect', matchMethod=None, **kws):
        '''
        Copy Keys is a Hi-Level wrapper function to copy animation data between
        filtered nodes, either in hierarchies or just selected pairs. 
                
        @param nodes: List of Maya nodes to process. This combines the filterSettings
            object and the MatchedNodeInputs.processMatchedPairs() call, 
            making it capable of powerful hierarchy filtering and node matching methods.
        @param filterSettings: Passed into the decorator and onto the FilterNode code
            to setup the hierarchy filters - See docs on the FilterNode_Settings class    
        @param attributes: Only copy the given attributes[]
        @param bindMethod: method of binding the data
        @param matchMethod: arg passed to the match code, sets matchMethod used to match 2 node names
        #TODO: expose this to the UI's!!!!
        '''
        
        if not matchMethod:matchMethod=self.matchMethod
        log.debug('bindNodes params : nodes=%s : attributes=%s : filterSettings=%s : matchMethod=%s' \
                   % (nodes,  attributes, filterSettings, matchMethod))

        #Build up the node pairs to process
        nodeList = r9Core.processMatchedNodes(nodes, 
                                              filterSettings, 
                                              toMany=False, 
                                              matchMethod=matchMethod).MatchedPairs
        if nodeList:       
            for src, dest in nodeList: 
                try:
                    if bindMethod=='connect':
                        if not attributes:
                            attributes = ['rotateX', 'rotateY', 'rotateZ', 'translateX', 'translateY', 'translateZ']   
                        #Bind only specific attributes
                        for attr in attributes:
                            log.info('Attr %s bindNode from %s to>> %s' %(attr,r9Core.nodeNameStrip(src), 
                                                                          r9Core.nodeNameStrip(dest))) 
                            try:
                                cmds.connectAttr('%s.%s' % (src, attr), '%s.%s' % (dest, attr), f=True)
                            except:
                                log.info('bindNode from %s to>> %s' %(r9Core.nodeNameStrip(src), 
                                                                      r9Core.nodeNameStrip(dest))) 
                    if bindMethod=='constraint':
                        cmds.parentConstraint(src,dest,mo=True)
                except:
                    pass
        else:
            raise StandardError('Nothing found by the Hierarchy Code to process')
        return True 
          
    @staticmethod    
    def inverseAnimChannels(node, channels, time=None):
        '''
        really basic method used in the Mirror calls
        '''
        #for chan in channels:
            #cmds.scaleKey('%s_%s' % (node,chan),vs=-1)
        if not channels:
            log.debug('abort: no animChannels passed in to inverse')
            return
        if time:
            cmds.scaleKey(node,valueScale=-1,attribute=channels,time=time)
        else:
            cmds.scaleKey(node,valueScale=-1,attribute=channels)
            
            
    @staticmethod
    def inverseAttributes(node, channels):
        '''
        really basic method used in the Mirror calls
        '''
        for chan in channels:
            try:
                cmds.setAttr('%s.%s' % (node,chan), cmds.getAttr('%s.%s' % (node,chan))*-1)
            except:
                log.debug(cmds.getAttr('%s.%s' % (node,chan))*-1)
                log.debug('failed to inverse %s.%s attr' % (node,chan))
  

class curveModifierContext(object):
    """
    Simple Context Manager to allow modifications to animCurves in the 
    graphEditor interactively by simply managing the undo stack and making
    sure that selections are maintained
    NOTE that this is optimized to run with a floatSlider and used in both interactive
    Randomizer and FilterCurves
    """        
    
    def __init__(self, initialUndo=False, undoFuncCache=[], undoDepth=1):
        '''
        @param initialUndo: on first process whether undo on entry to the context manager
        @param undoFuncCache: functions to catch in the undo stack
        @param undoDepth: depth of the undo stack to go to
        '''
        self.initialUndo = initialUndo
        self.undoFuncCache = undoFuncCache
        self.undoDepth = undoDepth
    
    def undoCall(self):
        for _ in range(1, self.undoDepth + 1):
            #log.depth('undoDepth : %s' %  i)
            if [func for func in self.undoFuncCache if func in cmds.undoInfo(q=True,undoName=True)]:
                cmds.undo()
                      
    def __enter__(self):
        if self.initialUndo:
            self.undoCall()
        cmds.undoInfo(openChunk=True)
        
        self.range=None
        self.keysSelected=cmds.keyframe(q=True, n=True, sl=True)
        
        if self.keysSelected:
            self.range=cmds.keyframe(q=True,sl=True, timeChange=True)
            
    def __exit__(self, exc_type, exc_value, traceback):
        if self.keysSelected and self.range:
            cmds.selectKey(self.keysSelected, t=(self.range[0],self.range[-1]))
        cmds.undoInfo(closeChunk=True)
        if exc_type:
            log.exception('%s : %s'%(exc_type, exc_value))
        # If this was false, it would re-raise the exception when complete
        return True 



class RandomizeKeys(object):
    '''
    This is a simple implementation of a Key Randomizer, designed to add
    noise to animations  
    TODO: add in methods to generate secades type of flicking randomization, current
    implementation is too regular.  
    '''
    def __init__(self):
        self.win='KeyRandomizerOptions' 
        self.contextManager=curveModifierContext
        self.dragActive=False
        self.toggledState=False
        
        #catch the current state of the GrapthEditor so that the toggle respects it
        self.displayTangents = cmds.animCurveEditor('graphEditor1GraphEd', q=True, displayTangents=True)
        self.displayActiveKeyTangents = cmds.animCurveEditor('graphEditor1GraphEd', q=True, displayActiveKeyTangents=True)
        if cmds.animCurveEditor('graphEditor1GraphEd', q=True, showBufferCurves=True)=='on':
            self.showBufferCurves = True
        else:
            self.showBufferCurves = False
        
    def noiseFunc(self,initialValue,randomRange,damp):
        '''
        really simple noise func, maybe I'll flesh this out at somepoint
        '''
        return initialValue + (random.uniform(randomRange[0],randomRange[1])*damp)
    
    @classmethod
    def showOptions(cls):
        cls()._showUI()
        
    def _showUI(self):
                 
            if cmds.window(self.win, exists=True): cmds.deleteUI(self.win, window=True)
            cmds.window(self.win, title="KeyRandomizer", s=True, widthHeight=(320,280))
            cmds.menuBarLayout()
            cmds.menu(l="VimeoHelp")
            cmds.menuItem(l="Open Vimeo Help File",
                          ann='simple demo showing the functionality of Simplify curve and Randomizer',
                          c="import Red9.core.Red9_General as r9General;r9General.os_OpenFile('https://vimeo.com/69270932')")
            #cmds.menuItem(divider=True) 
            cmds.menuItem(l="Contact Me",c=r9Setup.red9ContactInfo)
            cmds.columnLayout(adjustableColumn=True,columnAttach=('both',5))
            cmds.separator(h=15, style='none')
            
            cmds.floatFieldGrp('ffg_rand_damping', label='strength : value', v1=1, precision=2)
            cmds.floatFieldGrp('ffg_rand_frmStep', label='frameStep', v1=1, en=False, precision=2)
            cmds.separator(h=20, style='in')

            cmds.rowColumnLayout(numberOfColumns=2,columnWidth=[(1,150),(2,150)])
            cmds.checkBox('cb_rand_current',
                          l='Current Keys Only',v=True,
                          ann='ONLY randomize selected keys, if OFF the core will add keys to the curve at the frameStep incremenet',
                          cc=self.__uicb_currentKeysCallback) 
            cmds.checkBox('cb_rand_percent',
                          l='Pre-Normalize Curves', v=True,
                          ann='Pre-Normalize: process based on value percentage range auto-calculated from curves',
                          cc=self.__uicb_percentageCallback) 
            #cmds.checkBox('cb_rand_ignoreBounds',
            #              l='Ignore Start and End Keys', v=True,
            #              ann='Remove the first and last key from processing, maintaining any animation cycles') 
            cmds.setParent('..')
            cmds.separator(h=15, style='in')          
            cmds.checkBox('interactiveRand', value=False, label="Interactive Mode", 
                          ann="Turn on the interactiveMode - ONLY supported in CurrentKeys mode",
                          onc=lambda *x:self.__uicb_interactiveMode(True),
                          ofc=lambda *x:self.__uicb_interactiveMode(False)) 
            cmds.separator(h=10, style='none')     
                
            cmds.rowColumnLayout('interactiveLayout', numberOfColumns=3, columnWidth=[(1,220),(2,40),(3,30)])       
            cmds.floatSliderGrp('fsg_randfloatValue',
                                    field=True, 
                                    minValue=0, 
                                    maxValue=1.0,
                                    pre=2,
                                    value=0,\
                                    columnWidth=[(1, 40),  (2, 100)],
                                    dc=self.interactiveWrapper)
            cmds.floatField('ffg_rand_intMax', v=1, precision=2, cc=self.__uicb_setRanges) 
            cmds.text(label='max') 
            cmds.setParent('..')

            cmds.separator(h=15,style='none')  
            
            cmds.rowColumnLayout(numberOfColumns=3,columnWidth=[(1,100),(2,100),(3,100)])
            cmds.button(label='Apply', bgc=r9Setup.red9ButtonBGC(1),
                         command=self.curveMenuFunc)   
            cmds.button(label='SavePref', bgc=r9Setup.red9ButtonBGC(1),
                         command=self.__storePrefs)
            cmds.button(label='ToggleBuffers', bgc=r9Setup.red9ButtonBGC(1),
                         command=self.__uicb_toggleGraphDisplay)
            cmds.setParent('..')
            
            cmds.separator(h=15,style='none')  
            cmds.iconTextButton( style='iconOnly', bgc=(0.7,0,0),image1='Rocket9_buttonStrap2.bmp',
                                 c=r9Setup.red9ContactInfo,h=22,w=200 )
            cmds.showWindow(self.win)
            cmds.window('KeyRandomizerOptions', e=True, widthHeight=(320,280))
            self.__uicb_interactiveMode(False)
            self.__loadPrefsToUI()
            
            #set close event to restore stabndard GraphEditor curve status
            cmds.scriptJob(runOnce=True, uiDeleted=[self.win, lambda *x:animCurveDrawStyle(style='full', forceBuffer=False,
                                                                                      showBufferCurves=self.showBufferCurves,
                                                                                      displayTangents=self.displayTangents, 
                                                                                      displayActiveKeyTangents=self.displayActiveKeyTangents)])

    def __uicb_setRanges(self, *args):
        cmds.floatSliderGrp('fsg_randfloatValue', e=True, maxValue=args[0])#cmds.floatField('ffg_rand_intMax',q=True,v=True))
   
    def __uicb_toggleGraphDisplay(self,*args):
        if not self.toggledState:
            self.displayTangents=cmds.animCurveEditor('graphEditor1GraphEd', q=True, displayTangents=True)
            self.displayActiveKeyTangents = cmds.animCurveEditor('graphEditor1GraphEd', q=True, displayActiveKeyTangents=True)
            if cmds.animCurveEditor('graphEditor1GraphEd', q=True, showBufferCurves=True)=='on':
                self.showBufferCurves = True
            else:
                self.showBufferCurves = False
                
            animCurveDrawStyle(style='simple', forceBuffer=True)
            self.toggledState=True
        else:
            animCurveDrawStyle(style='full', forceBuffer=False,
                                 showBufferCurves=self.showBufferCurves,
                                 displayTangents=self.displayTangents, 
                                 displayActiveKeyTangents=self.displayActiveKeyTangents)
            self.toggledState=False
                        
    def __uicb_interactiveMode(self, mode):
        if mode:
            if not cmds.checkBox('cb_rand_current', q=True, v=True):
                cmds.checkBox('interactiveRand', e=True, v=False)
                log.warning('Interactive is ONLY supported in "CurrentKeys" Mode')
                return
            cmds.floatFieldGrp('ffg_rand_damping', e=True,en=False)
            cmds.rowColumnLayout('interactiveLayout', e=True, en=True)
        else:
            cmds.floatFieldGrp('ffg_rand_damping', e=True,en=True)
            cmds.rowColumnLayout('interactiveLayout', e=True, en=False)
            
    def __uicb_currentKeysCallback(self, *args):
        if cmds.checkBox('cb_rand_current', q=True, v=True):
            cmds.floatFieldGrp('ffg_rand_frmStep', e=True,en=False)
        else:
            cmds.floatFieldGrp('ffg_rand_frmStep', e=True,en=True)
            cmds.checkBox('interactiveRand', e=True, v=False)
            self.__uicb_interactiveMode(False)

    def __uicb_percentageCallback(self, *args):
        if not cmds.checkBox('cb_rand_percent',q=True,v=True):
            cmds.floatFieldGrp('ffg_rand_damping',e=True, label='strength : value')
        else: 
            cmds.floatFieldGrp('ffg_rand_damping',e=True, label='strength : normalized %')
            
    def __storePrefs(self, *args):
        if cmds.window(self.win, exists=True):
            cmds.optionVar(floatValue=('red9_randomizer_damp',cmds.floatFieldGrp('ffg_rand_damping',q=True,v1=True)))
            cmds.optionVar(intValue=('red9_randomizer_current',cmds.checkBox('cb_rand_current',q=True,v=True)))
            cmds.optionVar(intValue=('red9_randomizer_percent',cmds.checkBox('cb_rand_percent',q=True,v=True)))
            cmds.optionVar(floatValue=('red9_randomizer_frmStep',cmds.floatFieldGrp('ffg_rand_frmStep',q=True,v1=True)))
            log.debug('stored out ramdomizer prefs')
        
    def __loadPrefsToUI(self):
        if cmds.optionVar(exists='red9_randomizer_damp'):
            cmds.floatFieldGrp('ffg_rand_damping',e=True,v1=cmds.optionVar(q='red9_randomizer_damp'))
        if cmds.optionVar(exists='red9_randomizer_current'):
            cmds.checkBox('cb_rand_current',e=True,v=cmds.optionVar(q='red9_randomizer_current'))
        if cmds.optionVar(exists='red9_randomizer_percent'):
            cmds.checkBox('cb_rand_percent',e=True,v=cmds.optionVar(q='red9_randomizer_percent'))
        if cmds.optionVar(exists='red9_randomizer_frmStep'):
            cmds.floatFieldGrp('ffg_rand_frmStep',e=True,v1=cmds.optionVar(q='red9_randomizer_frmStep'))
        self.__uicb_currentKeysCallback() 
        self.__uicb_percentageCallback()
    
    def __calcualteRangeValue(self,keyValues):
        vals=sorted(keyValues)
        rng=abs(vals[0]-vals[-1])/2
        if rng>1.0:
            return [-rng,rng]
        else:
            return [-1,1]
   
    def interactiveWrapper(self, *args):
        with self.contextManager(self.dragActive, undoFuncCache = ['interactiveWrapper']):
            self.dragActive=True
            self.addNoise(cmds.keyframe(q=True, sl=True, n=True), time=(), step=1, 
                          currentKeys=True,
                          damp=cmds.floatSliderGrp('fsg_randfloatValue',q=True,v=True), 
                          percent=cmds.checkBox('cb_rand_percent',q=True,v=True))
                                
    def addNoise(self, curves, time=(), step=1, currentKeys=True, randomRange=[-1,1], damp=1, percent=False):
        '''
        Simple noise function designed to add noise to keyframed animation data
        @param curves: Maya animCurves to process
        @param time: timeRange to process
        @param step: frame step used in the processor
        @param currentKeys: ONLY randomize keys that already exists 
        @param randomRange: range [upper, lower] bounds passed to teh randomizer
        @param damp: damping passed into the randomizer
        '''
        if percent:
            damp=damp/100
        if currentKeys:
            for curve in curves:
                #if keys/curves are already selected, process those only
                selectedKeys=cmds.keyframe(curve, q=True,vc=True,tc=True,sl=True)
                if selectedKeys:
                    keyData=selectedKeys
                else:   
                    #else process all keys inside the time
                    keyData=cmds.keyframe(curve, q=True,vc=True,tc=True,t=time)
                for t,v in zip(keyData[::2],keyData[1::2]):
                    if percent:
                        #figure the upper and lower value bounds
                        randomRange=self.__calcualteRangeValue(keyData[1::2])
                        log.debug('Percent data : randomRange=%f>%f, percentage=%f' % (randomRange[0],randomRange[1],damp))
                    value=self.noiseFunc(v,randomRange,damp)
                    cmds.setKeyframe(curve, v=value,t=t)
        else:  #allow to ADD keys at 'step' frms
            if not time:
                selectedKeyTimes=sorted(list(set(cmds.keyframe(q=True,tc=True))))
                if selectedKeyTimes:
                    time=(selectedKeyTimes[0],selectedKeyTimes[-1])
            for curve in curves:  
                if percent:    
                    #figure the upper and lower value bounds
                    randomRange=self.__calcualteRangeValue(cmds.keyframe(curve, q=True,vc=True,t=time))
                    log.debug('Percent data : randomRange=%f>%f, percentage=%f' % (randomRange[0],randomRange[1],damp))
                connection=cmds.listConnections(curve,source=False,d=True,p=True)[0]
                for t in timeLineRangeProcess(time[0], time[1], step, incEnds=True):
                    value=self.noiseFunc(cmds.getAttr(connection,t=t),randomRange,damp)
                    cmds.setKeyframe(connection, v=value,t=t)
                    
    def curveMenuFunc(self, *args):
        self.__storePrefs()
        frmStep=1
        damping=1
        percent=False
        currentKeys=True
        
        if cmds.window(self.win, exists=True):
            currentKeys=cmds.checkBox('cb_rand_current',q=True,v=True)
            damping=cmds.floatFieldGrp('ffg_rand_damping',q=True,v1=True)
            frmStep=cmds.floatFieldGrp('ffg_rand_frmStep',q=True,v1=True)
            percent=cmds.checkBox('cb_rand_percent',q=True,v=True)
        else:
            if cmds.optionVar(exists='red9_randomizer_damp'):
                damping=cmds.optionVar(q='red9_randomizer_damp')
            if cmds.optionVar(exists='red9_randomizer_percent'):
                percent=cmds.optionVar(q='red9_randomizer_percent')
            if cmds.optionVar(exists='red9_randomizer_current'):
                currentKeys=cmds.optionVar(q='red9_randomizer_current')
            if cmds.optionVar(exists='red9_randomizer_frmStep'):
                frmStep=cmds.optionVar(q='red9_randomizer_frmStep')
        
        selectedCurves=cmds.keyframe(q=True, sl=True, n=True)
        if not selectedCurves:
            raise StandardError('No Keys or Anim curves selected!')
        
        self.addNoise(curves=selectedCurves,
                      step=frmStep,
                      damp=damping,
                      currentKeys=currentKeys,
                      percent=percent)  
                            

 
class FilterCurves(object):
    
    def __init__(self):
        self.win='interactiveCurveFilter' 
        self.contextManager=curveModifierContext
        self.dragActive=False
        self.undoFuncCache=['simplifyWrapper', 'snapAnimCurvesToFrms', 'resampleCurves']
        self.undoDepth = 1
        self.snapToFrame=False
        self.toggledState=False
        
        #cache the current state of the GrapthEditor so that the toggle respects it
        self.displayTangents=cmds.animCurveEditor('graphEditor1GraphEd', q=True, displayTangents=True)
        self.displayActiveKeyTangents = cmds.animCurveEditor('graphEditor1GraphEd', q=True, displayActiveKeyTangents=True)
        if cmds.animCurveEditor('graphEditor1GraphEd', q=True, showBufferCurves=True)=='on':
            self.showBufferCurves = True
        else:
            self.showBufferCurves = False

    @classmethod
    def show(cls):
        cls()._showUI()
    
    def _showUI(self):  
        if cmds.window(self.win, exists=True): cmds.deleteUI(self.win, window=True)
        cmds.window(self.win , title=self.win)
        cmds.menuBarLayout()
        cmds.menu(l="VimeoHelp")
        cmds.menuItem(l="Open Vimeo Help File",
                          ann='simple demo showing the functionality of Simplify curve and Randomizer',
                          c="import Red9.core.Red9_General as r9General;r9General.os_OpenFile('https://vimeo.com/69270932')")
        cmds.menuItem(divider=True) 
        cmds.menuItem(l="Contact Me",c=r9Setup.red9ContactInfo)    
        cmds.columnLayout(adjustableColumn=True)
        
        cmds.text(label='Curve Resampler')
        cmds.separator(h=5, style='none')
        cmds.rowColumnLayout(numberOfColumns=2, cw=((1,350),(2,40)))
        cmds.floatSliderGrp('fsg_resampleStep',
                                label='Resample',
                                field=True, 
                                minValue=1, 
                                maxValue=10.0,
                                pre=1,
                                value=1,
                                columnWidth=[(1, 80),  (2, 50), (3,100)],
                                dc=self.resampleCurves)#,
                                #cc=self.snapAnimCurvesToFrms)  #set the dragActive state back to false on release
        cmds.floatField('stepRange', v=10, pre=2,
                        cc=self.__uicb_setMaxRanges,
                        dc=self.__uicb_setMaxRanges)
        cmds.setParent('..')
        cmds.separator(h=25, style='in') 
           
        cmds.text(label='Curve Simplfier')
        cmds.separator(h=5,style='none')
        cmds.rowColumnLayout(numberOfColumns=2, cw=((1,350),(2,40)))
        cmds.floatSliderGrp('fsg_filtertimeValue',
                                label='Time tolerance',
                                field=True, 
                                minValue=0.05, 
                                maxValue=10.0,
                                pre=2,
                                value=0,
                                columnWidth=[(1, 80),  (2, 50), (3,50)],
                                dc=self.simplifyWrapper,
                                cc=self.snapAnimCurvesToFrms) 
        cmds.floatField('timeRange', v=10, pre=2,
                        cc=self.__uicb_setMaxRanges,
                        dc=self.__uicb_setMaxRanges)
        cmds.floatSliderGrp('fsg_filterfloatValue',
                                label='Value tolerance',
                                field=True, 
                                minValue=0, 
                                maxValue=1.0,
                                pre=2,
                                value=0,
                                columnWidth=[(1, 80),  (2, 50), (3,50)],
                                dc=self.simplifyWrapper,
                                cc=self.snapAnimCurvesToFrms)
        cmds.floatField('valueRange', v=1, pre=2,
                        cc=self.__uicb_setMaxRanges,
                        dc=self.__uicb_setMaxRanges)
        cmds.setParent('..')
        cmds.separator(h=20, style='in') 
        cmds.rowColumnLayout(numberOfColumns=2, cs=((1,80)))
        cmds.checkBox('snapToFrames', value=self.snapToFrame, label="Snap to Frame", 
                      ann="on exit of the sliders snap the keys to whole frames",
                      cc=self.__uicb_setToFrame)
        cmds.setParent('..')   
        
        cmds.separator (h=10, style="none") 
        cmds.rowColumnLayout(numberOfColumns=2, cw=((1,200),(2,200)))
        cmds.button(label='Reset All', bgc=r9Setup.red9ButtonBGC(1),
                         command=self.__uicb_resetSliders)
        cmds.button(label='ToggleBuffers', bgc=r9Setup.red9ButtonBGC(1),
                         command=self.__uicb_toggleGraphDisplay)
        cmds.setParent('..')   
        
        cmds.separator (h=20, style="none") 
        cmds.iconTextButton( style='iconOnly', bgc=(0.7,0,0),image1='Rocket9_buttonStrap2.bmp',
                                 c=r9Setup.red9ContactInfo,
                                 h=22,w=220 )
        cmds.showWindow(self.win)
        cmds.window(self.win , e=True, widthHeight=(410, 280))
        
        #set close event to restore standard GraphEditor curve status
        cmds.scriptJob(runOnce=True, uiDeleted=[self.win, lambda *x:animCurveDrawStyle(style='full', forceBuffer=False,
                                                                                      showBufferCurves=self.showBufferCurves,
                                                                                      displayTangents=self.displayTangents, 
                                                                                      displayActiveKeyTangents=self.displayActiveKeyTangents)])

    def __uicb_setMaxRanges(self, *args):
        cmds.floatSliderGrp('fsg_filtertimeValue', e=True, maxValue=cmds.floatField("timeRange",q=True,v=True))
        cmds.floatSliderGrp('fsg_filterfloatValue', e=True, maxValue=cmds.floatField("valueRange",q=True,v=True))
        cmds.floatSliderGrp('fsg_resampleStep', e=True, maxValue=cmds.floatField("stepRange",q=True,v=True))
    
    def __uicb_resetSliders(self,*args):
        cmds.floatSliderGrp('fsg_filtertimeValue', e=True, v=0)
        cmds.floatSliderGrp('fsg_filterfloatValue', e=True, v=0)
        cmds.floatSliderGrp('fsg_resampleStep', e=True, v=1)
        self.contextManager(self.dragActive, 
                            undoFuncCache = self.undoFuncCache, 
                            undoDepth = self.undoDepth ).undoCall()
    
    def __uicb_toggleGraphDisplay(self,*args):
        if not self.toggledState:
            #cache the current state
            self.displayTangents=cmds.animCurveEditor('graphEditor1GraphEd', q=True, displayTangents=True)
            self.displayActiveKeyTangents = cmds.animCurveEditor('graphEditor1GraphEd', q=True, displayActiveKeyTangents=True)
            if cmds.animCurveEditor('graphEditor1GraphEd', q=True, showBufferCurves=True)=='on':
                self.showBufferCurves = True
            else:
                self.showBufferCurves = False
                
            animCurveDrawStyle(style='simple', forceBuffer=True)
            self.toggledState=True
        else:
            animCurveDrawStyle(style='full', forceBuffer=False,
                               showBufferCurves=self.showBufferCurves,
                               displayTangents=self.displayTangents, 
                               displayActiveKeyTangents=self.displayActiveKeyTangents)
            self.toggledState=False
        
    def __uicb_setToFrame(self,*args):
        #print args
        if args[0]:
            cmds.floatSliderGrp('fsg_resampleStep',
                                e=True,
                                pre=0)
            self.snapToFrame=True
            self.undoDepth=2
        else:
            cmds.floatSliderGrp('fsg_resampleStep',
                                e=True,
                                pre=1)
            self.undoDepth=1
            self.snapToFrame=False
                                  
    def simplifyWrapper(self, *args):            
        with self.contextManager(self.dragActive, 
                                 undoFuncCache = self.undoFuncCache, 
                                 undoDepth = self.undoDepth ):
            self.dragActive=True #turn on the undo management
            simplify=True
            if simplify:                
                cmds.simplify( animation='keysOrObjects', 
                               timeTolerance=cmds.floatSliderGrp('fsg_filtertimeValue',q=True,v=True), 
                               valueTolerance=cmds.floatSliderGrp('fsg_filterfloatValue',q=True,v=True))
            else:
                print 'testing filter call'
                objs=cmds.ls(sl=True)
                cmds.filterCurve(objs, f='simplify', 
                                 timeTolerance=cmds.floatSliderGrp('fsg_filterfloatValue',q=True,v=True)) 
    
    def resampleCurves(self, *args):  
        step = args[0]
        if self.snapToFrame:
            step = int(args[0]) 
        #print step
        curves = cmds.keyframe(q=True, sl=True, n=True)         
        if not curves:
            curves = cmds.ls(sl=True,l=True)
            time = ()
        else:
            keys = sorted(cmds.keyframe(curves, sl=True, q=True,tc=True))
            time = (int(keys[0]),keys[-1]) # note the int convertion in case frist key is on a sub-frame
        with self.contextManager(True, undoFuncCache = self.undoFuncCache):
            cmds.bakeResults(curves, t=time, sb=step, pok=True) 

    def snapAnimCurvesToFrms(self,*args):
        if self.snapToFrame:
            cmds.snapKey(timeMultiple=1)
            
            
class MirrorHierarchy(object):
    
    '''
    This class is designed to mirror pose and animation data on any given
    hierarchy. The hierarchy is filtered like everything else in the Red9
    pack, using a filterSettings node thats passed into the __init__
    
    mirror=MirrorHierarchy(cmds.ls(sl=True)[0])
    #set the settings object to run metaData
    mirror.settings.metaRig=True
    mirror.settings.printSettings()
    mirror.mirrorData(mode='Anim') 
    
    TODO: We need to do a UI for managing these marker attrs and the Index lists
    '''
    
    def __init__(self, nodes=[], filterSettings=None, **kws):
        '''
        @param nodes: initial nodes to process
        @param filterSettings: filterSettings object to process hierarchies
        '''
        
        self.nodes=nodes
        if not type(self.nodes)==list:self.nodes=[self.nodes]
        
        #default Attributes used to define the system
        self.defaultMirrorAxis=['translateX','rotateY','rotateZ']
        #self.mirrorSide='MirrorMarker' #switched attr names to unify this and the MetaRig setups
        #self.mirrorIndex='MirrorList'  #switched attr names to unify this and the MetaRig setups
        #self.mirrorAxis='MirrorAxis'   #switched attr names to unify this and the MetaRig setups
        self.mirrorSide='mirrorSide'
        self.mirrorIndex='mirrorIndex'
        self.mirrorAxis='mirrorAxis'
        self.mirrorDict={'Centre':{},'Left':{},'Right':{}}
        self.kws=kws #allows us to pass kws into the copyKey and copyAttr call if needed
        print 'kws in Mirror call : ',self.kws
        
        # make sure we have a settings object
        if filterSettings:
            if issubclass(type(filterSettings), r9Core.FilterNode_Settings):
                self.settings=filterSettings
            else:
                raise StandardError('filterSettings param requires an r9Core.FilterNode_Settings object')
        else:
            self.settings=r9Core.FilterNode_Settings() 
            
        #ensure we use the mirrorSide attr search ensuring all nodes 
        #returned are part of the Mirror system
        self.settings.searchAttrs.append(self.mirrorSide)
    
    def _validateMirrorEnum(self, side):
        '''
        validate the given side to make sure it's formatted correctly before setting the data
        '''
        if not side:
            return False
        if type(side)==int:
            if not side in range(0,3):
                raise ValueError('given mirror side is not a valid int entry: 0, 1 or 2')
            else:
                return True
        if not self.mirrorDict.has_key(side):
            raise ValueError('given mirror side is not a valid key: Left, Right or Centre')
        else:
            return True
        
    def setMirrorIDs(self, node, side=None, slot=None, axis=None):
        '''
        Add/Set the default attrs required by the MirrorSystems
        @param node: nodes to take the attrs
        @param side: valid values are 'Centre','Left' or 'Right' or 0, 1, 2
        @param slot: bool Mainly used to pair up left and right paired controllers
        @param axis: eg 'translateX,rotateY,rotateZ' simple comma separated string
            If this is set then it overrides the default mirror axis. 
            These are the channels who have their attribute/animCurve values inversed 
            during mirror. NOT we allow axis to have a null string 'None' so it can be
            passed in blank when needed   
        NOTE: slot index can't be ZERO
        '''
        #Note using the MetaClass as all the type checking
        #and attribute handling is done for us
        mClass=r9Meta.MetaClass(node)
        if self._validateMirrorEnum(side):
            mClass.addAttr(self.mirrorSide,attrType='enum',enumName='Centre:Left:Right', hidden=True) 
            mClass.__setattr__(self.mirrorSide,side) 
        if slot:
            mClass.addAttr(self.mirrorIndex ,slot, hidden=True)
            mClass.__setattr__(self.mirrorIndex,slot) 
        if axis:
            if axis=='None':
                mClass.addAttr(self.mirrorAxis, attrType='string')
            else:
                mClass.addAttr(self.mirrorAxis, axis)
                mClass.__setattr__(self.mirrorAxis,axis) 
        del(mClass) #cleanup
        
    def deleteMirrorIDs(self, node):
        '''
        Remove the given node from the MirrorSystems
        '''
        mClass=r9Meta.MetaClass(node)
        try: 
            mClass.__delattr__(self.mirrorSide)
        except: 
            pass
        try: 
            mClass.__delattr__(self.mirrorIndex)
        except:
            pass
        try:
            mClass.__delattr__(self.mirrorAxis)
        except:
            pass
        del(mClass)
        
    def getNodes(self):
        '''
        Get the list of nodes to start processing
        '''
        return r9Core.FilterNode(self.nodes,filterSettings=self.settings).ProcessFilter()
     
    def getMirrorSide(self, node):
        '''
        This is an enum Attr to denote the Side of the controller in the Mirror system
        '''
        return cmds.getAttr('%s.%s' % (node,self.mirrorSide),asString=True)

    def getMirrorIndex(self, node):
        '''
        get the mirrorIndex, these slots are used to denote matching pairs
        such that Left and Right Controllers to switch will have the same index
        '''
        return int(cmds.getAttr('%s.%s' % (node,self.mirrorIndex)))
   
    def getMirrorAxis(self, node):
        '''
        get any custom attributes set at node level to inverse, if none found
        return the default axis setup in the __init__
        NOTE: if mirrorAxis attr has been added to the node but is empty then 
        no axis will be inversed at all. If the attr doesn't exist then the 
        default inverse axis will be used
        '''
        if cmds.attributeQuery(self.mirrorAxis,node=node,exists=True):
            axis=cmds.getAttr('%s.%s' %(node,self.mirrorAxis))
            if not axis:
                return []
            else:
                return axis.split(',')
        else:
            return self.defaultMirrorAxis
        
    def getMirrorSets(self, nodes=None):
        '''
        Filter the given nodes into the mirrorDict
        such that {'Centre':{id:node,},'Left':{id:node,},'Right':{id:node,}}
        '''
        #reset the current Dict prior to rescanning
        self.mirrorDict={'Centre':{},'Left':{},'Right':{}}
        if not nodes:
            nodes=self.getNodes()
        if not nodes:
            raise StandardError('no mirrorMarkers found in node list/hierarchy')
        for node in nodes:
            try:
                side=self.getMirrorSide(node)
                index=self.getMirrorIndex(node)
                axis=self.getMirrorAxis(node)
                log.debug('Side : %s Index : %s>> node %s' % \
                          ( side, index, r9Core.nodeNameStrip(node)))
                #self.mirrorDict[side][str(index)]=node #NOTE index is cast to string!
                self.mirrorDict[side][str(index)]={}
                self.mirrorDict[side][str(index)]['node']=node
                self.mirrorDict[side][str(index)]['axis']=axis
                if cmds.attributeQuery(self.mirrorAxis,node=node,exists=True):
                    self.mirrorDict[side][str(index)]['axisAttr']=True
                else:
                    self.mirrorDict[side][str(index)]['axisAttr']=False
                
            except StandardError,error:
                log.debug(error)
                log.info('Failed to add Node to Mirror System : %s' % r9Core.nodeNameStrip(node))
    
    def printMirrorDict(self, short=True):
        '''
        Pretty print the Mirror Dict 
        '''
        self.getMirrorSets()
        if not short:
            print '\nCenter MirrorLists ====================================================='
            for i in r9Core.sortNumerically(self.mirrorDict['Centre'].keys()): 
                print '%s > %s' % (i, self.mirrorDict['Centre'][i]['node'])
            print '\nRight MirrorLists ======================================================'
            for i in r9Core.sortNumerically(self.mirrorDict['Right'].keys()): 
                print '%s > %s' % (i, self.mirrorDict['Right'][i]['node'])
            print '\nLeft MirrorLists ======================================================='
            for i in r9Core.sortNumerically(self.mirrorDict['Left'].keys()): 
                print '%s > %s' % (i, self.mirrorDict['Left'][i]['node'])
        else:
            print '\nCenter MirrorLists ====================================================='
            for i in r9Core.sortNumerically(self.mirrorDict['Centre'].keys()):
                print '%s > %s' % (i,r9Core.nodeNameStrip(self.mirrorDict['Centre'][i]['node']))
            print '\nRight MirrorLists ======================================================'
            for i in r9Core.sortNumerically(self.mirrorDict['Right'].keys()): 
                print '%s > %s' % (i, r9Core.nodeNameStrip(self.mirrorDict['Right'][i]['node']))
            print '\nLeft MirrorLists ======================================================='
            for i in r9Core.sortNumerically(self.mirrorDict['Left'].keys()): 
                print '%s > %s' % (i, r9Core.nodeNameStrip(self.mirrorDict['Left'][i]['node']))
                          
    def switchPairData(self, objA, objB, mode='Anim'):
        '''
        take the left and right matched pairs and exchange the animData
        or poseData across between them
        
        FIXME: there's an issue here, if left has keys at 0,5 and right has keys 0,10
        we'll end up with right having keys at 0,5,10 as the copyKeys is a replace
        not a replaceComplete? Do we add a flag for that situation?
        '''
        objs=cmds.ls(sl=True,l=True)
        if mode=='Anim':
            transferCall= AnimFunctions().copyKeys
        else:
            transferCall= AnimFunctions().copyAttributes
        
        #switch the anim data over via temp
        cmds.select(objA)
        cmds.duplicate(name='DELETE_ME_TEMP')
        temp=cmds.ls(sl=True,l=True)[0]
        log.debug('temp %s:' % temp)
        transferCall([objA,temp], **self.kws)
        transferCall([objB,objA], **self.kws)
        transferCall([temp,objB], **self.kws)
        cmds.delete(temp)
        
        if objs:cmds.select(objs)
    
    def makeSymmetrical(self, nodes=None, mode='Anim', primeAxis='Left'):
        '''
        similar to the mirrorData except this is designed to take the data from an object in
        one side of the mirrorDict and pass that data to the opposite matching node, thus 
        making the anim/pose symmetrical according to the mirror setups. 
        Really useful for facial setups!
        '''
        self.getMirrorSets(nodes)
        if mode=='Anim':
            transferCall= AnimFunctions().copyKeys
            inverseCall = AnimFunctions.inverseAnimChannels
        else:
            transferCall= AnimFunctions().copyAttributes
            inverseCall = AnimFunctions.inverseAttributes
            
        if primeAxis=='Left':
            masterAxis='Left'
            slaveAxis = 'Right'
        else:
            masterAxis='Right'
            slaveAxis = 'Left'
               
        for index,masterSide in self.mirrorDict[masterAxis].items():
            if not index in self.mirrorDict[slaveAxis].keys():
                log.warning('No matching Index Key found for %s mirrorIndex : %s >> %s' % \
                            (masterAxis,index,r9Core.nodeNameStrip(masterSide['node'])))
            else:
                slaveData=self.mirrorDict[slaveAxis][index]
                log.debug('SymmetricalPairs : %s >> %s' % (r9Core.nodeNameStrip(masterSide['node']),\
                                     r9Core.nodeNameStrip(slaveData['node'])))
                transferCall([masterSide['node'],slaveData['node']], **self.kws)
                
                log.debug('Symmetrical Axis Inversion: %s' % ','.join(slaveData['axis'])) 
                if slaveData['axis']:
                    inverseCall(slaveData['node'], slaveData['axis'])
             
    def mirrorData(self, nodes=None, mode='Anim'):
        '''
        Using the FilterSettings obj find all nodes in the return that have
        the mirrorSide attr, then process the lists into Side and Index slots
        before Mirroring the animation data. Swapping left for right and
        inversing the required animCurves
        '''
        self.getMirrorSets(nodes)
        
        if mode=='Anim':
            inverseCall = AnimFunctions.inverseAnimChannels
        else:
            inverseCall = AnimFunctions.inverseAttributes
        
        #Switch Pairs on the Left and Right and inverse the channels
        for index,leftData in self.mirrorDict['Left'].items():
            if not index in self.mirrorDict['Right'].keys():
                log.warning('No matching Index Key found for Left mirrorIndex : %s >> %s' % (index,r9Core.nodeNameStrip(leftData['node'])))
            else:
                rightData=self.mirrorDict['Right'][index]
                log.debug('SwitchingPairs : %s >> %s' % (r9Core.nodeNameStrip(leftData['node']),\
                                     r9Core.nodeNameStrip(rightData['node'])))
                self.switchPairData(leftData['node'], rightData['node'],mode=mode)
                
                log.debug('Axis Inversions: left: %s' % ','.join(leftData['axis']))
                log.debug('Axis Inversions: right: %s' % ','.join(rightData['axis']))
                if leftData['axis']:
                    inverseCall(leftData['node'],  leftData['axis'])
                if rightData['axis']:
                    inverseCall(rightData['node'], rightData['axis'])
                
        #Inverse the Centre Nodes
        for data in self.mirrorDict['Centre'].values():
            inverseCall(data['node'], data['axis'])
     
    def saveMirrorSetups(self, filepath):
        '''
        Store the mirrorSetups out to file
        '''
        self.getMirrorSets()
        self.printMirrorDict()
        ConfigObj = configobj.ConfigObj(indent_type='\t')
        ConfigObj['mirror']=self.mirrorDict
        ConfigObj.filename = filepath
        ConfigObj.write()
        
    def loadMirrorSetups(self, filepath, nodes=None):
        if not os.path.exists(filepath):
            raise IOError('invalid filepath given')
        self.mirrorDict = configobj.ConfigObj(filepath)['mirror']
        nodesToMap=nodes
        
        if not nodesToMap:
            nodesToMap=list(self.nodes)
            nodesToMap.extend(cmds.listRelatives(nodesToMap,ad=True,f=True,type='transform'))
        #log.debug('nodes to load mirrors onto: %s' % ','.join(nodesToMap))
        for node in nodesToMap:
            found=False
            for index,leftData in self.mirrorDict['Left'].items():
                #print node, leftData['node']
                if r9Core.matchNodeLists([node],[leftData['node']]):
                    log.debug('NodeMatched: %s, Side=Left, index=%i, axis=%s' % (node,int(index),leftData['axis']))
                    if r9Core.decodeString(leftData['axisAttr']):
                        self.setMirrorIDs(node, side='Left', slot=int(index), axis=','.join(leftData['axis']))
                    else:
                        self.setMirrorIDs(node, side='Left', slot=int(index))
                    found=True
                    break
            if not found:
                for index,rightData in self.mirrorDict['Right'].items():
                    if r9Core.matchNodeLists([node],[rightData['node']]):
                        log.debug('NodeMatched: %s, Side=Right, index=%i, axis=%s' % (node,int(index),rightData['axis']))
                        if r9Core.decodeString(rightData['axisAttr']):
                            self.setMirrorIDs(node, side='Right', slot=int(index), axis=','.join(rightData['axis']))
                        else:
                            self.setMirrorIDs(node, side='Right', slot=int(index))
                        found=True
                        break
            if not found:
                for index,centreData in self.mirrorDict['Centre'].items():
                    if r9Core.matchNodeLists([node],[centreData['node']]):
                        log.debug('NodeMatched: %s, Side=Centre, index=%i, axis=%s' % (node,int(index),centreData['axis']))
                        if r9Core.decodeString(centreData['axisAttr']):      
                            self.setMirrorIDs( node, side='Centre', slot=int(index), axis=','.join(centreData['axis']))
                        else:
                            self.setMirrorIDs(node, side='Centre', slot=int(index))
                        break
                    
                   
class MirrorSetup(object):

    def __init__(self):
        self.mirrorClass=MirrorHierarchy()
        self.mirrorClass.settings.hierarchy=True
        self.win='MirrorSetup'
        
    @classmethod
    def show(cls):
        cls()._showUI()
        
    def _showUI(self):
                 
        if cmds.window(self.win, exists=True): cmds.deleteUI(self.win, window=True)
        window = cmds.window(self.win, title="MirrorSetup", s=False, widthHeight=(260,410))
        cmds.menuBarLayout()
        cmds.menu(l="VimeoHelp")
        cmds.menuItem(l="Open Vimeo Help File",\
                      c="import Red9.core.Red9_General as r9General;r9General.os_OpenFile('https://vimeo.com/57882801')") 
        cmds.menuItem(divider=True) 
        cmds.menuItem(l="Contact Me",c=lambda *args:(r9Setup.red9ContactInfo()))    
        cmds.columnLayout(adjustableColumn=True,columnAttach=('both',5))
        cmds.separator(h=15, style='none')
        cmds.text(l='MirrorSide')
        cmds.rowColumnLayout(nc=3,columnWidth=[(1,90), (2,90),(3,90)])
        self.uircbMirrorSide = cmds.radioCollection('mirrorSide')
        cmds.radioButton('Right', label='Right')
        cmds.radioButton('Centre',label='Centre')
        cmds.radioButton('Left',  label='Left')
        cmds.setParent('..')
        cmds.separator(h=15, style='in')
        cmds.rowColumnLayout(nc=2,columnWidth=[(1,110), (2,60)])
        cmds.text(label='MirrorIndex')
        cmds.intField('ifg_mirrorIndex', v=1, min=1,w=50)
        cmds.setParent('..')
        cmds.separator(h=15, style='in')
        cmds.text(l='MirrorAxis')
        cmds.checkBox('default',l='use default settings', v=True, 
                      onc=lambda x:self.__uicb_default(False),
                      ofc=lambda x:self.__uicb_default(True))
        cmds.separator(h=5, style='none')
        cmds.rowColumnLayout(ann='attrs', numberOfColumns=3, 
                                 columnWidth=[(1,90),(2,90),(3,90)])        
        cmds.checkBox('translateX',l='Translate X', v=False)
        cmds.checkBox('translateY',l='Translate Y', v=False)
        cmds.checkBox('translateZ',l='Translate Z', v=False) 
        cmds.checkBox('rotateX',l='Rotate X', v=False)
        cmds.checkBox('rotateY',l='Rotate Y', v=False) 
        cmds.checkBox('rotateZ',l='Rotate Z', v=False)
        cmds.setParent('..')   
        cmds.separator(h=15, style='in')
        cmds.button(label='Refresh from Selected', bgc=r9Setup.red9ButtonBGC(1),
                     command=lambda *args:(self.__uicb_getMirrorIDsFromNode()))
        cmds.separator(h=15, style='none')
        cmds.button(label='Add / Update Mirror Markers', bgc=r9Setup.red9ButtonBGC(1),
                     ann='add mirrorMarkers - NOTE if multiple selected then the index will increment from the given value',
                     command=lambda *args:(self.__setMirrorIDs()))
        cmds.rowColumnLayout(nc=2,columnWidth=[(1,135), (2,135)])
        cmds.button(label='Print Mirror Debugs', bgc=r9Setup.red9ButtonBGC(1),
                     ann='print out the hierarchies current setup in the scriptEditor',
                     command=lambda *args:(self.__printDebugs()))
        cmds.button(label='Delete from Selected', bgc=r9Setup.red9ButtonBGC(1),
                     command=lambda *args:(self.__deleteMarkers()))
        cmds.setParent('..')  
        cmds.separator(h=15, style='in')
        cmds.checkBox('mirrorSaveLoadHierarchy',l='hierarchy', v=False)
        cmds.rowColumnLayout(nc=2,columnWidth=[(1,135), (2,135)])
        cmds.button(label='Save MirrorConfigs', bgc=r9Setup.red9ButtonBGC(1),
                     ann='Save the current MirrorSetups',
                     command=lambda *args:(self.__saveMirrorSetups()))
        cmds.button(label='Load MirrorConfigs', bgc=r9Setup.red9ButtonBGC(1),
                     command=lambda *args:(self.__loadMirrorSetups()))
        cmds.setParent('..')  
        cmds.separator(h=15,style='none')  
        cmds.iconTextButton( style='iconOnly', bgc=(0.7,0,0),image1='Rocket9_buttonStrap2.bmp',
                             c=r9Setup.red9ContactInfo,h=22,w=200 )
        cmds.showWindow(window)
        self.__uicb_default(False)
        cmds.radioCollection('mirrorSide',e=True,select='Centre')

    def __uicb_getMirrorIDsFromNode(self):
        node=cmds.ls(sl=True)[0]
        axis=None
        index=self.mirrorClass.getMirrorIndex(node) 
        side=self.mirrorClass.getMirrorSide(node)
        if cmds.attributeQuery(self.mirrorClass.mirrorAxis,node=node,exists=True):
            axis=self.mirrorClass.getMirrorAxis(node) 
            
        #print side,index,axis

        if side and index:
            cmds.radioCollection('mirrorSide',e=True,select=side)
            cmds.intField('ifg_mirrorIndex',e=True,v=index)
        else:
            raise StandardError('mirror Data not setup on this node')
        if axis:
            self.__uicb_default(True)
            cmds.checkBox('default',e=True, v=False) 
            for a in axis:
                if a=='translateX':  cmds.checkBox('translateX',e=True,v=True)
                elif a=='translateY': cmds.checkBox('translateY',e=True,v=True)
                elif a=='translateZ': cmds.checkBox('translateZ',e=True,v=True)
                elif a=='rotateX':  cmds.checkBox('rotateX',e=True,v=True)
                elif a=='rotateY':  cmds.checkBox('rotateY',e=True,v=True)
                elif a=='rotateZ':  cmds.checkBox('rotateZ',e=True,v=True)
        else:
            cmds.checkBox('default',e=True, v=True) 
            self.__uicb_default(False)
        
    def __printDebugs(self):
        self.mirrorClass.nodes=cmds.ls(sl=True)
        self.mirrorClass.printMirrorDict()
    
    def __deleteMarkers(self):
        nodes=cmds.ls(sl=True,l=True)
        if nodes:
            for node in nodes:
                self.mirrorClass.deleteMirrorIDs(node) 
                log.info('deleted MirrorMarkers from : %s' % r9Core.nodeNameStrip(node))       
        
    def __uicb_default(self,mode):
        cmds.checkBox('translateX',e=True,en=mode,v=False)
        cmds.checkBox('translateY',e=True,en=mode,v=False)
        cmds.checkBox('translateZ',e=True,en=mode,v=False)   
        cmds.checkBox('rotateX',e=True,en=mode,v=False)
        cmds.checkBox('rotateY',e=True,en=mode,v=False)
        cmds.checkBox('rotateZ',e=True,en=mode,v=False)
        #now set
        if not mode:
            for axis in self.mirrorClass.defaultMirrorAxis:
                if axis=='translateX':  cmds.checkBox('translateX',e=True,v=True)
                elif axis=='translateY':  cmds.checkBox('translateY',e=True,v=True)
                elif axis=='translateZ':  cmds.checkBox('translateZ',e=True,v=True)
                elif axis=='rotateX':  cmds.checkBox('rotateX',e=True,v=True)
                elif axis=='rotateY':  cmds.checkBox('rotateY',e=True,v=True)
                elif axis=='rotateZ':  cmds.checkBox('rotateZ',e=True,v=True)

    def __ui_getMirrorAxis(self):
        '''
        note this is a string
        '''
        if cmds.checkBox('default',q=True,v=True):
            return None
        else:
            axis=[]
            if cmds.checkBox('translateX',q=True,v=True):
                axis.append('translateX')
            if cmds.checkBox('translateY',q=True,v=True):
                axis.append('translateY')
            if cmds.checkBox('translateZ',q=True,v=True):
                axis.append('translateZ')
            if cmds.checkBox('rotateX',q=True,v=True):
                axis.append('rotateX')
            if cmds.checkBox('rotateY',q=True,v=True):
                axis.append('rotateY')
            if cmds.checkBox('rotateZ',q=True,v=True):
                axis.append('rotateZ')
            if axis:
                return ','.join(axis)
            else:
                return 'None'
                  
    def __setMirrorIDs(self):
        nodes=cmds.ls(sl=True)
        
        #mirrorSlot
        index=cmds.intField('ifg_mirrorIndex',q=True,v=True)
        #mirrorSide
        side=cmds.radioCollection('mirrorSide',q=True,select=True)
        #mirrorAxis
        axis=self.__ui_getMirrorAxis()
        
        if len(nodes)>1:
  
            result = cmds.confirmDialog(
                title='Mirror Markers',
                message='Add incremented Mirror Markers to Muliple selected nodes?',
                button=['OK', 'Cancel'],
                defaultButton='OK',
                cancelButton='Cancel',
                dismissString='Cancel')
            if result == 'OK':
                i=index
                for node in nodes:
                    self.mirrorClass.setMirrorIDs(node,side=str(side),slot=i,axis=axis)
                    log.info('MirrorMarkers added to : %s' % r9Core.nodeNameStrip(node))
                    i+=1
        else:
            self.mirrorClass.setMirrorIDs(nodes[0],side=str(side),slot=index,axis=axis)
            log.info('MirrorMarkers added to : %s' % r9Core.nodeNameStrip(nodes[0]))
    
    def __saveMirrorSetups(self):
        filepath=cmds.fileDialog2(fileFilter="mirrorMap Files (*.mirrorMap *.mirrorMap);;",okc='Save',cap='Save MirrorSetups')[0]
        self.mirrorClass.nodes=cmds.ls(sl=True)
        if cmds.checkBox('mirrorSaveLoadHierarchy',q=True,v=True):
            self.mirrorClass.settings.hierarchy=True
        self.mirrorClass.saveMirrorSetups(filepath=filepath)

    def __loadMirrorSetups(self):
        filepath=cmds.fileDialog2(fileFilter="mirrorMap Files (*.mirrorMap *.mirrorMap);;",okc='Load',cap='Load MirrorSetups')[0]
        if cmds.checkBox('mirrorSaveLoadHierarchy',q=True,v=True):
            self.mirrorClass.nodes=cmds.ls(sl=True,l=True)
            self.mirrorClass.loadMirrorSetups(filepath=filepath)
        else:
            self.mirrorClass.loadMirrorSetups(filepath=filepath, nodes=cmds.ls(sl=True,l=True))



class CameraTracker():
    
    def __init__(self, fixed=True):
        self.win='CameraTrackOptions'
        self.fixed=fixed
    
    @staticmethod   
    def cameraTrackView(start=None, end=None, step=None, fixed=True, keepOffset=False):
        '''
        CameraTracker is a simple wrap over the internal viewFit call but this manages the data
        over time. Works by taking the current camera, in the current 3dView, and fitting it to
        frame the currently selected objects per frame, or rather per frameStep.
        @param start: start frame
        @param end: end frame
        @param step: frame step to increment between fit
        @param fixed: switch between tracking or panning framing fit
        @param keepOffset: keep the current camera offset rather than doing a full viewFit
        TODO: add option for cloning the camera rather than using the current directly
        '''
        if not cmds.ls(sl=True):
            raise StandardError('Nothing selected to Track!')
        cam = cmds.modelEditor(cmds.playblast(ae=True).split('|')[-1],q=True,camera=True) 
        cmds.cutKey(cam,cl=True,t=(),f=())
        
        if not start:
            start=timeLineRangeGet()[0]
        if not end:
            end=timeLineRangeGet()[1]
        if not step:
            if cmds.optionVar(exists='red9_cameraTrackStep'):
                step=cmds.optionVar(q='red9_cameraTrackStep')
            else:
                step=10
        if not keepOffset:
            if cmds.optionVar(exists='red9_cameraTrackKeepOffset'):
                keepOffset=cmds.optionVar(q='red9_cameraTrackKeepOffset') 
                   
        if fixed:
            if keepOffset:
                cachedTransform=cmds.getAttr('%s.translate' % cam)[0]
            else:
                #not sure about this?
                cmds.viewFit(cam,animate=False)
        else:
            if keepOffset:
                cachedTransform=cmds.getAttr('%s.translate' % cam)[0]
                cmds.viewFit(cam,animate=False)
                shifted=cmds.getAttr('%s.translate' % cam)[0]
                offset=[(cachedTransform[0]-shifted[0]),(cachedTransform[1]-shifted[1]),(cachedTransform[2]-shifted[2])]
            
        for i in timeLineRangeProcess(start,end,step,incEnds=True):
            cmds.currentTime(i)
            if fixed:
                #fixed transform, panning camera
                cmds.viewLookAt(cam)
                if keepOffset:
                    cmds.setAttr('%s.translate' % cam, cachedTransform[0],cachedTransform[1],cachedTransform[2])
            else:
                #transform tracking camera
                cmds.viewFit(cam,animate=False)
                if keepOffset:
                    cmds.move(offset[0],offset[1],offset[2],cam, r=True)
                    cmds.refresh()
            cmds.setKeyframe(cam,t=i)
        cmds.filterCurve(cam)

    @classmethod
    def show(cls):
        cls()._showUI()
    
    def _showUI(self):
        if cmds.window(self.win, exists=True): cmds.deleteUI(self.win, window=True)
        cmds.window(self.win , title=self.win, widthHeight=(263, 180))
        cmds.menuBarLayout()
        cmds.menu(l="VimeoHelp")
        cmds.menuItem(l="Open Vimeo Help File",\
                      c="import Red9.core.Red9_General as r9General;r9General.os_OpenFile('https://vimeo.com/60960492')") 
        cmds.menuItem(divider=True) 
        cmds.menuItem(l="Contact Me",c=lambda *args:(r9Setup.red9ContactInfo()))    
        cmds.columnLayout(adjustableColumn=True)
        cmds.separator(h=15,style='none')
        cmds.intFieldGrp('CameraFrameStep',numberOfFields=1, 
                         label='TrackerStep: ', value1=10,
                         extraLabel='frames',
                         cw=(1,100),
                         cc=partial(self.__storePrefs)) 
        cmds.separator(h=15,style='none')  
        cmds.checkBox('CBMaintainCurrent',l='MaintainCurrentFraming', v=True, cc=partial(self.__storePrefs))
        cmds.separator(h=15,style='none')
        cmds.rowColumnLayout(numberOfColumns=2,columnWidth=[(1,130),(2,130)])
        if self.fixed:
            cmds.button('cameraTrackTrack', label='Pan', command=partial(self.__runTracker)) 
        else:
            cmds.button('cameraTrackTrack', label='Track', command=partial(self.__runTracker))
        cmds.button('cameraTrackAppy', label='Apply', command=partial(self.__storePrefs))   
        cmds.setParent('..')
        cmds.separator(h=15,style='none')
        cmds.iconTextButton( style='iconOnly', bgc=(0.7,0,0),image1='Rocket9_buttonStrap2.bmp',
                             c=lambda *args:(r9Setup.red9ContactInfo()),h=22,w=200 )
        cmds.showWindow(self.win)
        cmds.window(self.win,e=True,widthHeight=(263, 180))
        self.__loadPrefsToUI()

    def __storePrefs(self,*args):
        if cmds.window(self.win, exists=True):
            cmds.optionVar(intValue=('red9_cameraTrackStep',cmds.intFieldGrp('CameraFrameStep',q=True,v1=True)))
            cmds.optionVar(intValue=('red9_cameraTrackKeepOffset',cmds.checkBox('CBMaintainCurrent',q=True,v=True)))
            log.debug('stored out cameraTracker prefs')

    def __loadPrefsToUI(self):
        if cmds.optionVar(exists='red9_cameraTrackStep'):
            cmds.intFieldGrp('CameraFrameStep',e=True,v1=cmds.optionVar(q='red9_cameraTrackStep'))
        if cmds.optionVar(exists='red9_cameraTrackKeepOffset'):
            cmds.checkBox('CBMaintainCurrent',e=True, v=cmds.optionVar(q='red9_cameraTrackKeepOffset'))
            
    def __runTracker(self,*args):
        self.__storePrefs()  
        self.cameraTrackView(fixed=self.fixed)
        