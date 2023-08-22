RegisterNetEvent("fuckthis", function()
    local source = source
    -- Way to get Storage Key Holders (Save to DB or KVP?)
    local cids = {"CWP72955"}

    TriggerClientEvent("ez-storage:loadKeys", source, cids)
end)