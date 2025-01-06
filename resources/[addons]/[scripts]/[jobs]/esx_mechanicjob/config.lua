Config                            = {}
Config.Locale = GetConvar('esx:locale', 'en')

Config.Controls = {
	mechanicMenu = "F6",
}

Config.DrawDistance               = 10.0 -- How close you need to be in order for the markers to be drawn (in GTA units).
Config.MaxInService               = -1
Config.EnablePlayerManagement     = true -- Enable society managing.
Config.EnableSocietyOwnedVehicles = false

Config.NPCSpawnDistance           = 500.0
Config.NPCNextToDistance          = 25.0
Config.NPCJobEarnings             = { min = 25, max = 40 }

Config.OxInventory                = ESX.GetConfig().OxInventory

Config.Vehicles = {
	'banshee',
	'buffalo',
	'sultan',
	'baller3'
}

Config.Zones = {

	MechanicActions = {
		Pos   = vector3(-345.2337341308594, -123.0742645263672, 39.00965881347656),
		Size  = { x = 1.0, y = 1.0, z = 1.0 },
		Color = { r = 50, g = 200, b = 50 },
		Type  = 21
	},

	Harvesting = {
		Pos   = vector3(-338.3457641601563, -142.5789031982422, 39.00967025756836),
		Size  = { x = 1.0, y = 1.0, z = 1.0 },
		Color = { r = 50, g = 200, b = 50 },
		Type  = 21
	},

	Craft = {
		Pos   = vector3(-323.140, -129.882, 38.999),
		Size  = { x = 1.0, y = 1.0, z = 1.0 },
		Color = { r = 50, g = 200, b = 50 },
		Type  = 21
	},

	VehicleSpawnPoint = {
		Pos   = vector3(-370.5853576660156, -108.166748046875, 38.6806526184082),
		Size  = { x = 1.0, y = 1.0, z = 1.0 },
		Color = { r = 50, g = 200, b = 50 },
		Type  = -1
	},

	VehicleDeleter = {
		Pos   = vector3(-386.899, -105.675, 38.683 ),
		Size  = { x = 1.0, y = 1.0, z = 1.0 },
		Color = { r = 50, g = 200, b = 50 },
		Type  = 21
	},

	VehicleDelivery = {
		Pos   = vector3(-378.7623596191406, -131.3395538330078, 38.6857795715332),
		Size  = { x = 1.0, y = 1.0, z = 1.0 },
		Color = { r = 50, g = 200, b = 50 },
		Type  = -1
	},

	NPCJobTargetTowable = {
		Pos   = vector3(-370.3898315429688, -112.63079071044922, 38.68012237548828),
		Size  = { x = 1.0, y = 1.0, z = 1.0 },
		Color = { r = 50, g = 200, b = 50 },
		Type  = 21
	}
}

Config.Towables = {
	vector3(-2480.9, -212.0, 17.4),
	vector3(-2723.4, 13.2, 15.1),
	vector3(-3169.6, 976.2, 15.0),
	vector3(-3139.8, 1078.7, 20.2),
	vector3(-1656.9, -246.2, 54.5),
	vector3(-1586.7, -647.6, 29.4),
	vector3(-1036.1, -491.1, 36.2),
	vector3(-1029.2, -475.5, 36.4),
	vector3(75.2, 164.9, 104.7),
	vector3(-534.6, -756.7, 31.6),
	vector3(487.2, -30.8, 88.9),
	vector3(-772.2, -1281.8, 4.6),
	vector3(-663.8, -1207.0, 10.2),
	vector3(719.1, -767.8, 24.9),
	vector3(-971.0, -2410.4, 13.3),
	vector3(-1067.5, -2571.4, 13.2),
	vector3(-619.2, -2207.3, 5.6),
	vector3(1192.1, -1336.9, 35.1),
	vector3(-432.8, -2166.1, 9.9),
	vector3(-451.8, -2269.3, 7.2),
	vector3(939.3, -2197.5, 30.5),
	vector3(-556.1, -1794.7, 22.0),
	vector3(591.7, -2628.2, 5.6),
	vector3(1654.5, -2535.8, 74.5),
	vector3(1642.6, -2413.3, 93.1),
	vector3(1371.3, -2549.5, 47.6),
	vector3(383.8, -1652.9, 37.3),
	vector3(27.2, -1030.9, 29.4),
	vector3(229.3, -365.9, 43.8),
	vector3(-85.8, -51.7, 61.1),
	vector3(-4.6, -670.3, 31.9),
	vector3(-111.9, 92.0, 71.1),
	vector3(-314.3, -698.2, 32.5),
	vector3(-366.9, 115.5, 65.6),
	vector3(-592.1, 138.2, 60.1),
	vector3(-1613.9, 18.8, 61.8),
	vector3(-1709.8, 55.1, 65.7),
	vector3(-521.9, -266.8, 34.9),
	vector3(-451.1, -333.5, 34.0),
	vector3(322.4, -1900.5, 25.8)
}

for k,v in ipairs(Config.Towables) do
	Config.Zones['Towable' .. k] = {
		Pos   = v,
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = -1
	}
end
