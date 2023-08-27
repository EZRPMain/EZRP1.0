RegisterNetEvent("ez-hall:open", function()
    local PlayerData = Framework:GetPlayerData()
    local Items = Cityhall.BuyId
    local menu = {
        {
            header = "Cityhall",
            txt = "Welcome to Cityhall!",
            isMenuHeader = true
        },
    }

    for i = 1, #Items do
        local current = Items[i]
        local disabled = true

        if not current.license then 
            disabled = false 
        elseif PlayerData.metadata['licences'][current.license] then
            disabled = false
        end

        menu[#menu+1] = { 
            header = ("($%s) %s"):format(current.price, current.name),
            txt = current.txt,
            disabled = disabled,
            params = {
                isServer = true,
                event = "ez-hall:buyLicense",
                args = {
                    name = current.name,
                    item = current.item,
                    price = current.price,
                  
                }
            }
        }
    end

    exports['qb-menu']:openMenu(menu)

end)