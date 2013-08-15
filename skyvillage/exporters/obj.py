from . import opt_map_to_str


def export(export_path,
           materials=False,
           normals=False):
    opt_map = {
        'groups': True,
        'ptgroups': True,
        'materials': materials,
        'smoothing': True,
        'normals': normals
    }
    
    export_dir = os.path.dirname(export_path)
    if not os.path.isdir(export_dir):
        os.makedirs(export_dir)
    
    pm.system.saveFile(export_path, type='OBJexport', options=opt_map_to_str(opt_map))