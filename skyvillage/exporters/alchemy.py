import os
import shutil
import pymel.core as pm
from core import perforce
from skyvillage import get_ignition_root
from . import opt_map_to_str

def export_asset(model_name, export_path):
    export_path = os.path.join(str(export_path), model_name)
    export(export_path, textures=True, texture_coords=True, materials=True, normals=True, colors=True)
    
def export_assetanimated(model_name, export_path):
    export_path = os.path.join(str(export_path), model_name)
    export(export_path, textures=True, animation=True, texture_coords=True, materials=True, normals=True, colors=True)

def export_rig(model_name, export_path):
    export_path = os.path.join(str(export_path), model_name)
    export(export_path, skeleton=True, textures=True, texture_coords=True, materials=True, normals=True, colors=True)

def export_char_animation(model_name, export_path):
    export_path = os.path.join(str(export_path), model_name)
    export(export_path, skeleton=True, animation=True)
    
def export(export_path,
           textures=False,
           texture_coords=False,
           texture_list=False,
           externalise_textures=False,
           materials=False,
           materials_path='',
           dummy_materials=False,
           lights=False,
           cameras=False,
           animation=False,
           skeleton=False,
           normals=False,
           colors=False,
           z_up=True,
           y_forward=False,
           scale=1.0,
           run_optimizers=False,
           translate_type='Linear',
           rotate_type='Quaternion Linear',
           scale_type='Linear'):
    opt_map = {
        'texExport': textures,
        'lightExport': lights,
        'camExport': cameras,
        'animExport': animation,
        'skeletonExport': skeleton,
        'normals': normals,
        'colors': colors,
        'texCoord': texture_coords,
        'materials': materials,
        'materialSubPath': materials_path,
        'dummyMaterials': dummy_materials,
        'zaxis': z_up,
        'yaxis': y_forward,
        'optimize': run_optimizers,
        'externalizeTextures': externalise_textures,
        'writeTextureList': texture_list,
        'scale': scale,
        'TranslationInterpolation': translate_type,
        'RotationInterpolation': rotate_type,
        'ScaleInterpolation': scale_type
    }
    
    rp = pm.PyNode('renderPartition')
    if not rp.hasAttr('igCommonSettings'):
        rp.addAttr('igCommonSettings', dataType='string')
    rp.attr('igCommonSettings').set(opt_map_to_str(opt_map))
    
    export_dir = os.path.dirname(export_path)
    if not os.path.isdir(export_dir):
        os.makedirs(export_dir)
        
    if not export_path.lower().endswith('.igb'):
        export_path += '.igb'
    
    if os.path.isfile(export_path):
        perforce.checkout(export_path)
    pm.system.exportAll(export_path, type='IntrinsicAlchemy', force=True, prompt=False)
    perforce.checkout(export_path)