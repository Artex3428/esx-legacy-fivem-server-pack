Config = {}
Config.Locale = GetConvar('esx:locale', 'en')

Config.DrawDistance = 10.0

Config.Markers = {
	EntryPoint = {
		Type = 21,
		Size = {
			x = 1.0,
			y = 1.0,
			z = 0.5,
		},
		Color = {
			r = 50,
			g = 200,
			b = 50,
		},
	},
	SpawnPoint = {
		Type = 21,
		Size = {
			x = 1.0,
			y = 1.0,
			z = 0.5,
		},
		Color = {
			r = 50,
			g = 200,
			b = 50,
		},
	},
	GetOutPoint = {
		Type = 21,
		Size = {
			x = 1.0,
			y = 1.0,
			z = 0.5,
		},
		Color = {
			r = 200,
			g = 51,
			b = 51,
		},
	},
}

Config.Garages = {
	SanAndreasAvenue = {
		EntryPoint = {
			x = 213.9490203857422,
			y = -808.8048095703125,
			z = 31.014892578125,
		},
		SpawnPoint = {
			x = 213.2623291015625,
			y = -796.8442993164062,
			z = 30.8590030670166,
			heading = 341.8970947265625,
		},
		Sprite = 357,
		Scale = 0.8,
		Colour = 3,
		Job = "",
		ShowBlip = true,
		ImpoundedName = "LosSantos",
	},

	SandyMotel = {
		EntryPoint = {
			x = 339.7793579101563,
			y = 2636.077880859375,
			z = 44.49264526367187,
		},
		SpawnPoint = {
			x = 347.8355407714844,
			y = 2632.744384765625,
			z = 44.4971694946289,
			heading = 109.58209228515624,
		},
		Sprite = 357,
		Scale = 0.8,
		Colour = 3,
		Job = "",
		ShowBlip = true,
		ImpoundedName = "SandyShores",
	},

	CityShore = {
		EntryPoint = {
			x = -2030.112548828125,
			y = -465.6338806152344,
			z = 11.60397434234619,
		},
		SpawnPoint = {
			x = -2023.287841796875,
			y = -480.7375183105469,
			z = 11.42966175079345,
			heading = 231.1779022216797,
		},
		Sprite = 357,
		Scale = 0.8,
		Colour = 3,
		Job = "",
		ShowBlip = true,
		ImpoundedName = "LosSantos",
	},

	Airport = {
		EntryPoint = {
			x = -609.8098754882812,
			y = -2238.278564453125,
			z = 6.2520260810852,
		},
		SpawnPoint = {
			x = -616.7489624023438,
			y = -2224.2919921875,
			z = 6.00774192810058,
			heading = 41.72204208374023,
		},
		Sprite = 357,
		Scale = 0.8,
		Colour = 3,
		Job = "",
		ShowBlip = true,
		ImpoundedName = "LosSantos",
	},

	Sandy = {
		EntryPoint = {
			x = 1963.0831298828127,
			y = 3776.17236328125,
			z = 32.20030975341797,
		},
		SpawnPoint = {
			x = 1953.528076171875,
			y = 3770.6689453125,
			z = 32.20663833618164,
			heading = 118.31165313720705,
		},
		Sprite = 357,
		Scale = 0.8,
		Colour = 3,
		Job = "",
		ShowBlip = true,
		ImpoundedName = "SandyShores",
	},

	Paleto = {
		EntryPoint = {
			x = 179.49462890625,
			y = 6571.9208984375,
			z = 31.84456443786621,
		},
		SpawnPoint = {
			x = 174.53741455078125,
			y = 6582.94287109375,
			z = 31.84199905395507,
			heading = 26.67423248291015,
		},
		Sprite = 357,
		Scale = 0.8,
		Colour = 3,
		Job = "",
		ShowBlip = true,
		ImpoundedName = "PaletoBay",
	},

	Military = {
		EntryPoint = {
			x = -2514.915771484375,
			y = 2331.222900390625,
			z = 33.05989074707031,
		},
		SpawnPoint = {
			x = -2527.5341796875,
			y = 2330.778564453125,
			z = 33.05990982055664,
			heading = 94.19330596923828,
		},
		Sprite = 357,
		Scale = 0.8,
		Colour = 3,
		Job = "",
		ShowBlip = true,
		ImpoundedName = "SandyShores",
	},

	RightSide = {
		EntryPoint = {
			x = 2563.280029296875,
			y = 406.60882568359375,
			z = 108.45572662353516,
		},
		SpawnPoint = {
			x = 2567.199951171875,
			y = 395.7830505371094,
			z = 108.4615478515625,
			heading = 178.3683319091797,
		},
		Sprite = 357,
		Scale = 0.8,
		Colour = 3,
		Job = "",
		ShowBlip = true,
		ImpoundedName = "SandyShores",
	},

	Police = {
		EntryPoint = {
			x = 442.0356750488281,
			y = -1015.0701904296876,
			z = 28.651123046875,
		},
		SpawnPoint = {
			x = 437.9744873046875,
			y = -1020.0349731445312,
			z = 28.73990821838379,
			heading = 91.22996520996094,
		},
		Sprite = 357,
		Scale = 0.8,
		Colour = 3,
		Job = "police",
		ShowBlip = true,
		ImpoundedName = "LosSantos",
	},

	Ambulance = {
		EntryPoint = {
			x = 318.1905517578125,
			y = -1476.30908203125,
			z = 29.96646690368652,
		},
		SpawnPoint = {
			x = 332.450927734375,
			y = -1477.3363037109375,
			z = 29.69877243041992,
			heading = 305.6156005859375,
		},
		Sprite = 357,
		Scale = 0.8,
		Colour = 3,
		Job = "ambulance",
		ShowBlip = true,
		ImpoundedName = "LosSantos",
	},

	Cardealer = {
		EntryPoint = {
			x = -19.64128303527832,
			y = -1086.8250732421875,
			z = 26.58085823059082,
		},
		SpawnPoint = {
			x = -15.75838756561279,
			y = -1094.516845703125,
			z = 26.67207336425781,
			heading = 160.60452270507812,
		},
		Sprite = 357,
		Scale = 0.8,
		Colour = 3,
		Job = "cardealer",
		ShowBlip = true,
		ImpoundedName = "LosSantos",
	},

	Taxi = {
		EntryPoint = {
			x = 914.6406860351564,
			y = -175.3518524169922,
			z = 74.33528137207031,
		},
		SpawnPoint = {
			x = 911.0098876953124,
			y = -178.132568359375,
			z = 74.28215789794922,
			heading = 238.86477661132812,
		},
		Sprite = 357,
		Scale = 0.8,
		Colour = 3,
		Job = "taxi",
		ShowBlip = true,
		ImpoundedName = "LosSantos",
	},

	Mechanic = {
		EntryPoint = {
			x = -354.7265930175781,
			y = -128.12716674804688,
			z = 39.43067169189453,
		},
		SpawnPoint = {
			x = -371.2093811035156,
			y = -116.49542236328124,
			z = 38.69550323486328,
			heading = 65.69149780273438,
		},
		Sprite = 357,
		Scale = 0.8,
		Colour = 3,
		Job = "mechanic",
		ShowBlip = true,
		ImpoundedName = "LosSantos",
	},

	Realestateagent = {
		EntryPoint = {
			x = -196.6628570556641,
			y = -571.3014526367188,
			z = 34.76781463623047,
		},
		SpawnPoint = {
			x = -211.0071563720703,
			y = -574.5130615234375,
			z = 34.54534912109375,
			heading = 339.2402648925781,
		},
		Sprite = 357,
		Scale = 0.8,
		Colour = 3,
		Job = "realestateagent",
		ShowBlip = true,
		ImpoundedName = "LosSantos",
	},
	Mafia = {
		EntryPoint = {
			x = -22.29170989990234,
			y = -1442.734619140625,
			z = 30.7266731262207,
		},
		SpawnPoint = {
			x = -25.26350021362304,
			y = -1445.6663818359375,
			z = 30.65309524536132,
			heading = 179.95449829101565,
		},
		Sprite = 357,
		Scale = 0.8,
		Colour = 3,
		Job = "mafia",
		ShowBlip = true,
		ImpoundedName = "LosSantos",
	},
}

Config.Impounds = {
	LosSantos = {
		GetOutPoint = {
			x = 400.7,
			y = -1630.5,
			z = 29.3,
		},
		SpawnPoint = {
			x = 401.9,
			y = -1647.4,
			z = 29.2,
			heading = 323.3,
		},
		Sprite = 524,
		Scale = 0.8,
		Colour = 1,
		Cost = 3000,
	},
	PaletoBay = {
		GetOutPoint = {
			x = -211.4,
			y = 6206.5,
			z = 31.4,
		},
		SpawnPoint = {
			x = -204.6,
			y = 6221.6,
			z = 30.5,
			heading = 227.2,
		},
		Sprite = 524,
		Scale = 0.8,
		Colour = 1,
		Cost = 3000,
	},
	SandyShores = {
		GetOutPoint = {
			x = 1728.2,
			y = 3709.3,
			z = 33.2,
		},
		SpawnPoint = {
			x = 1722.7,
			y = 3713.6,
			z = 33.2,
			heading = 19.9,
		},
		Sprite = 524,
		Scale = 0.8,
		Colour = 1,
		Cost = 3000,
	},
}

exports("getGarages", function()
	return Config.Garages
end)
exports("getImpounds", function()
	return Config.Impounds
end)
