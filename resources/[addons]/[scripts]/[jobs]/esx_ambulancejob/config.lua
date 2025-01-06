Config                            = {}

Config.DrawDistance               = 10.0 -- How close do you need to be in order for the markers to be drawn (in GTA units).
Config.Debug                      = ESX.GetConfig().EnableDebug
Config.Marker                     = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}

Config.ReviveReward               = 700  -- Revive reward, set to 0 if you don't want it enabled
Config.SaveDeathStatus              = true -- Save Death Status?
Config.LoadIpl                    = false -- Disable if you're using fivem-ipl or other IPL loaders

Config.Locale = GetConvar('esx:locale', 'en')

Config.DistressBlip = {
	Sprite = 310,
	Color = 48,
	Scale = 2.0
}

Config.zoom = {
	min = 1,
	max = 6,
	step = 0.5
}

Config.EarlyRespawnTimer          = 60000 * 15  -- time til respawn is available
Config.BleedoutTimer              = 60000 * 180 -- time til the player bleeds out

Config.EnablePlayerManagement     = true -- Enable society managing (If you are using esx_society).

Config.RemoveWeaponsAfterRPDeath  = false
Config.RemoveCashAfterRPDeath     = false
Config.RemoveItemsAfterRPDeath    = false


Config.EnableESXService           = true -- Enable esx service?
Config.MaxInService               = -1 -- How many people can be in service at once? Set as -1 to have no limit


-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 5000

Config.OxInventory                = ESX.GetConfig().OxInventory
Config.RespawnPoints = {
	{coords = vector3(341.0, -1397.3, 32.5), heading = 48.5}, -- Central Los Santos
	{coords = vector3(1836.03, 3670.99, 34.28), heading = 296.06} -- Sandy Shores
}

Config.PharmacyItems = {
	{
		title = "Medikit",
		item = "medikit"
	},
	{
		title = "Bandage",
		item = "bandage"
	},
}

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(307.7, -1433.4, 28.9),
			sprite = 61,
			scale  = 0.9,
			color  = 2
		},

		AmbulanceActions = {
			vector3(269.3723449707031, -1360.6478271484375, 23.53778076171875)
		},

		Pharmacies = {
			vector3(230.1, -1366.1, 38.5)
		},

		Vehicles = {
			{
				Spawner = vector3(307.7, -1433.4, 30.0),
				InsideShop = vector4(452.3055, -1360.1731, 43.5538, 319.1165),
				Marker = {type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(297.2, -1429.5, 29.8), heading = 227.6, radius = 4.0},
					{coords = vector3(294.0, -1433.1, 29.8), heading = 227.6, radius = 4.0},
					{coords = vector3(309.4, -1442.5, 29.8), heading = 227.6, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(317.5, -1449.5, 46.5),
				InsideShop = vector4(343.7769, -1423.0913, 76.1742, 322.8178),
				Marker = {type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(313.5, -1465.1, 46.5), heading = 142.7, radius = 10.0},
					{coords = vector3(299.5, -1453.2, 46.5), heading = 142.7, radius = 10.0}
				}
			}
		},

		FastTravelsPrompt = {
			{
				From = vector3(294.53509521484375, -1448.468994140625, 28.96662139892578),
				To = {coords = vector3(275.3432922363281, -1360.9783935546875, 24.53778457641601), heading = 55.45266342163086},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 255, g = 255, b = 255, a = 100, rotate = false},
				Prompt = TranslateCap('fast_travel')
			},
			{
				From = vector3(275.3432922363281, -1360.9783935546875, 23.53778457641601),
				To = {coords = vector3(294.53509521484375, -1448.468994140625, 29.96662139892578), heading = 320.5},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 255, g = 255, b = 255, a = 100, rotate = false},
				Prompt = TranslateCap('fast_travel')
			},

			{
				From = vector3(247.0634918212891, -1372.010009765625, 23.53781509399414),
				To = {coords = vector3(335.0966796875, -1432.13623046875, 46.51209259033203), heading = 140.75454711914065},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 255, g = 255, b = 255, a = 100, rotate = false},
				Prompt = TranslateCap('fast_travel')
			},
			{
				From = vector3(335.0966796875, -1432.13623046875, 45.51209259033203),
				To = {coords = vector3(247.0634918212891, -1372.010009765625, 24.53781509399414), heading = 324.3869934082031},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 255, g = 255, b = 255, a = 100, rotate = false},
				Prompt = TranslateCap('fast_travel')
			},
		}

	}
}

Config.AuthorizedVehicles = {
	car = {
		ambulance = {
			{model = 'ambulance', price = 5000}
		},

		doctor = {
			{model = 'ambulance', price = 4500}
		},

		chief_doctor = {
			{model = 'ambulance', price = 3000}
		},

		boss = {
			{model = 'ambulance', price = 2000}
		}
	},

	helicopter = {
		ambulance = {},

		doctor = {
			{model = 'polmav', price = 150000}
		},

		chief_doctor = {
			{model = 'polmav', price = 150000},
		},

		boss = {
			{model = 'polmav', price = 150000},
		}
	}
}
