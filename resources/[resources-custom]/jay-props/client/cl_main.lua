local QBCore = exports['qb-core']:GetCoreObject()

local isAttached = nil
local prop = nil

RegisterNetEvent("cl_attachProp", function(item)
    local Jay = Config.Items[item]
    local ped = PlayerPedId()
    local bone = GetPedBoneIndex(ped, 10706)
    local label = ("Putting on %s"):format(Jay.label)
    local model = Jay.prop
    local Takeoff = false
    if isAttached == item then 
        Takeoff = true
        label = ("Taking off %s"):format(Jay.label)
    elseif isAttached ~= item and isAttached ~= nil then 
        QBCore.Functions.Notify("Something is already attached", "error")
        return
    elseif isAttached == nil then 
        -- put on?? but i already coded above so it dont really matter lol kekw
    end

    while (not HasAnimDictLoaded("clothingshirt")) do
        RequestAnimDict("clothingshirt")
        Wait(5)
    end

    TaskPlayAnim(ped, "clothingshirt", "try_shirt_positive_d", 8.0, 1.0, -1, 49, 0, 0, 0, 0)

    QBCore.Functions.Progressbar("jay_was_here_6969", label, 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        if Takeoff then 
            SetModelAsNoLongerNeeded(prop)
            DeleteEntity(prop)
            isAttached = nil
            prop = nil
        else
            RequestModel(model)
            while not HasModelLoaded(model) do
                Wait(10)
            end
            prop = CreateObject(model, 1.0, 1.0, 1.0, true, true, false)   
            AttachEntityToEntity(prop, ped, bone, Jay.pos.x, Jay.pos.y, Jay.pos.z, Jay.rot.x, Jay.rot.y, Jay.rot.z, false, false, false, false, 2, true)
            isAttached = item
        end
        ClearPedTasks(ped)
    end, function() -- Cancer
        ClearPedTasks(ped)
        -- QBCore.Functions.Notify("Canceled!", 'error')
    end)

end)