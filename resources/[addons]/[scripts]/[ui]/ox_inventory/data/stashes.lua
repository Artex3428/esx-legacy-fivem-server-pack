return {
	{
		coords = vec3(449.8640441894531, -992.8806762695312, 29.68958282470703),
		target = {
			loc = vec3(449.8640441894531, -992.8806762695312, 29.68958282470703),
			length = 1.2,
			width = 5.6,
			heading = 0,
			minZ = 29.49,
			maxZ = 32.09,
			label = 'Open personal locker'
		},
		name = 'policelocker',
		label = 'Personal locker',
		owner = true,
		slots = 70,
		weight = 70000,
		groups = shared.police
	},

	{
		coords = vec3(269.72015380859375, -1364.119140625, 23.53779411315918),
		target = {
			loc = vec3(269.72015380859375, -1364.119140625, 23.53779411315918),
			length = 0.6,
			width = 1.8,
			heading = 340,
			minZ = 43.34,
			maxZ = 44.74,
			label = 'Open personal locker'
		},
		name = 'emslocker',
		label = 'Personal Locker',
		owner = true,
		slots = 70,
		weight = 70000,
		groups = {['ambulance'] = 0}
	},
}
