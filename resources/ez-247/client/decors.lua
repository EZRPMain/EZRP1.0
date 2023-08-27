local decors = {
    {
        ["decorName"] = "isRobbable",
        ["decorType"] = 2
    }
}

for decorIndex, decorData in ipairs(decors) do
    DecorRegister(decorData["decorName"], decorData["decorType"])
end