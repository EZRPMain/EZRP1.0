CreateThread(function()
    -- Main
    RegisterCommand('+useMain', function() 
        TriggerEvent('interaction:Main', true)
    end, false)
    RegisterCommand('-useMain', function() 
        TriggerEvent('interaction:Main', false)
    end, false)
    exports["jay-interactions"]:AddKeyMapping("Interactions", "+useMain", "-useMain", "Main", "keyboard", "E")

    -- Seconadry
    RegisterCommand('+use2nd', function() 
        TriggerEvent('interaction:Secondary', true)
    end, false)
    RegisterCommand('-use2nd', function() 
        TriggerEvent('interaction:Secondary', false)
    end, false)
    exports["jay-interactions"]:AddKeyMapping("Interactions", "+use2nd", "-use2nd", "Secondary", "keyboard", "H")

    -- Other
    RegisterCommand('+use3rd', function() 
        TriggerEvent('interaction:Other', true)
    end, false)
    RegisterCommand('-use3rd', function() 
        TriggerEvent('interaction:Other', false)
    end, false)
    exports["jay-interactions"]:AddKeyMapping("Interactions", "+use3rd", "-use3rd", "Other", "keyboard", "M")
end)

if Config.Debug then 
    AddEventHandler("interaction:Main", function(keyDown)
        if keyDown then
            print("keyDown")
        elseif not keyDown then 
            print("keyUp")
        end
    end)
end