import json

settings_file = 'coc-settings.json'

with open(settings_file, 'r') as file:
    settings = json.load(file)

setting_to_toggle = "pyright.inlayHints.variableTypes"
settings[setting_to_toggle] = not settings.get(setting_to_toggle, False)

with open(settings_file, 'w') as file:
    json.dump(settings, file, indent=4)
