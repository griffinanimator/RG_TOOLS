import os
import pymel.core as pm

def convert_ig_to_lambert(char_name, rename=True):
    """
    Converts igMayaFxShaders to lamberts.
    
    Args:
        rename (bool): If set, materials will be renamed to 'vvmtl<SceneName>_<id>'
                       Otherwise, the old material names will be used, with '_lambert_<id>' attached.
    Returns:
        None
    """
    
    ig_mats = pm.ls(type='igMayaFxShader')
    
    for i in xrange(len(ig_mats)):
        ig_mat = ig_mats[i]
        
        if rename:
            name = 'vvmtl{0}_{1:02}'.format(char_name, i + 1)
        else:
            name = '{0}_lambert_{1:02}'.format(ig_mat.name(), i + 1)
        lam_mat = pm.shadingNode('lambert', name=name, asShader=True)
        lam_mat.setAttr('shadowAttenuation', 0)
        
        engines = ig_mat.listConnections(type='shadingEngine', source=False)
        for engine in engines:
            engine_plug = engine.attr('surfaceShader')
            ig_plug = ig_mat.attr('outColor')
            if ig_plug.isConnectedTo(engine_plug):
                ig_plug.disconnect(engine_plug)
            lam_mat.attr('outColor').connect(engine_plug)
        
        img_plug = pm.connectionInfo(ig_mat.attr('layer1ColorMap'), sourceFromDestination=True)
        if img_plug != '':
            img_plug = pm.PyNode(img_plug)
            img_plug.connect(lam_mat.attr('color'))
        
            state_plugs = ig_mat.attr('message').listConnections(type='igMayaRenderStates')
            for state_plug in state_plugs:
                if state_plug.attr('ALPHABLENDENABLE').get() > 0 or state_plug.attr('ALPHATESTENABLE').get() > 0:
                    img = img_plug.node()
                    img.attr('outTransparency').connect(lam_mat.attr('transparency'))
        
        pm.delete(ig_mat)
    
def fix_material_names():
    lam_mat_names = set()
    
    for mesh in pm.ls(type='mesh'):
        for engine in mesh.listConnections(type='shadingEngine'):
            for lam_mat in engine.listConnections(type='lambert'):
                if lam_mat.name() != 'lambert1':
                    if not pm.referenceQuery(lam_mat, isNodeReferenced=True):
                        lam_mat_names.add(lam_mat.name())
                    
    for lam_mat_name in lam_mat_names:
        lam_mat = pm.PyNode(lam_mat_name)
        images = lam_mat.listConnections(type='file')
        if len(images) > 0:
            #new_name = (os.path.split(os.path.split(images[0].attr('fileTextureName').get())[1])[0])
            new_name = os.path.splitext(os.path.split(images[0].attr('fileTextureName').get())[1]) [0]
            new_name = new_name + '_materials'
            pm.rename(lam_mat.name(), str(new_name))
        else:
            new_name = lam_mat.name() + '_materials'
    
    