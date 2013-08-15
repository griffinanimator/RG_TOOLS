import os
import core.settings as settings
import core.settings.settingsui as settingsui


settings.default('/tfb_root', 'c:/tfb')
settings.default('/use_ignition_root_env', True)
settings.default('skyvillage/ignition_root', os.path.abspath(os.getenv('IGNITION_BRANCH')))
settings.default('skyvillage/content_root', os.path.join(os.path.abspath(os.getenv('IGNITION_BRANCH')), 'game', 'content'))
settings.default('skyvillage/missing_texture', 'textures:/missing_texture.png')

settingsui.expose('skyvillage/use_ignition_root_env', 'Use IGNITION_BRANCH', bool, category='skyvillage')
settingsui.expose('skyvillage/ignition_root', 'Ignition Root', str, category='skyvillage')
settingsui.expose('skyvillage/content_root', 'Asset Root', str, category='skyvillage')

def get_ignition_root():
    if settings.get('skyvillage/use_ignition_root_env'):
        return os.path.abspath(os.getenv('IGNITION_BRANCH'))
    return os.path.abspath(settings.get('skyvillage/ignition_root'))