local boxesHit = {}
    
RPC.register('ez-vault:boxRobbed', function(zId)
    if zId == nil then return boxesHit end
    table.insert(boxesHit, zId)
    TriggerClientEvent('ez-vault:boxUpdate', -1, boxesHit)
end)

RegisterNetEvent('ez-yacht:panelHit')
AddEventHandler('ez-yacht:panelHit', function(state)
    TriggerClientEvent('ez-vault:cl_panelHit', -1, true)
end)

local boxZones = {
    {
        id = 'yacht_first_panel',
        center = vector3(-2069.61, -1020.06, 5.88),
        width = 1.0,
        height = 2,
        options = {minZ = 4.49, maxZ = 7.49, heading = 340, debugPoly = false},
    },
    -- Boxes

    {
        id = 'yacht_box_first',
        center = vector3(-2067.76, -1018.94, 5.88),
        width = 1,
        height = 1,
        options = {minZ = 4.49, maxZ = 7.49, heading = 70, debugPoly = false},
    },

    {
        id = 'yacht_box_second',
        center = vector3(-2067.4, -1020.7, 5.88),
        width = 1,
        height = 1,
        options = {minZ = 4.49, maxZ = 7.49, heading = 70, debugPoly = false},
    },
    {
        id = 'yacht_box_third',
        center = vector3(-2068.7, -1022.12, 5.88),
        width = 1,
        height = 1,
        options = {minZ = 4.49, maxZ = 7.49, heading = 70, debugPoly = false},
    },
}

RPC.register('yacht:fetchBoxData', function()
    return boxZones
end)