Config = {}

Config.Options = {
    -- ['jay'] = {
    --     name = 'Jay',
    --     desc = 'Best person ever',
    --     count = 0,
    -- },
    -- ['apple'] = {
    --     name = 'Apple',
    --     desc = 'Dumbest Fuck Alive',
    --     count = 0,
    -- },
}

Config.ElectionName = "Mayor Elections"

Config.ElectionHashtag = '#VoteForMayor'

Config.KeyPress = true

Config.ShowZone = true

Config.Zones = {
    [1] = {
        name = "legionsquare_vote", 
        coords = vector3(160.69364, -985.8894, 30.091932),
        length = 3.4,
        width = 3.6,
        data = {
            debugPoly = Config.ShowZone,
            heading = 340,
            minZ = 29.091932,
            maxZ = 31.091932,
        }
    }
}

Config.Total = 0

Config.GiveItem = true
