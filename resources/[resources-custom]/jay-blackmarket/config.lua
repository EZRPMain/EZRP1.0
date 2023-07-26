Config = Config or {}

Config.MinZOffset = 40
Config.Showzone = false
Config.Blackmarkets = {
    [1] = {
        label = "Blackmarket",
        radius = 1,
        coords = vector3(-50.70051, -1290.081, 30.901397),
        data = {
            debugPoly = Config.Showzone,
            useZ = true,
            data = {
                id = 1,
                enter = vector4(-50.70051, -1290.081, 30.901397, 266.8526),
                drawtext = "Enter",
            }
        }
    },
    [2] = {
        label = "Heist Market",
        radius = 1,
        coords = vector3(552.26556, 2658.6728, 45.873497),
        data = {
            debugPoly = Config.Showzone,
            useZ = true,
            data = {
                id = 2,
                enter = vector4(552.26556, 2658.6728, 45.873497, 278.2395),
                drawtext = "Enter",
            }
        }
    }
}
