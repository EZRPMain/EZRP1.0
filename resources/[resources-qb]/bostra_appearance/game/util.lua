local hashesComputed = false
local PED_TATTOOS = {}
local pedModelsByHash = {}

local function tofloat(num)
    return num + 0.0
end

local function isPedFreemodeModel(ped)
    local model = GetEntityModel(ped)
    return model == `mp_m_freemode_01` or model == `mp_f_freemode_01`
end

local function computePedModelsByHash()
    for i = 1, #Config.Peds.pedConfig do
        local peds = Config.Peds.pedConfig[i].peds
        for j = 1, #peds do
            pedModelsByHash[joaat(peds[j])] = peds[j]
        end
    end
end

---@param ped number entity id
---@return string
--- Get the model name from an entity's model hash
local function getPedModel(ped)
    if not hashesComputed then
        computePedModelsByHash()
        hashesComputed = true
    end
    return pedModelsByHash[GetEntityModel(ped)]
end

---@param ped number entity id
---@return table<number, table<string, number>>
local function getPedComponents(ped)
    local size = #constants.PED_COMPONENTS_IDS
    local components = table.create(size, 0)

    for i = 1, size do
        local componentId = constants.PED_COMPONENTS_IDS[i]
        components[i] = {
            component_id = componentId,
            drawable = GetPedDrawableVariation(ped, componentId),
            texture = GetPedTextureVariation(ped, componentId),
        }
    end

    return components
end

---@param ped number entity id
---@return table<number, table<string, number>>
local function getPedProps(ped)
    local size = #constants.PED_PROPS_IDS
    local props = table.create(size, 0)

    for i = 1, size do
        local propId = constants.PED_PROPS_IDS[i]
        props[i] = {
            prop_id = propId,
            drawable = GetPedPropIndex(ped, propId),
            texture = GetPedPropTextureIndex(ped, propId),
        }
    end
    return props
end

local function round(number, decimalPlaces)
    return tonumber(string.format("%." .. (decimalPlaces or 0) .. "f", number))
end

---@param ped number entity id
---@return table <number, number>
---```
---{ shapeFirst, shapeSecond, shapeThird, skinFirst, skinSecond, skinThird, shapeMix, skinMix, thirdMix }
---```
local function getPedHeadBlend(ped)
    -- GET_PED_HEAD_BLEND_DATA
    local shapeFirst, shapeSecond, shapeThird, skinFirst, skinSecond, skinThird, shapeMix, skinMix, thirdMix = Citizen
        .InvokeNative(0x2746BD9D88C5C5D0, ped, Citizen.PointerValueIntInitialized(0),
            Citizen.PointerValueIntInitialized(0),
            Citizen.PointerValueIntInitialized(0), Citizen.PointerValueIntInitialized(0),
            Citizen.PointerValueIntInitialized(0), Citizen.PointerValueIntInitialized(0),
            Citizen.PointerValueFloatInitialized(0), Citizen.PointerValueFloatInitialized(0),
            Citizen.PointerValueFloatInitialized(0))

    shapeMix = tonumber(string.sub(shapeMix, 0, 4))
    if shapeMix > 1 then shapeMix = 1 end

    skinMix = tonumber(string.sub(skinMix, 0, 4))
    if skinMix > 1 then skinMix = 1 end

    if not thirdMix then
        thirdMix = 0
    end
    thirdMix = tonumber(string.sub(thirdMix, 0, 4))
    if thirdMix > 1 then thirdMix = 1 end


    return {
        shapeFirst = shapeFirst,
        shapeSecond = shapeSecond,
        shapeThird = shapeThird,
        skinFirst = skinFirst,
        skinSecond = skinSecond,
        skinThird = skinThird,
        shapeMix = shapeMix,
        skinMix = skinMix,
        thirdMix = thirdMix
    }
end

---@param ped number entity id
---@return table<number, table<string, number>>
local function getPedFaceFeatures(ped)
    local size = #constants.FACE_FEATURES
    local faceFeatures = table.create(0, size)

    for i = 1, size do
        local feature = constants.FACE_FEATURES[i]
        faceFeatures[feature] = round(GetPedFaceFeature(ped, i - 1), 1)
    end

    return faceFeatures
end

---@param ped number entity id
---@return table<number, table<string, number>>
local function getPedHeadOverlays(ped)
    local size = #constants.HEAD_OVERLAYS
    local headOverlays = table.create(0, size)

    for i = 1, size do
        local overlay = constants.HEAD_OVERLAYS[i]
        local _, value, _, firstColor, secondColor, opacity = GetPedHeadOverlayData(ped, i - 1)

        if value ~= 255 then
            opacity = round(opacity, 1)
        else
            value = 0
            opacity = 0
        end

        headOverlays[overlay] = { style = value, opacity = opacity, color = firstColor, secondColor = secondColor }
    end

    return headOverlays
end

---@param ped number entity id
---@return table<string, number>
local function getPedHair(ped)
    return {
        style = GetPedDrawableVariation(ped, 2),
        color = GetPedHairColor(ped),
        highlight = GetPedHairHighlightColor(ped),
        texture = GetPedTextureVariation(ped, 2)
    }
end

local function getPedDecorationType()
    local pedModel = GetEntityModel(cache.ped)
    local decorationType

    if pedModel == `mp_m_freemode_01` then
        decorationType = "male"
    elseif pedModel == `mp_f_freemode_01` then
        decorationType = "female"
    else
        decorationType = IsPedMale(cache.ped) and "male" or "female"
    end

    return decorationType
end

local function getPedAppearance(ped)
    local eyeColor = GetPedEyeColor(ped)

    return {
        model = getPedModel(ped) or "mp_m_freemode_01",
        headBlend = getPedHeadBlend(ped),
        faceFeatures = getPedFaceFeatures(ped),
        headOverlays = getPedHeadOverlays(ped),
        components = getPedComponents(ped),
        props = getPedProps(ped),
        hair = getPedHair(ped),
        tattoos = client.getPedTattoos(),
        eyeColor = eyeColor < #constants.EYE_COLORS and eyeColor or 0
    }
end

local function setPlayerModel(model)
    if type(model) == "string" then model = joaat(model) end

    if IsModelInCdimage(model) then
        RequestModel(model)
        while not HasModelLoaded(model) do Wait(0) end

        SetPlayerModel(cache.playerId, model)
        Wait(150)
        SetModelAsNoLongerNeeded(model)

        if isPedFreemodeModel(cache.ped) then
            SetPedDefaultComponentVariation(cache.ped)
            SetPedHeadBlendData(cache.ped, 0, 0, 0, 0, 0, 0, 0, 0, 0, false)
        end

        PED_TATTOOS = {}
        return cache.ped
    end

    return cache.playerId
end

local function setPedHeadBlend(ped, headBlend)
    if headBlend and isPedFreemodeModel(ped) then
        SetPedHeadBlendData(ped, headBlend.shapeFirst, headBlend.shapeSecond, headBlend.shapeThird, headBlend.skinFirst,
            headBlend.skinSecond, headBlend.skinThird, tofloat(headBlend.shapeMix or 0), tofloat(headBlend.skinMix or 0),
            tofloat(headBlend.thirdMix or 0), false)
    end
end

local function setPedFaceFeatures(ped, faceFeatures)
    if faceFeatures then
        for k, v in pairs(constants.FACE_FEATURES) do
            SetPedFaceFeature(ped, k - 1, tofloat(faceFeatures[v]))
        end
    end
end

local function setPedHeadOverlays(ped, headOverlays)
    if headOverlays then
        for k, v in pairs(constants.HEAD_OVERLAYS) do
            local headOverlay = headOverlays[v]
            SetPedHeadOverlay(ped, k - 1, headOverlay.style, tofloat(headOverlay.opacity))

            if headOverlay.color then
                local colorType = 1
                if v == "blush" or v == "lipstick" or v == "makeUp" then
                    colorType = 2
                end

                SetPedHeadOverlayColor(ped, k - 1, colorType, headOverlay.color, headOverlay.secondColor)
            end
        end
    end
end

local function applyAutomaticFade(ped, style)
    local gender = getPedDecorationType()
    local hairDecoration = constants.HAIR_DECORATIONS[gender][style]

    if (hairDecoration) then
        AddPedDecorationFromHashes(ped, hairDecoration[1], hairDecoration[2])
    end
end

local function setTattoos(ped, tattoos, style)
    local isMale = client.getPedDecorationType() == "male"
    ClearPedDecorations(ped)
    if Config.AutomaticFade then
        tattoos["ZONE_HAIR"] = {}
        PED_TATTOOS["ZONE_HAIR"] = {}
        applyAutomaticFade(ped, style or GetPedDrawableVariation(ped, 2))
    end
    for k in pairs(tattoos) do
        for i = 1, #tattoos[k] do
            local tattoo = tattoos[k][i]
            local tattooGender = isMale and tattoo.hashMale or tattoo.hashFemale
            for _ = 1, (tattoo.opacity or 0.1) * 10 do
                AddPedDecorationFromHashes(ped, joaat(tattoo.collection), joaat(tattooGender))
            end
        end
    end
    if Config.RCoreTattoosCompatibility then
        TriggerEvent("rcore_tattoos:applyOwnedTattoos")
    end
end

local function setPedHair(ped, hair, tattoos)
    if hair then
        SetPedComponentVariation(ped, 2, hair.style, hair.texture, 0)
        SetPedHairColor(ped, hair.color, hair.highlight)
        if isPedFreemodeModel(ped) then
            setTattoos(ped, tattoos or PED_TATTOOS, hair.style)
        end
    end
end

local function setPedEyeColor(ped, eyeColor)
    if eyeColor then
        SetPedEyeColor(ped, eyeColor)
    end
end

local function setPedComponent(ped, component)
    if component then
        if isPedFreemodeModel(ped) and (component.component_id == 0 or component.component_id == 2) then
            return
        end

        SetPedComponentVariation(ped, component.component_id, component.drawable, component.texture, 0)
    end
end

local function setPedComponents(ped, components)
    if components then
        for _, v in pairs(components) do
            setPedComponent(ped, v)
        end
    end
end

local function setPedProp(ped, prop)
    if prop then
        if prop.drawable == -1 then
            ClearPedProp(ped, prop.prop_id)
        else
            SetPedPropIndex(ped, prop.prop_id, prop.drawable, prop.texture, false)
        end
    end
end

local function setPedProps(ped, props)
    if props then
        for _, v in pairs(props) do
            setPedProp(ped, v)
        end
    end
end

local function setPedTattoos(ped, tattoos)
    PED_TATTOOS = tattoos
    setTattoos(ped, tattoos)
end

local function getPedTattoos()
    return PED_TATTOOS
end

local function addPedTattoo(ped, tattoos)
    setTattoos(ped, tattoos)
end

local function removePedTattoo(ped, tattoos)
    setTattoos(ped, tattoos)
end

local function setPreviewTattoo(ped, tattoos, tattoo)
    local isMale = client.getPedDecorationType() == "male"
    local tattooGender = isMale and tattoo.hashMale or tattoo.hashFemale

    ClearPedDecorations(ped)
    for _ = 1, (tattoo.opacity or 0.1) * 10 do
        AddPedDecorationFromHashes(ped, joaat(tattoo.collection), tattooGender)
    end
    for k in pairs(tattoos) do
        for i = 1, #tattoos[k] do
            local aTattoo = tattoos[k][i]
            if aTattoo.name ~= tattoo.name then
                local aTattooGender = isMale and aTattoo.hashMale or aTattoo.hashFemale
                for _ = 1, (aTattoo.opacity or 0.1) * 10 do
                    AddPedDecorationFromHashes(ped, joaat(aTattoo.collection), joaat(aTattooGender))
                end
            end
        end
    end
    if Config.AutomaticFade then
        applyAutomaticFade(ped, GetPedDrawableVariation(ped, 2))
    end
end

local function setPedAppearance(ped, appearance)
    if appearance then
        setPedComponents(ped, appearance.components)
        setPedProps(ped, appearance.props)

        if appearance.headBlend and isPedFreemodeModel(ped) then setPedHeadBlend(ped, appearance.headBlend) end
        if appearance.faceFeatures then setPedFaceFeatures(ped, appearance.faceFeatures) end
        if appearance.headOverlays then setPedHeadOverlays(ped, appearance.headOverlays) end
        if appearance.hair then setPedHair(ped, appearance.hair, appearance.tattoos) end
        if appearance.eyeColor then setPedEyeColor(ped, appearance.eyeColor) end
        if appearance.tattoos then setPedTattoos(ped, appearance.tattoos) end
    end
end

local function setPlayerAppearance(appearance)
    if appearance then
        setPlayerModel(appearance.model)
        setPedAppearance(cache.ped, appearance)
    end
end

local angleY, angleZ, cam, running, gEntity, gRadius, gRadiusMax, gRadiusMin, gHeight, gHeightMax, scrollIncrements, mouse =
    0.0, 0.0, nil, false, nil, nil, nil, nil, 0.0, 1.0, nil, false

local function cos(degrees)
    return math.cos(math.rad(degrees))
end

local function sin(degrees)
    return math.sin(math.rad(degrees))
end

local function setCamPosition()
    local entityCoords = GetEntityCoords(cache.ped)
    local mouseX = GetDisabledControlNormal(0, 1) * 8.0
    local mouseY = GetDisabledControlNormal(0, 2) * 8.0

    angleZ = angleZ - mouseX
    angleY = math.clamp(angleY + mouseY, -89.0, 89.0)

    local cosAngleZ, cosAngleY, sinAngleZ, sinAngleY = cos(angleZ), cos(angleY), sin(angleZ), sin(angleY)

    local offset = vec3(
        ((cosAngleZ * cosAngleY) + (cosAngleY * cosAngleZ)) / 2 * gRadius,
        ((sinAngleZ * cosAngleY) + (cosAngleY * sinAngleZ)) / 2 * gRadius,
        sinAngleY * gRadius
    )

    local camPos = vec3(entityCoords.x + offset.x, entityCoords.y + offset.y, entityCoords.z + offset.z + gHeight)
    SetCamCoord(cam, camPos.x, camPos.y, camPos.z)
    PointCamAtCoord(cam, entityCoords.x, entityCoords.y, entityCoords.z + gHeight)
end

local function rotateCam()
    while running do
        SetMouseCursorActiveThisFrame()
        lib.disableControls()
        setCamPosition()
        if IsDisabledControlJustReleased(0, 24) then
            SetMouseCursorSprite(3)
            return
        end

        Wait(0)
    end
end

local function rotatePed()
    local previousHeading = GetEntityHeading(cache.ped)
    local heading = previousHeading
    local rotationSpeed = 2.0
    while running do
        SetMouseCursorActiveThisFrame()
        lib.disableControls()
        local mouseX = GetDisabledControlNormal(0, 1) * 8.0
        heading = heading - mouseX * rotationSpeed
        SetEntityHeading(cache.ped, heading)
        if IsDisabledControlReleased(0, 25) then
            SetMouseCursorSprite(3)
            return
        end
        Wait(0)
    end
end

local isSpotlightActive = false
local function getSpotlight()
    while isSpotlightActive do
        lib.disableControls()
        local coords = GetEntityCoords(cache.ped)
        local forward = GetEntityForwardVector(cache.ped)
        DrawSpotLight(coords.x + forward.x, coords.y + forward.y, coords.z + 3.0, 0.0, 90.0, -180.0, 255, 255, 255, 5.0, 1.0, 1.0, 100.0, 1.0)
        Wait(0)
    end
end

local function toggleSpotlight()
    if not isSpotlightActive then
        isSpotlightActive = true
        CreateThread(getSpotlight)
        return
    else
        isSpotlightActive = false
        return
    end
end

local function lightStatus()
    return isSpotlightActive
end

local currentAnimationIndex = 1

local function inputListener()
    setCamPosition()
    CreateThread(function()
        while running do
            lib.disableControls()
            if mouse then
                SetMouseCursorActiveThisFrame()
                SetMouseCursorSprite(3)
            end

            if IsDisabledControlJustPressed(0, 24) then -- Left Click rotate camera
                SetMouseCursorSprite(4)
                rotateCam()
            end

            if IsDisabledControlJustPressed(0, 25) then -- Right Click rotate entity
                SetMouseCursorSprite(4)
                rotatePed()
            end

            if IsDisabledControlJustReleased(0, 14) then -- Mouse Zoom In
                if gRadius + scrollIncrements <= gRadiusMax then
                    gRadius = gRadius + scrollIncrements
                    setCamPosition()
                end
            elseif IsDisabledControlJustReleased(0, 15) then -- Mouse Zoom Out
                if gRadius - scrollIncrements >= gRadiusMin then
                    gRadius = gRadius - scrollIncrements
                    setCamPosition()
                end
            end

            if IsDisabledControlPressed(0, 32) then -- W Camera Pan Up
                if gHeight + 0.1 <= gHeightMax then
                    gHeight = math.min(gHeight + 0.01, gHeightMax)
                    setCamPosition()
                end
            elseif IsDisabledControlPressed(0, 33) then -- S Camera Pan Down
                if gHeight - 0.1 >= -gHeightMax then
                    gHeight = math.max(gHeight - 0.01, -gHeightMax)
                    setCamPosition()
                end
            end

            if IsDisabledControlJustPressed(0, 38) then -- E Play Animations
                local animation = Config.Bostra.Animations[currentAnimationIndex]
                if animation.Dictionary ~= 'cancel' then
                    lib.requestAnimDict(animation.Dictionary, 1500)
                    TaskPlayAnim(cache.ped, animation.Dictionary, animation.Animation, 8.0, 8.0, -1, 1, 0, false, false,
                        false)
                    currentAnimationIndex = currentAnimationIndex % #Config.Bostra.Animations + 1
                else
                    ClearPedTasksImmediately(cache.ped)
                    currentAnimationIndex = currentAnimationIndex % #Config.Bostra.Animations + 1
                end
            end

            if IsDisabledControlJustReleased(0, 44) then -- 'Q' Spotlight
                toggleSpotlight()
            end

            if IsDisabledControlJustPressed(0, 202) or IsDisabledControlJustPressed(0, 322) then -- ESC or Backspace Close Menu
                SetNuiFocus(true, true)
                lib.hideTextUI()
                mouse = false
            end

            Wait(0)
        end
    end)
end

local function getMouse()
    mouse = true
end

local function isDragActive()
    return running
end

local function showMenu()
    local isOpen, _ = lib.isTextUIOpen(string.format(_L("bostra.camera")))
    if not isOpen then
        lib.showTextUI(string.format(_L("bostra.camera")))
    else
        lib.hideTextUI()
    end
end

local function startDragCam(entity, radiusOptions)
    if running then
        mouse = true
        return
    end
    lib.showTextUI(string.format(_L("bostra.camera")))
    mouse, running, gEntity, gRadius, gRadiusMin, gRadiusMax, scrollIncrements, cam = true, true, entity,
        radiusOptions?.initial or 2.0, radiusOptions?.min or 0.35, radiusOptions?.max or 2.0,
        radiusOptions?.scrollIncrements or 0.15, CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 1, true, false)
    angleZ = (GetEntityHeading(entity) + 90)
    angleY = 0.0

    lib.disableControls:Add(1, 2, 3, 4, 5, 6, 8, 9, 12, 13, 21, 24, 25, 30, 31, 32, 33, 36, 38, 44, 47, 58, 69, 75, 140,
        141, 142, 143, 200, 202, 257, 263, 264, 322)
    inputListener()
end


local function stopDragCam()
    mouse, running, isSpotlightActive, cam = false, false, false, nil
    SetCamActive(cam, false)
    DestroyCam(cam, true)
    RenderScriptCams(false, true, 0, true, false)
    lib.hideTextUI()
end


exports('startDragCam', startDragCam)
exports('stopDragCam', stopDragCam)
exports("getPedModel", getPedModel)
exports("getPedComponents", getPedComponents)
exports("getPedProps", getPedProps)
exports("getPedHeadBlend", getPedHeadBlend)
exports("getPedFaceFeatures", getPedFaceFeatures)
exports("getPedHeadOverlays", getPedHeadOverlays)
exports("getPedHair", getPedHair)
exports("getPedAppearance", getPedAppearance)

exports("setPlayerModel", setPlayerModel)
exports("setPedHeadBlend", setPedHeadBlend)
exports("setPedFaceFeatures", setPedFaceFeatures)
exports("setPedHeadOverlays", setPedHeadOverlays)
exports("setPedHair", setPedHair)
exports("setPedEyeColor", setPedEyeColor)
exports("setPedComponent", setPedComponent)
exports("setPedComponents", setPedComponents)
exports("setPedProp", setPedProp)
exports("setPedProps", setPedProps)
exports("setPlayerAppearance", setPlayerAppearance)
exports("setPedAppearance", setPedAppearance)
exports("setPedTattoos", setPedTattoos)

client = {
    getPedAppearance = getPedAppearance,
    setPlayerModel = setPlayerModel,
    setPedHeadBlend = setPedHeadBlend,
    setPedFaceFeatures = setPedFaceFeatures,
    setPedHair = setPedHair,
    setPedHeadOverlays = setPedHeadOverlays,
    setPedEyeColor = setPedEyeColor,
    setPedComponent = setPedComponent,
    setPedProp = setPedProp,
    setPlayerAppearance = setPlayerAppearance,
    setPedAppearance = setPedAppearance,
    getPedDecorationType = getPedDecorationType,
    isPedFreemodeModel = isPedFreemodeModel,
    setPreviewTattoo = setPreviewTattoo,
    setPedTattoos = setPedTattoos,
    getPedTattoos = getPedTattoos,
    addPedTattoo = addPedTattoo,
    removePedTattoo = removePedTattoo,
    getPedModel = getPedModel,
    setPedComponents = setPedComponents,
    setPedProps = setPedProps,
    getPedComponents = getPedComponents,
    getPedProps = getPedProps,
    startDragCam = startDragCam,
    stopDragCam = stopDragCam,
    toggleSpotlight = toggleSpotlight,
    isDragActive = isDragActive,
    lightStatus = lightStatus,
    getMouse = getMouse,
    showMenu = showMenu,
}
