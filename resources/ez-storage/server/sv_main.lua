RegisterNetEvent("fuckthis", function()
    local source = source
    -- Way to get Storage Key Holders (Save to DB or KVP?)
    local cids = {"CWP72955", "CWP72955","UBY85808"}

    local cidsConv = {}
    for i, cid in pairs(cids) do
        cidsConv[cid] = true
    end
    
    local garage = "Garage19"

    Shared.Storages[garage].hasKeys = cidsConv
    TriggerClientEvent("ez-storage:loadKeys", source, garage, cidsConv)
end)