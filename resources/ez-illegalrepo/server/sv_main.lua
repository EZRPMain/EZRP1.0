Framework:CreateCallback("ez-repo:isGroupMember",function(source, cb)
    local source = source
    local Player = Framework:GetPlayer(source)
    if not Player then return end
    local group = exports['qb-phone']:GetGroupByMembers(source)
    if group then  
        cb(group)
    end
    cb(false)
end)

Framework:CreateCallback("ez-repo:isGroupLeader",function(source, cb)
    local source = source
    local Player = Framework:GetPlayer(source)
    if not Player then return end
    local group = exports['qb-phone']:GetGroupByMembers(source)
    local isLeader = exports['qb-phone']:isGroupLeader(source, group)
    if isLeader then  
        cb(true)
    end
    cb(false)
end)

RegisterNetEvent("ez-repo:sendVehicles", function(groupId, vehList)
    local source = source
    local group = exports['qb-phone']:GetGroupByMembers(source)
    if group ~= groupId then
        print("Exploiter Found")
        return
    end
    local members = exports['qb-phone']:getGroupMembers(groupId)
    for src in pairs(members) do
        TriggerClientEvent("ez-repo:groupRecieveVehicles", src, groupId, vehList)
    end

end)

-- RegisterNetEvent("ez-repo:LockPick", function(groupId, plate)
--     local source = source
--     local group = exports['qb-phone']:GetGroupByMembers(source)
--     if group ~= groupId then
--         print("Exploiter Found")
--         return
--     end
--     local members = exports['qb-phone']:getGroupMembers(groupId)
--     for src in pairs(members) do
--         TriggerClientEvent("ez-repo:DeleteBlip", src, groupId, plate)
--     end

--     --ez-repo:DeleteBlip
-- end)

RegisterNetEvent('qb-vehiclekeys:server:AcquireVehicleKeys', function(plate)
    local source = source
    local group = exports['qb-phone']:GetGroupByMembers(source)
    print(group)
    if not group then return end
    local members = exports['qb-phone']:getGroupMembers(group)
    print(json.encode(members))
    for src in pairs(members) do
        print(src)
        TriggerClientEvent("ez-repo:DeleteBlip", src, group, plate)
    end
end)