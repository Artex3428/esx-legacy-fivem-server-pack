function StartAttitude(lib, anim)
	ESX.Streaming.RequestAnimSet(lib, function()
		SetPedMovementClipset(ESX.PlayerData.ped, anim, 1)
	end)
end

function StartAnim(lib, anim)
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(ESX.PlayerData.ped, lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
		RemoveAnimDict(lib)
	end)
end

function StartScenario(anim)
	TaskStartScenarioInPlace(ESX.PlayerData.ped, anim, 0, false)
end

function OpenAnimationsSubMenu(menu)
	local elements = {}

	for i = 1, #Config.Animations, 1 do
		elements = {
			{ unselectable = true, icon = "fas fa-female", title = Config.Animations[i].label }
		}

		if Config.Animations[i].name == menu then
			for j = 1, #Config.Animations[i].items, 1 do
				elements[#elements + 1] = {
					icon = "fas fa-smile",
					title = Config.Animations[i].items[j].label,
					type = Config.Animations[i].items[j].type,
					value = Config.Animations[i].items[j].data
				}
			end
			break
		end
	end

	ESX.OpenContext("right", elements, function(_, element)
		local type = element.type
		local lib  = element.value.lib
		local anim = element.value.anim

		if type == 'scenario' then
			StartScenario(anim)
		elseif type == 'attitude' then
			StartAttitude(lib, anim)
		elseif type == 'anim' then
			StartAnim(lib, anim)
		end
	end)
end

function OpenAnimationsMenu()
	local elements = {
		{ unselectable = true, icon = "fas fa-female", title = "Animations" }
	}

	for i = 1, #Config.Animations, 1 do
		elements[#elements + 1] = {
			icon = "fas fa-smile",
			title = Config.Animations[i].label,
			value = Config.Animations[i].name
		}
	end

	ESX.OpenContext("right", elements, function(_, element)
		OpenAnimationsSubMenu(element.value)
	end)
end

RegisterNetEvent("OpenAnimationMenu", OpenAnimationsMenu)

RegisterCommand('cleartasks', function()
	if not ESX.PlayerData.dead then
		ClearPedTasks(ESX.PlayerData.ped)
	end
end, false)

-- Expose animations to other resources
exports('GetConfig', function()
    return Config
end)

exports('SetConfig', function(newConfig)
    Config = newConfig
end)
