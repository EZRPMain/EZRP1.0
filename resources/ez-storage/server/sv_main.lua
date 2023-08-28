MySQL.ready(function()
	Citizen.Wait(500)

    for name in pairs(Shared.Storages) do
        local result = MySQL.scalar.await('SELECT * from ez_storage WHERE zone = ?', {name})
        -- if not result then 
        --     MySQL.insert('INSERT INTO ez_storage (zone) VALUES (:zone) ON DUPLICATE KEY UPDATE zone = :zone', {
        --         ['zone'] = name
        --     })
        --     print("Created "..name)
        -- end
        -- Wait(100)
    end
end)

local function SyncOwners(src)
    for name in pairs(Shared.Storages) do
        local result = MySQL.scalar.await('SELECT cid from ez_storage WHERE zone = ?', {name})
        if result then 
            print(result)
            TriggerClientEvent("ez-storage:syncOwners", src, result, name)
        end
    end
end

local function SyncOwner(src, garage)
    local cid = Framework:GetPlayer(src).PlayerData.citizenid
    -- TriggerClientEvent("ez-storage:syncOwners", -1, cid, garage)
end

local function ConvertCidToTrue(cids)
    local result = {}
    for i, cid in pairs(cids) do
        result[cid] = true
    end
    return result
end


local function GetStorageKeyHolders(garage)
    local keyholders = {}
    local result = MySQL.scalar.await('SELECT keyholders from ez_storage WHERE zone = ?', {garage})
    if result then 
        keyholders = json.decode(result)
    end
    return keyholders
end

RegisterCommand("keyholder", function(s,a)
    local Player = Framework:GetPlayer(s)
    local cid = Player.PlayerData.citizenid
    if a[1] then 
        local keyholders = GetStorageKeyHolders(a[1])
        if keyholders then
            local keyholder = ConvertCidToTrue(keyholders)
            if keyholder[cid] then 
                TriggerClientEvent("QBCore:Notify", s, "You hold keys to ".. a[1])
            else
                TriggerClientEvent("QBCore:Notify", s, "You don't hold keys to "..a[1])
            end
        else
            TriggerClientEvent("QBCore:Notify", s, "No one holds keys to "..a[1])
        end
        
    end

end)

local function ReloadKeys(source, garage)
    local Player = Framework:GetPlayer(source)
    local cid = Player.PlayerData.citizenid
    local keyholders = GetStorageKeyHolders(garage)
    if keyholders then
        local keyholder = ConvertCidToTrue(keyholders)
        if keyholder[cid] then 
            Shared.Storages[garage].hasKeys = keyholder
            TriggerClientEvent("ez-storage:loadKeys", source, garage, Shared.Storages[garage].hasKeys)
            return true
        end
        return false
    end
    return false
end


local function AddKeyHolder(src, garage, citizenid)
    local Player = Framework:GetPlayer(src)
    local cid = Player.PlayerData.citizenid
    if Shared.Storages[garage].owner and Shared.Storages[garage].owner ~= cid then 
        -- TriggerClientEvent
        return "Not Owner"
    end

    local result = MySQL.scalar.await('SELECT keyholders from ez_storage WHERE zone = ?', {garage})
    if not result then
        MySQL.update('UPDATE ez_storage SET keyholders = ? WHERE zone = ?',{ json.encode({citizenid}), garage })
    elseif result then 
        local keyholders = GetStorageKeyHolders(garage)

        local hasKeyAlready = ConvertCidToTrue(keyholders)
        if hasKeyAlready[cid] then 
            return "Already has keys"
        end

        keyholders[#keyholders+1] = citizenid
        MySQL.update('UPDATE ez_storage SET keyholders = ? WHERE zone = ?',{ json.encode(keyholders), garage })
    end
    local reloadKey = ReloadKeys(src, garage)
    if reloadKey then 
        print(("[SRC: %s] has loaded storage keys for %s"):format(src, garage)) 
    end
end

RegisterCommand("addkeyholder", function(s,a)
    if a[1] and a[2] then 
        local canAdd = AddKeyHolder(s, a[1], a[2])
        
    end
end)

RegisterNetEvent("ez-storage:AddKeys", function(otherPlayer, garage)
    local source = source
    if isDebug then 
        garage = garage or "Garage1"
    end

    local Player = Framework:GetPlayer(source)

    local Player2 = Framework:GetPlayer(otherPlayer)

    if Player2 then 
        local canAdd = AddKeyHolder(s, garage, Player2.PlayerData.citizenid)
        -- Shared.Storages[garage].hasKeys[Player2.PlayerData.citizenid] = true
        -- MySQL.insert
    else
        TriggerClientEvent("QBCore:Notify", source, "Person does not exist", "error")
    end

end)

RegisterNetEvent("ez-storage:scuffFix", function()
    local source = source
    SyncOwners(source)
    local ped = GetPlayerPed(source)
    local coords = GetEntityCoords(ped)
    local dist = #(vector3(-1718.24, -746.92, 10.19) - coords)
    if dist < 200 then 
        for name in pairs(Shared.Storages) do 
            local result = ReloadKeys(source, name)
            if result then 
                print(("[SRC: %s] has loaded storage keys for %s"):format(source, name)) 
            end
        end
        TriggerClientEvent("QBCore:Notify", source, "STORAGE SCUFF FIXED")
    -- elseif dist < 75 then
    --     TriggerClientEvent("QBCore:Notify", source, "If you a trying to scuff fix storage go closer to blue door ;)") 
    end
end)

RegisterNetEvent("QBCore:Server:OnPlayerLoaded", function()
    local source = source
    SyncOwners(source)
    for name in pairs(Shared.Storages) do 
        local result = ReloadKeys(source, name)
        if result then 
            print(("[SRC: %s] has loaded storage keys for %s"):format(source, name))
        end
    end
end)

RegisterNetEvent("ez-storage:CheckAva", function()
    local source = source
    local cid = Framework:GetPlayer(source).PlayerData.citizenid
    local menuData = {
        {
            header = "Storage Rental",
            isMenuHeader = true,
        }
    }
    for name, data in pairs(Shared.Storages) do
        -- print(name)
        local addData = {
            header = data.label,
            txt = "",
            params = {
                event = "ez-storage:openBuyMenu",
                args = {
                    name = name,
                }
            }
        }
        if data.owner ~= nil then 
            if data.owner ~= cid then
                addData.disabled = true
            end
        end
        menuData[#menuData+1] = addData
    end


    TriggerClientEvent("qb-menu:client:openMenu", source, menuData)
end)

RegisterNetEvent("ez-storage:rentCheck", function(garage, timeadd, isAdd)
    local source = source
    local Player = Framework:GetPlayer(source)
    local price = Shared.RentUtil[timeadd].price
    local addTime = Shared.RentUtil[timeadd].time
    local newTime = os.time() + addTime
    local cid = Player.PlayerData.citizenid 
    if not Shared.Storages[garage].owner and not isAdd then
        if Player.Functions.RemoveMoney("bank", price, "storage-rental") then
            Shared.Storages[garage].owner = cid

            local canAdd = AddKeyHolder(source, garage, Shared.Storages[garage].owner)
            TriggerClientEvent("ez-storage:syncOwners", -1, Shared.Storages[garage].owner, garage)
            MySQL.update('UPDATE ez_storage SET cid = ?, lastpaid = ?, needpay = ? WHERE zone = ?',{ cid, os.time(), newTime, garage })
        end
    elseif Shared.Storages[garage].owner == Player.PlayerData.citizenid and isAdd then 
        if Player.Functions.RemoveMoney("bank", price, "storage-rental") then

            MySQL.update('UPDATE ez_storage SET cid = ?, lastpaid = ?, needpay = ? WHERE zone = ?',{ cid, os.time(), newTime, garage })
        end
    end
end)

RegisterNetEvent("ez-storage:keyHolders_sv", function(garage)
    local source = source

    local keyholders = GetStorageKeyHolders(garage)

    local menuData = {
        {
            header = "View Access",
            isMenuHeader = true,
        },
    }
    -- for i, data in pairs(fakeData) do 
    for i = 1,#keyholders do
        local cid = keyholders[i]
        local Player = Framework:GetPlayerByCitizenId(cid)
        local fakeData = {
            fn = Player.PlayerData.charinfo.firstname,
            ln = Player.PlayerData.charinfo.lastname,
            cid = Player.PlayerData.citizenid,
        }
        menuData[#menuData+1] = {
            header = ("%s %s"):format(fakeData.fn, fakeData.ln),
            txt = ("CID: %s"):format(fakeData.cid),
            params = {
                event = "ez-storage:openPlayer",
                args = {
                    name = garage,
                    Player = Player,
                    cid = cid,
                    data = fakeData,
                }
            }
        }
    end
    -- end

    menuData[#menuData+1] = {
        header = "Add Player",
        txt = "",
        params = {
            event = "ez-storage:AddPlayerDialog",
            args = {
                name = garage,
            }
        }
    }
    menuData[#menuData+1] = {
        header = "< Go Back",
        txt = "",
        params = {
            event = "ez-storage:openBuyMenu",
            args = {
                name = garage,
            }
        }
    }
    TriggerClientEvent("qb-menu:client:openMenu", source, menuData)
end)