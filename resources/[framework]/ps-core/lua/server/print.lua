PSCore = {}

function PSCore.Print(message, messageType)
    local colors = {
        success = "^2", -- Green
        warning = "^3", -- Yellow
        error = "^1" -- Red
    }

    local color = colors[messageType] or "" -- Get the corresponding color code

    -- Print the message with the specified color
    print(color .. message .. "^7")
end
