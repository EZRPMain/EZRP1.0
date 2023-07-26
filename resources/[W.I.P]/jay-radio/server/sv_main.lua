local QBCore = exports['qb-core']:GetCoreObject()


local channelListener = {}


-- PMA Voice Listening | untested i hope it works lol
RegisterNetEvent('pma-voice:setTalkingOnRadio', function(talking)
    -- if GetConvarInt('voice_enableRadios', 1) ~= 1 then return end
	-- voiceData[source] = voiceData[source] or defaultTable(source)
	-- local plyVoice = voiceData[source]
    local channel = channelListener[src]
	local radioTbl = exports['pma-voice']:getPlayersInRadioChannel(channel)
	if radioTbl then
		-- radioTbl[source] = talking
		-- logger.verbose('[radio] Set %s to talking: %s on radio %s',source, talking, plyVoice.radio)
		for player, _ in pairs(radioTbl) do
			if player ~= source then
				TriggerClientEvent('pma-voice:setTalkingOnRadio', player, source, talking)
				-- logger.verbose('[radio] Sync %s to let them know %s is %s',player, source, talking and 'talking' or 'not talking')
			end
		end
	end
end)


-- Custom Functions

local function ListenToChannel(channel)
    local src = source
    channelListener[src] = channel
end
RegisterNetEvent("jay-radio:ListenToChannel", ListenToChannel)

-- Items

QBCore.Functions.CreateUseableItem("radio", function(source)
    TriggerClientEvent('jay-radio:use', source)
end)

QBCore.Functions.CreateUseableItem("radio2", function(source)
    TriggerClientEvent('jay-radio:useEncrypted', source) --uncoded
end)


--Radio Scanner

QBCore.Functions.CreateUseableItem("radioscanner", function(source, item)
    local src = source
    TriggerClientEvent("jay-radio:scan", src)
end)

QBCore.Functions.CreateCallback("jay-radio:ChannelsInRange", function(source, cb, coords)
    local players = QBCore.Functions.GetQBPlayers()
    local channels = {}
    for _, player in pairs(players) do
        local pcoords = GetEntityCoords(GetPlayerPed(player.PlayerData.source))
        local distance = #(coords - pcoords)
        if distance <= Config.ScannerRange then
            local state = Player(player.PlayerData.source).state
            local channel = state["radioChannel"]
            if channel ~= 0 then
                channels[channel] = {
                    frequency = channel,
                }
            end
        end
    end
    cb(channels)
end)

local function HasEncryptedRadio(source)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local Item = Player.Functions.GetItemByName("radio2")
    if not Item then return false end
    if Item.amount >= 1 then return true end
end

RegisterCommand("testt", function(source,args)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local Item = Player.Functions.GetItemByName("radio2")
    if not Item then Item = {amount = 0} end
    -- Item.amount
    TriggerClientEvent("QBCore:Notify", source, ""..Item.amount, "error")
    print(Item.amount)
end)

-- Channel Restriction | untested to see if you need the encrypted radio

for channel, config in pairs(Config.RestrictedChannels) do
    exports['pma-voice']:addChannelCheck(channel, function(source)
        local Player = QBCore.Functions.GetPlayer(source)
        if not HasEncryptedRadio(source) then return false end
        -- print(HasEncryptedRadio(source))
        return config[Player.PlayerData.job.name] and Player.PlayerData.job.onduty
    end)
end
