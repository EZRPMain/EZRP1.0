business = nil
----------------------------------------------------------------
--------------	  BUSINESS SCREEN DUI CONFIG	  --------------
----------------------------------------------------------------

local function CreateDUI(business, id, url)
    Config.DUI[business][id].dui = { obj = CreateDui(url, Config.DUI[business][id].width, Config.DUI[business][id].height) }

    Config.DUI[business][id].dui.dict = ("%s-%s-dict"):format(business, id)
    Config.DUI[business][id].dui.texture  = ("%s-%s-txt"):format(business, id)
    local dictObject = CreateRuntimeTxd(Config.DUI[business][id].dui.dict)
    local duiHandle = GetDuiHandle(Config.DUI[business][id].dui.obj)
    CreateRuntimeTextureFromDuiHandle(dictObject, Config.DUI[business][id].dui.texture, duiHandle)
    AddReplaceTexture(Config.DUI[business][id].ytd, Config.DUI[business][id].ytdname, Config.DUI[business][id].dui.dict, Config.DUI[business][id].dui.texture)
end

local function destroyDui(business, id)
    SetDuiUrl(Config.DUI[business][id].dui.obj, 'about:blank')
    DestroyDui(Config.DUI[business][id].dui.obj)
    RemoveReplaceTexture(Config.DUI[business][id].ytd, Config.DUI[business][id].ytdname)
    Config.DUI[business][id].dui = nil
end

RegisterNetEvent('qb-businesses:client:updateDUI', function(business, id, url)
    Config.DUI[business][id].url = url
    if Config.DUI[business][id].dui then
        SetDuiUrl(Config.DUI[business][id].dui.obj, Config.DUI[business][id].url)
    else
        CreateDUI(business, id, url)
    end
end)

RegisterNetEvent('qb-businesses:client:changePainting', function(data)
    local id = data.id

    local dialog = exports[Config.Input]:ShowInput({
        header = Lang:t("header.painting"),
        submitText = Lang:t("success.submit"),
        inputs = {
            {
                type = 'text',
                isRequired = true,
                name = 'painting',
                text = Lang:t("input.painting")
            },
        }
    })
    if dialog then
        if not dialog.painting then return end
        TriggerServerEvent('qb-businesses:server:SetDUI', data.business, id, dialog.painting)
    end
end)

RegisterNetEvent('qb-businesses:client:resetPainting', function(data)
    if data.business == business then
        for k=1, #Config.DUI[data.business] do
            if Config.DUI[data.business][k].url then
                destroyDui(data.business, k)
                Config.DUI[data.business][k].url = nil
            end
        end
    end
end)

CreateThread(function()
    for business,registers in pairs(Config.Registers) do
        local options = {}
        if Config.DUI[business] and #Config.DUI[business] > 0 then
            for i=1, #Config.DUI[business] do
                options[#options+1] = {
                    event = "qb-businesses:client:changePainting",
                    icon = "fa-solid fa-tablet-screen-button",
                    label = Lang:t('target.change_picture', {id = i}),
                    job = business,
                    ---- ** Custom Data we are passing inside the Zone ** ----
                    business = business,
                    id = i
                }
            end
            options[#options+1] = {
                event = "qb-businesses:server:resetPainting",
                icon = "fa-solid fa-tablet-screen-button",
                label = Lang:t('target.reset_picture'),
                job = business,
                type = 'server',
                ---- ** Custom Data we are passing inside the Zone ** ----
                business = business
            }
                for i=1, #registers do
                    if Config.EnableRegister then
                        if i > 1 then options[1] = nil end
                        table.insert(options, 1, {
                            event = "qb-businesses:client:openCashRegister",
                            icon = "fa-solid fa-tablet-screen-button",
                            label = Lang:t('target.cash_register'),
                            job = business,
                            ---- ** Custom Data we are passing inside the Zone ** ----
                            business = business
                        })
                    end
                    local label = business.."Regisers"..i
                    exports['qb-target']:AddCircleZone(label, registers[i].coords, registers[i].polysize, {
                        name = label,
                        useZ = true,
                        debugPoly = Config.debugPoly
                    }, {
                        options = options,
                        distance = 1.5
                    })
                end
        else
            for i=1, #registers do
                if Config.EnableRegister then
                    if i > 1 then options[1] = nil end
                    table.insert(options, 1, {
                        event = "qb-businesses:client:openCashRegister",
                        icon = "fa-solid fa-tablet-screen-button",
                        label = Lang:t('target.cash_register'),
                        job = business,
                        ---- ** Custom Data we are passing inside the Zone ** ----
                        business = business
                    })
                end
                local label = business.."Regisers"..i
                exports['qb-target']:AddCircleZone(label, registers[i].coords, registers[i].polysize, {
                    name = label,
                    useZ = true,
                    debugPoly = Config.debugPoly
                }, {
                    options = options,
                    distance = 1.5
                })
            end
        end
    end
end)

----------------------------------------------------------------
--------------	  POLYZONE IN AND OUT CONFIG	  --------------
----------------------------------------------------------------
function setupDUI()
    QBCore.Functions.TriggerCallback("qb-businesses:server:GetDuis",function(DUIs)
        Config.DUI = DUIs
    end)

    for k=1, #Config.Blips do
        local blip = AddBlipForCoord(Config.Blips[k].coords.x, Config.Blips[k].coords.y, Config.Blips[k].coords.z)
        SetBlipSprite(blip, Config.Blips[k].blip)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, Config.Blips[k].blipScale)
        SetBlipColour(blip, Config.Blips[k].color)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.Blips[k].label)
        EndTextCommandSetBlipName(blip)
    end

    for k=1, #Config.BusinessZone do
        local BusinessPoly = PolyZone:Create(Config.BusinessZone[k].zones, {
            name = Config.BusinessZone[k].label,
            minZ = 	Config.BusinessZone[k].minz,
            maxZ = Config.BusinessZone[k].maxz,
            debugPoly = Config.debugPoly
        })

        BusinessPoly:onPlayerInOut(function(isPointInside)
            if isPointInside then
                business = Config.BusinessZone[k].label
                BusinessWalkIn(Config.BusinessZone[k].label)
                BusinessTables()

                TriggerServerEvent('qb-businesses:server:EnteredBusiness', business)

				if Config.ZoneDuty and business == PlayerData.job.name and not onDuty then TriggerServerEvent("QBCore:ToggleDuty") end
                if Config.DUI[business] then
                    for i=1, #Config.DUI[business] do
                        if Config.DUI[business][i].url then
                            CreateDUI(business, i, Config.DUI[business][i].url)
                        end
                    end
                end
            else
                if not business then business = Config.BusinessZone[k].label end
				if Config.ZoneDuty and business == PlayerData.job.name and onDuty then TriggerServerEvent("QBCore:ToggleDuty") end
                BusinessTables()
                if Config.DUI[business] then
                    for i=1, #Config.DUI[business] do
                        if Config.DUI[business][i].dui then
                            destroyDui(business, i)
                        end
                    end
                end
                BusinessWalkIn(nil)
                business = nil
            end
        end)
    end
end
