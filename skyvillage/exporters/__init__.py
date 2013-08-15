import os
import shutil
from lxml import etree
import pymel.core as pm
from core import perforce
from core import log
import core.settings as settings
from skyvillage import get_ignition_root


def export_materials(force_materials=True,chkOut_Tex = True):

    lam_mat_names = set()
    alpha = False
    
    for mesh in pm.ls(type='mesh'):
        for engine in mesh.listConnections(type='shadingEngine'):
            for lam_mat in engine.listConnections(type='lambert'):
                if lam_mat.name() != 'lambert1':
                    if not pm.referenceQuery(lam_mat, isNodeReferenced=True):
                        lam_mat_names.add(lam_mat.name())
                    else:
                        temp = lam_mat.name()
                        temp = temp.rpartition(':')
                        lam_mat_names.add(temp[2])
    
    for lam_mat_name in lam_mat_names:
        lam_mat = pm.PyNode(lam_mat_name)
        blendState = 'True'
        depthWriteState = 'False'
        
        tex_uri = ''
        images = lam_mat.listConnections(type='file')
        if len(images) > 0:
            tex_uri = images[0].attr('fileTextureName').get()
            tex_uri = tex_uri.lower()
            path = tex_uri.rpartition('textures')
            if chkOut_Tex == True:
                tex_dir = os.path.join(get_ignition_root(), 'game', 'content', 'Textures')
                chkOut_Path = tex_dir + path[2]
                perforce.checkout(chkOut_Path)
            tex_uri = 'textures:' + path[2]
            tex_uri.replace('\\','/')
            
            if lam_mat.transparency.listConnections(d=True) == lam_mat.color.listConnections(d=True):
                alpha = True
        else:
            tex_uri = settings.get('skyvillage/missing_texture')
        if alpha == True:
            blendState = 'True'
            depthWriteState = 'False'
        else:
            blendState = 'False'
            depthWriteState = 'True'
            
        root = etree.Element('igx')
        root.set('name', lam_mat.name())
        
        dep = etree.Element('dependency')
        dep.set('name', 'SkyvillageUnlitMaterial')
        dep.set('path', 'materials-shared:\\archetypes\\SkyvillageUnlitMaterial.igx')
        dep.set('for-inheritance', 'True')
        root.append(dep)
        
        obj = etree.Element('object')
        obj.set('refname', lam_mat.name())
        obj.set('root', 'True')
        obj.set('base', 'SkyvillageUnlitMaterial.SkyvillageUnlit')
        obj.set('type', 'SkyvillageUnlitMaterial')
        root.append(obj)
        
        tex = etree.Element('var')
        tex.set('name', '_textureName_diffuse')
        tex.set('value', tex_uri)
        obj.append(tex)
        
        blend = etree.Element('var')
        blend.set('name', '_blendingState')
        blend.set('value', blendState)
        obj.append(blend)
	'''
	#added settings for pre-multiplied standard
	if blendState == 'True':
	    alphafunction = etree.Element('var')
	    alphafunction.set('name', '_alphaFunction')
	    alphafunction.set('value', 'IG_GFX_ALPHA_FUNCTION_GEQUAL')
	    obj.append(alphafunction)
	    
	    alphaTestState = etree.Element('var')
	    alphaTestState.set('name','_alphaTestState')
	    alphaTestState.set('value', 'False')
	    obj.append(alphaTestState)
	    
	    blendSource = etree.Element('var')
	    blendSource.set('name', '_blendingSource')
	    blendSource.set('value', 'IG_GFX_BLENDING_FUNCTION_ONE')
	    obj.append(blendSource)
	    
	    blendDest = etree.Element('var')
	    blendDest.set('name','_blendingDestination')
	    blendDest.set('value','IG_GFX_BLENDING_FUNCTION_ONE_MINUS_SOURCE_ALPHA')
	    obj.append(blendDest)
	    
	    blendEQ = etree.Element('var')
	    blendEQ.set('name', '_blendingEquation')
	    blendEQ.set('value', 'IG_GFX_BLENDING_EQUATION_ADD')
	    obj.append(blendEQ)
	    
	'''
        depth = etree.Element('var')
        depth.set('name', '_depthWriteState')
        depth.set('value', depthWriteState)
        obj.append(depth)
        
        mat_dir = os.path.join(get_ignition_root(), 'game', 'content', 'Materials')
        mat_path = os.path.join(mat_dir, lam_mat.name() + '.igx')
        
        if not os.path.isdir(mat_dir):
            os.makedirs(mat_dir)
        
        if force_materials:
            perforce.checkout(mat_path)
            f = open(mat_path, 'w')
            f.write(etree.tostring(root, pretty_print=True))
            f.close()
            perforce.checkout(mat_path)
        else:
            if os.path.isfile(mat_path):
                #perforce.checkout(mat_path)
                log.info('material file:' + lam_mat.name() + ' ALREADY EXISTS: using file:' + mat_path)
            else:
                f = open(mat_path, 'w')
                f.write(etree.tostring(root, pretty_print=True))
                f.close()
                perforce.checkout(mat_path)
                
        alpha = False

def opt_map_to_str(opt_map):
    opts = []
    for key, val in opt_map.items():
        if type(val) is bool:
            val = int(val)
        opts.append(key + '=' + str(val))
    return ';'.join(opts)