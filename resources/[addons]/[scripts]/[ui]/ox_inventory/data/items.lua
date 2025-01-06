return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
		degrade = 60,
		client = {
			image = 'burger_chicken.png',
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			},
			{
				label = 'What do you call a vegan burger?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('A misteak.')
				end
			},
			{
				label = 'What do frogs like to eat with their hamburgers?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('French flies.')
				end
			},
			{
				label = 'Why were the burger and fries running?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('Because they\'re fast food.')
				end
			}
		},
		consume = 0.3
	},

	-- KEYS --
	['key_police'] = {
		label = 'Police key',
		weight = 15,
		stack = false
	},
	['key_ambulance'] = {
		label = 'Ambulance key',
		weight = 15,
		stack = false
	},
	['key_cardealer'] = {
		label = 'Cardealer key',
		weight = 15,
		stack = false
	},
	['key_mechanic'] = {
		label = 'Mechanic key',
		weight = 15,
		stack = false
	},
	['key_realestateagent'] = {
		label = 'Realestateagent key',
		weight = 15,
		stack = false
	},
	['key_mafia'] = {
		label = 'Mafia key',
		weight = 15,
		stack = false
	},
	----------

	['mdt'] = {
		label = 'Police MDT',
		weight = 500,
		stack = false,
		client = {
			export = 'vrs_mdt.showMDT'
		}
	},

	['battery'] = {
		label = 'Battery',
		weight = 1000,
		stack = true
	},
	['muffler'] = {
		label = 'Muffler',
		weight = 250,
		stack = true
	},
	['hood'] = {
		label = 'Hood',
		weight = 1000,
		stack = true
	},
	['trunk'] = {
		label = 'Trunk',
		weight = 500,
		stack = true
	},
	['doors'] = {
		label = 'Doors',
		weight = 1000,
		stack = true
	},
	['engine'] = {
		label = 'Engine',
		weight = 2500,
		stack = true
	},
	['waterpump'] = {
		label = 'Waterpump',
		weight = 250,
		stack = true
	},
	['oilpump'] = {
		label = 'Oilpump',
		weight = 300,
		stack = true
	},
	['speakers'] = {
		label = 'Speakers',
		weight = 150,
		stack = true
	},
	['rims'] = {
		label = 'Rims',
		weight = 400,
		stack = true
	},
	['subwoofer'] = {
		label = 'Subwoofer',
		weight = 150,
		stack = true
	},
	['steeringwheel'] = {
		label = 'Steering wheel',
		weight = 50,
		stack = true
	},

	['binocular'] = {
		label = 'Binocular',
		weight = 1000,
		stack = false
	},

	['zipties'] = {
		label = 'Zipties',
		weight = 500,
		stack = false
	},

	['scissors'] = {
		label = 'Scissors',
		weight = 400,
		stack = false
	},

	['facecover'] = {
		label = 'Facecover',
		weight = 1000,
		stack = false
	},

	['box'] = {
		label = 'Box',
		weight = 50,
		stack = false
	},

	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['sprunk'] = {
		label = 'Sprunk',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with a sprunk'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
		client = {
			image = 'card_id.png'
		}
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
	},

	['phone'] = {
		label = 'Phone',
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 then
					pcall(function() return exports.npwd:setPhoneDisabled(false) end)
				end
			end,

			remove = function(total)
				if total < 1 then
					pcall(function() return exports.npwd:setPhoneDisabled(true) end)
				end
			end
		}
	},

	['money'] = {
		label = 'Money',
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Water',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	['bread'] = {
		label = 'Bread',
		weight = 200,
		client = {
			status = { hunger = 200000 },
			anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
			prop = { model = `prop_cs_burger_01`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You eat some refreshing bread'
		}
	},

	['radio'] = {
		label = 'Radio',
		weight = 1000,
		allowArmed = true,
		consume = 0,
		client = {
			event = 'mm_radio:client:use'
		}
	},

	['jammer'] = {
		label = 'Radio Jammer',
		weight = 10000,
		allowArmed = true,
		client = {
			event = 'mm_radio:client:usejammer'
		}
	},

	['radiocell'] = {
		label = 'AAA Cells',
		weight = 1000,
		stack = true,
		allowArmed = true,
		client = {
			event = 'mm_radio:client:recharge'
		}
	},

	['armour'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Clothing',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Fleeca Card',
		stack = false,
		weight = 10,
		client = {
			image = 'card_bank.png'
		}
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
	},

	-- Mechanic job
	['gazbottle'] = {
		label = 'Gas Bottle',
		weight = 50,
	},

	['fixtool'] = {
		label = 'Repair Tools',
		weight = 35,
	},

	['carotool'] = {
		label = 'Tools',
		weight = 45,
	},

	['blowpipe'] = {
		label = 'Blowtorch',
		weight = 65,
	},

	['fixkit'] = {
		label = 'Repair Kit',
		weight = 55,
	},

	['carokit'] = {
		label = 'Body Kit',
		weight = 60,
	},

	-- Ambulancejob
	['medikit'] = {
		label = 'Medikit',
		weight = 15,
	},

	-- esx_jobs
	['alive_chicken'] = {
		label = 'Living chicken',
		weight = 30,
	},

	['slaughtered_chicken'] = {
		label = 'Slaughtered chicken',
		weight = 20,
	},

	['packaged_chicken'] = {
		label = 'Chicken fillet',
		weight = 15,
	},

	['fish'] = {
		label = 'Fish',
		weight = 15,
	},

	['stone'] = {
		label = 'Stone',
		weight = 35,
	},

	['washed_stone'] = {
		label = 'Washed stone',
		weight = 30,
	},

	['copper'] = {
		label = 'Copper',
		weight = 40,
	},

	['iron'] = {
		label = 'Iron',
		weight = 35,
	},

	['gold'] = {
		label = 'Gold',
		weight = 50,
	},

	['diamond'] = {
		label = 'Diamond',
		weight = 45,
	},

	['wood'] = {
		label = 'Wood',
		weight = 25,
	},

	['cutted_wood'] = {
		label = 'Cut wood',
		weight = 20,
	},

	['packaged_plank'] = {
		label = 'Packaged wood',
		weight = 15,
	},

	['petrol'] = {
		label = 'Oil',
		weight = 25,
	},

	['petrol_raffin'] = {
		label = 'Processed oil',
		weight = 20,
	},

	['essence'] = {
		label = 'Gas',
		weight = 10,
	},

	['wool'] = {
		label = 'Wool',
		weight = 15,
	},

	['fabric'] = {
		label = 'Fabric',
		weight = 5,
	},

	['clothe'] = {
		label = 'Cloth',
		weight = 10,
	},

	['thermite'] = {
		label = 'Thermite',
		weight = 40,
	},

	['drill'] = {
		label = 'Drill',
		weight = 50,
	},

	['hackerDevice'] = {
		label = 'Hacker Device',
		weight = 30,
	},

	['hammerwirecutter'] = {
		label = 'Hammer And Wire Cutter',
		weight = 25,
	},

	['accesscard'] = {
		label = 'Access Card',
		weight = 15,
	},

	['goldbar'] = {
		label = 'Gold Bar',
		weight = 55,
	},

	['goldwatch'] = {
		label = 'Gold Watch',
		weight = 35,
	},

	['beer'] = {
		label = 'Beer',
		weight = 25,
	},

	['membership'] = {
		label = 'Membership',
		weight = 15,
	},



	["watering_can"] = {
		label = "Watering can",
		weight = 500,
		stack = false,
		close = false,
		description = "Simple watering can",
		client = {
			image = "watering_can.png",
		}
	},
 
	["fertilizer"] = {
		label = "Fertilizer",
		weight = 500,
		stack = false,
		close = false,
		description = "Fertilizer",
		client = {
			image = "fertilizer.png",
		}
	},
	
	["advanced_fertilizer"] = {
		label = "Advanced fertilizer",
		weight = 500,
		stack = false,
		close = false,
		description = "Fertilizer with the litte extra",
		client = {
			image = "advanced_fertilizer.png",
		}
	},
	
	["liquid_fertilizer"] = {
		label = "Liquid Fertilizer",
		weight = 200,
		stack = false,
		close = false,
		description = "Basicly Water with nutrations",
		client = {
			image = "liquid_fertilizer.png",
		}
	},
	
	["weed_lemonhaze_seed"] = {
		label = "Weed Lemonhaze Seed",
		weight = 20,
		stack = true,
		close = true,
		description = "Weed Lemonhaze Seed",
		client = {
			image = "weed_lemonhaze_seed.png",
		}
	},
	
	["weed_lemonhaze"] = {
		label = "Weed Lemonhaze",
		weight = 20,
		stack = true,
		close = false,
		description = "Weed Lemonhaze",
		client = {
			image = "weed_lemonhaze.png",
		}
	},
	
	["coca_seed"] = {
		label = "Coca Seed",
		weight = 20,
		stack = true,
		close = true,
		description = "Coca Seed",
		client = {
			image = "coca_seed.png",
		}
	},
	
	["coca"] = {
		label = "Coca",
		weight = 20,
		stack = true,
		close = false,
		description = "Coca",
		client = {
			image = "coca.png",
		}
	},
	
	["paper"] = {
		label = "Paper",
		weight = 50,
		stack = true,
		close = false,
		description = "Paper",
		client = {
			image = "paper.png",
		}
	},
	
	["nitrous"] = {
		label = "Nitrous",
		weight = 500,
		stack = false,
		close = false,
		description = "Nitrous",
		client = {
			image = "nitrous.png",
		}
	},
	
	["cocaine"] = {
		label = "Cocaine",
		weight = 20,
		stack = true,
		close = true,
		description = "Small bag of cocaine",
		server = {
			export = "it-drugs.cocaine"
		},
		client = {
			image = "cocaine.png",
		}
	},
	
	["joint"] = {
		label = "Joint",
		weight = 10,
		stack = true,
		close = true,
		description = "Joint",
		server = {
			export = "it-drugs.joint"
		},
		client = {
			image = "joint.png",
		}
	},
	
	["weed_processing_table"] = {
		label = "Weed Processing Table",
		weight = 1000,
		stack = false,
		close = true,
		description = "Process some weed",
		client = {
			image = "weed_processing_table.png",
		}
	},
	
	["cocaine_processing_table"] = {
		label = "Cocaine Processing Table",
		weight = 1000,
		stack = false,
		close = true,
		description = "Process some cocaine",
		client = {
			image = "cocaine_processing_table.png",
		}
	}
}
