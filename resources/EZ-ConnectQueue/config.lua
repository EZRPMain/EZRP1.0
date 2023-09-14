Config = {
	Default_Prio = 500, -- This is the default priority value if a discord isn't found
	AllowedPerTick = 1, -- How many players should we allow to connect at a time?
	CheckForGhostUsers = 40, -- How many seconds should the script check for ghosts users in the queue?
	HostDisplayQueue = true,
	onlyActiveWhenFull = false,
	Requirements = { -- A player must have the identifier to be allowed into the server
		Discord = true,
		Steam = false
	},
	WhitelistRequired = false, -- If this option is set to true, a player must have a role in Config.Rankings to be allowed into the server
	Debug = false,
	Webhook = 'https://discord.com/api/webhooks/1147975278296051773/gH-0QZ4TtHM3OSve7ZC_hX_9UTuO8XRMccNkA_jMs742WT2zTyxpUWqYgwhpPzgvKw-2',
	Displays = {
		Prefix = 'Eazy RP Connect Queue',
		ConnectingLoop = { 
			'💙🌐🔵',
			'🔵💙🌐',
			'🌐🔵💙',
			'🔵💙🌐',
			'💙🌐🔵',
		},
		Messages = {
			MSG_CONNECTING = 'You are being connected [{QUEUE_NUM}/{QUEUE_MAX}]: ', -- Default message if they have no discord roles 
			MSG_CONNECTED = 'You are up! You are being connected now :)',
			MSG_DISCORD_REQUIRED = 'Your Discord was not detected... You are required to have Discord to play on this server... Discord.gg/ePxWrZ9JsP',
			MSG_STEAM_REQUIRED = 'Your Steam was not detected... Open Steam and Restart FiveM.',
			MSG_NOT_WHITELISTED = 'You do not have a Discord role whitelisted for this server... You are not whitelisted.',
		},
	},
}

Config.Rankings = {
	-- LOWER NUMBER === HIGHER PRIORITY 
	-- ['roleID'] = {rolePriority, connectQueueMessage},
	['1140307332102885406'] = {500, "You are being connected [{QUEUE_NUM}/{QUEUE_MAX}]:"}, -- Discord User 
	['1053842293506965552'] = {250, "You are being connected [{QUEUE_NUM}/{QUEUE_MAX}]:"}, -- Supporter
	['1053842293775409254'] = {100, "You are being connected (Staff) [{QUEUE_NUM}/{QUEUE_MAX}]:"}, -- Staff 
	['1053842293725089851'] = {50, "You are being connected (Admin) [{QUEUE_NUM}/{QUEUE_MAX}]:"}, -- Admin
	['1132951992738775070'] = {1000, "You are being connected (Founder) [{QUEUE_NUM}/{QUEUE_MAX}]:"}, -- Founder
}