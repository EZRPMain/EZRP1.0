--// Spawn Ped anad Ped target once near Ped
CreateThread(function()
    RequestModel(Shared.Ped.model)
    while not HasModelLoaded(Shared.Ped.model) do
        Wait(1)
    end
    local repoPed = CreatePed(0, Shared.Ped.model, Shared.Ped.coords.x, Shared.Ped.coords.y, Shared.Ped.coords.z - 1, true)
    FreezeEntityPosition(repoPed, true)
    SetEntityHeading(repoPed, Shared.Ped.coords.w)
    SetEntityInvincible(repoPed, true)
    SetBlockingOfNonTemporaryEvents(repoPed, true)
    TaskStartScenarioInPlace(repoPed, Shared.Ped.modelAnim, 0, true)
	exports['qb-target']:AddTargetEntity(repoPed, {
		options = {
			{
				type = 'client',
				event = "apple:start:sell:PoliceCheck",
				icon = 'fas fa-user-secret',
				label = "Get Repo Contract",
			},
		},
		distance = 2.0,
	})
end)

RegisterNetEvent("ez-repo:openMenu", function()
	
end)