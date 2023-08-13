fx_version 'cerulean'
game 'gta5'

author 'Jay FiveM'

files {
    'data/**/*.meta',
    'data/**/*.xml',
    'data/**/*.dat',
    'data/**/*.ytyp',

    'audioconfig/*.dat151.rel',
    'audioconfig/*.dat54.rel',
    'audioconfig/*.dat10.rel',
    'sfx/**/*.awc',
}

data_file 'HANDLING_FILE'            'data/**/handling*.meta'
data_file 'VEHICLE_LAYOUTS_FILE'    'data/**/vehiclelayouts*.meta'
data_file 'VEHICLE_METADATA_FILE'    'data/**/vehicles*.meta'
data_file 'CARCOLS_FILE'            'data/**/carcols*.meta'
data_file 'VEHICLE_VARIATION_FILE'    'data/**/carvariations*.meta'
data_file 'CONTENT_UNLOCKING_META_FILE' 'data/**/*unlocks.meta'
data_file 'PTFXASSETINFO_FILE' 'data/**/ptfxassetinfo.meta'

client_script {
	'data/**/car_names.lua'
}

data_file 'AUDIO_GAMEDATA' 'audioconfig/polbuffalo4_game.dat'
\data_file 'AUDIO_GAMEDATA' 'audioconfig/polcaracara_game.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/polcomet_game.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/tamustanggt50_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/tamustanggt50_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_tamustanggt50'
data_file 'AUDIO_GAMEDATA' 'audioconfig/polvigero2_game.dat'
data_file 'AUDIO_GAMEDATA' 'audioconfig/polvstr_game.dat'