import os
import pymel.core as pm
import maya.cmds as cmds

def CopyAnimations (refPrefix):
    startTime = pm.playbackOptions(q=True, minTime=True)
    endTime = pm.playbackOptions(q=True, maxTime=True)
    sourceHierarchy = pm.ls(sl=True)
    if len(sourceHierarchy) == 1:
        root = sourceHierarchy[0]
        sourceobjs = pm.listRelatives(root, ad=True)
        sourceobjs.append(root)
        for obj in sourceobjs:
            target = refPrefix + obj
            if cmds.objExists(target) == True:
                if pm.copyKey(obj, time=(startTime,endTime)) > 0:
                    pm.pasteKey(target)
    elif len(mesh) == 0:
        pm.warning( 'Please select 1 mesh')
    else:
        pm.warning( 'Please select only 1 mesh')

def EasyExportSkinWeightMaps ():
    mesh = pm.ls(sl=True)
    if len(mesh) == 1:
        mesh = mesh[0]
        shape = mesh.getShape()
        if shape != None:
            if pm.objectType(shape, isType='mesh' ) == True:
                pm.polyAutoProjection( '{0}.f[*]'.format(mesh), uvs='skins',lm=False,pb=False,ibd=True,cm=True,l=2,sc=True,o=True,p=6,ps=0.2,ws=False)
                pm.polyUVSet(mesh,cuv=True,uvs='skins',create=False)
                pm.select(mesh)
                cmds.ExportSkinWeightMaps()
            else:
                pm.warning('please select a polymesh')
        else:
            pm.warning('please select a polymesh')
    elif len(mesh) == 0:
        pm.warning( 'Please select 1 mesh')
    else:
        pm.warning( 'Please select only 1 mesh')
    
def EasyImportSkinWeightMaps ():
    mesh = pm.ls(sl=True)
    hasSkin = False
    hasUvsetSkins = False
    if len(mesh) == 1:
        mesh = mesh[0]
        shape = mesh.getShape()
        if shape != None:
            if pm.objectType(shape, isType='mesh' ) == True:
                for historyItem in pm.listHistory(mesh):
                    if pm.nodeType( historyItem, api=False) == 'skinCluster':
                        hasSkin = True
                if hasSkin == False:
                    if pm.objExists('Bone_Root'):  
                        pm.skinCluster( 'Bone_Root', mesh, nw=2, mi=4, dr=4, omi=True, rui=True)
                    else:
                        pm.warning('object is not skinned, looked for Bone_Root but does not exist bind mesh and try again')
                for uv in pm.polyUVSet(mesh, query=True, allUVSets=True ):
                    if uv == 'skins':
                        hasUvsetSkins = True
                if hasUvsetSkins == True:
                    pm.polyUVSet(mesh,cuv=True,uvs='skins',create=False)
                else:
                    pm.warning('UVset:\'skins\' not found... Performing operation on currently selected UVset:\'{0}\''.format(pm.polyUVSet(mesh, query=True, cuv=True )))
                    pm.warning('If there are unexpected results here are some potential solutions:')
                    pm.warning('\t1. skinweight maps may have been exported manually in which case select the correct UVset and try again')
                    pm.warning('\t2. original skinweight maps may not have been exported in which case you may want to look at geometry substitution or starting over from the original model')
                pm.select(mesh)
                cmds.ImportSkinWeightMaps()
            else:
                pm.warning('please select a polymesh')
        else:
            pm.warning('please select a polymesh')
    elif len(mesh) == 0:
        pm.warning( 'Please select 1 mesh')
    else:
        pm.warning( 'Please select only 1 mesh')