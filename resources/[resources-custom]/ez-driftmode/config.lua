Framework = exports['qb-core']
Config = Config or {}

Config.vehicletier = True,
tier = {"S", "A"},

twostep = false,

handlemods = {
    {"fInitialDragCoeff", 90.22}, 
    {"fDriveInertia", .31},
    {"fSteeringLock", 22}, 
    {"fTractionCurveMax", -1.1},
    {"fTractionCurveMin", -.4}, 
    {"fTractionCurveLateral", 2.5},
    {"fLowSpeedTractionLossMult", -.57}
}