-- Add Key Mapping
function AddKeyMapping(cmdCategory, keyDownCmd, keyUpCmd, cmdDesc, device, bind)
    if not bind then bind = "" end
    if not device then device = "keyboard" end

    if not cmdCategory then
        print("no category for keymapping, please enter one to register the keymap")
        return
    end

    if not cmdDesc then
        print("no description for keymapping, please enter one to register the keymap")
        return
    end

    local genDesc = ('(%s) %s'):format(cmdCategory, cmdDesc)

    -- making the commands

    local cmdDown = ("+interaction_wrapper__%s"):format(keyDownCmd)
    local cmdUp = ("-interaction_wrapper__%s"):format(keyDownCmd)
    RegisterCommand(cmdDown, function()
        ExecuteCommand(keyDownCmd)
    end)
    TriggerEvent('chat:removeSuggestion', cmdDown)
    TriggerEvent('chat:removeSuggestion', keyDownCmd)

    RegisterCommand(cmdUp, function()
        ExecuteCommand(keyUpCmd)
    end)
    TriggerEvent('chat:removeSuggestion', cmdUp)
    TriggerEvent('chat:removeSuggestion', keyUpCmd)

    --Registering Keymapping

    RegisterKeyMapping(cmdDown, genDesc, device, bind)

end
exports("AddKeyMapping", AddKeyMapping)

-- get keymapping

function GetKeyMapping(keyDownCmd)
    local cmdDown = ("+interaction_wrapper__%s"):format(keyDownCmd)
    local keybind = pBindString(2, GetHashKey(cmdDown) | 0x80000000, true)
    return keybind
end
exports("GetKeyMapping", GetKeyMapping)