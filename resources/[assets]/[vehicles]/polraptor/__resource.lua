resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

files {
	'data/handling.meta',
	'data/vehicles.meta',
	'data/carcols.meta',
	'data/carvariations.meta',
}

data_file 'HANDLING_FILE' 'data/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'

-- data_file 'AUDIO_SYNTHDATA' 'audioconfig/monroec_amp.dat'
-- data_file 'AUDIO_GAMEDATA' 'audioconfig/monroec_game.dat'
-- data_file 'AUDIO_SOUNDDATA' 'audioconfig/monroec_sounds.dat'
-- data_file 'AUDIO_WAVEPACK' 'sfx/dlc_monroec'

client_script 'vehicle_names.lua'
