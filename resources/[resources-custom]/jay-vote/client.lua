local QBCore = exports['qb-core']:GetCoreObject()
-- Functions

local function countVotes()
    local p = promise.new()
    QBCore.Functions.TriggerCallback('jay-vote:countCallback', function(result)
        p:resolve(result)
    end)
    return Citizen.Await(p)
end

RegisterCommand('getvotes', function()
    local Count = countVotes()
    local menu = {
        {
            header = "Total Votes: "..Count.Total,
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
    }

    for k,v in pairs(Count.Options) do 
        menu[#menu+1] = {
            header = Config.Options[k].name,
            txt = "Votes: ".. v,
            isMenuHeader = true, -- Set to true to make a nonclickable title
        }
    end
    exports['qb-menu']:openMenu(menu)
end)

local function notVoted()
    local p = promise.new()
    QBCore.Functions.TriggerCallback('jay-vote:hasPlayerVoted', function(result)
        p:resolve(result)
    end)
    return Citizen.Await(p)
end

-- Sign up

RegisterNetEvent("jay-vote:setOptions", function(data)
    print(data.key)
    Config.Options[data.key] = {
        name = data.fullname,
        desc = data.desc,
        count = 0,
    }
end)

RegisterCommand("signup", function()
    local menu = {
        {
            header = "Add your name to the list",
            isMenuHeader = true,
        },
        {
            header = "Signup",
            txt = "Have a chance to be elected to be the mayor",
            params = {
                isAction = true,
                event = function()
                    local dialog = exports['qb-input']:ShowInput({
                        header = "Sign up",
                        submitText = "Sign up",
                        inputs = {
                            {
                                text = "Description", -- text you want to be displayed as a place holder
                                name = "description", -- name of the input should be unique otherwise it might override
                                type = "text", -- type of the input
                                isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
                                -- default = "CID-1234", -- Default text option, this is optional
                            },
                        }
                    })
                    if dialog then
                        TriggerServerEvent("jay-vote:signUp", dialog)
                    end

                end,
            }
        },
    }

    exports['qb-menu']:openMenu(menu)
end)


-- Zones
function string.starts(String,Start)    
    return string.sub(String,1,string.len(Start))==Start 
end

local inZone = false

CreateThread(function()
    for k, v in pairs(Config.Zones) do
        -- print("test")
        exports["ps-zones"]:CreateBoxZone("voting_"..v.name, v.coords, v.length, v.width, v.data)
    end
end)

RegisterNetEvent("ps-zones:enter", function(ZoneName, ZoneData)
    if string.starts(ZoneName, "voting_") then
        exports["qb-core"]:DrawText("[E] Vote", 'left')
        inZone = true
    end
end)

RegisterNetEvent("ps-zones:leave", function(ZoneName, ZoneData)
    if string.starts(ZoneName, "voting_") then
        exports["qb-core"]:HideText()
        inZone = false
    end
end)


RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
end)

RegisterNetEvent('jay-vote:closeScript', function()
      SetNuiFocus(false, false)  
      SendNUIMessage({
         type = "close",
      })
        
end)

RegisterNUICallback('getConfig', function(data,cb)
    cb(Config)
end)

RegisterNUICallback('voteForSomeone', function(data)
    TriggerServerEvent('jay-vote:voteWithData', data.id)
end)

RegisterNUICallback('error', function()
    QBCore.Functions.Notify('Please Choose A Candidate!', 'error')
end)



RegisterCommand("+openVote", function()
    if not inZone then return end
    if Config.KeyPress then
        exports["qb-core"]:KeyPressed()
    end
    local notVoted = notVoted()
    if notVoted then
        SendNUIMessage({
            type = 'show',
        })
        SetNuiFocus(true, true)
        return
    end
    QBCore.Functions.Notify('You Have Already Voted!', 'error')
end)
RegisterKeyMapping('+openVote', '(Voting) Open Vote', 'keyboard', 'E')
