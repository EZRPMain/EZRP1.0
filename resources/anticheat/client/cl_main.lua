print(GetPlayerServerId(PlayerId()))

print(PedToNet(PlayerPedId()))

CreateThread(function()
    local model = `ig_stix`
    local coords = vector4(-812.82, 179.64, 76.75, 138.03)
    local x,y,z, heading = coords.x, coords.y, coords.z, coords.w
    print(x,y,z, heading)
    local isNetwork = false
    local bScriptHostPed = false
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end
    print("Test")
    for pedType = 1,1000 do
        CreateThread(function()
            local pedp = CreatePed(
                pedType --[[ integer ]], 
                model --[[ Hash ]], 
                x --[[ number ]], 
                y --[[ number ]], 
                z --[[ number ]], 
                heading --[[ number ]], 
                isNetwork --[[ boolean ]], 
                bScriptHostPed --[[ boolean ]]
            )
        end)

    
    end
    
end)