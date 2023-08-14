Add this to the top of your inventory client.lua
```lua
function MaxWeight(amount)
    Config.MaxInventoryWeight = amount
end
exports("MaxWeight", MaxWeight)
```
