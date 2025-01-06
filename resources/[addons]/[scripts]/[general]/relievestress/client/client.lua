local animDict = "rcmcollect_paperleadinout@"
local animName = "meditiate_idle"

Citizen.CreateThread(function ()
	CreateBlip(vector3(-2039.4215087890625, -370.7171325683594, 48.10614013671875))

    while true do
        Citizen.Wait(0)

		exports['artex-3dtextui']:StartText3d("Meditate", true, {46}, "Press [~g~E~w~] to meditate", vector3(-2039.4215087890625, -370.7171325683594, 48.10614013671875), 7.0, 4.0, false, false, function(pressedKey)
			if pressedKey == 46 then
				Meditate()
			end
		end)
    end
end)

Citizen.CreateThread(function ()
	CreateBlip(vector3(2041.866943359375, 3443.5703125, 43.81562042236328))

	while true do
		Citizen.Wait(0)
		exports['artex-3dtextui']:StartText3d("Meditate", true, {46}, "Press [~g~E~w~] to meditate", vector3(2041.866943359375, 3443.5703125, 43.81562042236328), 7.0, 4.0, false, false, function(pressedKey)
			if pressedKey == 46 then
				Meditate()
			end
		end)
	end
end)

function Meditate()
	local ped = PlayerPedId()
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(0)
	end

	TaskPlayAnim(ped, animDict, animName, 8.0, -8.0, -1, 1, 0, false, false, false)
	SetEntityCollision(ped, false, true)
	FreezeEntityPosition(ped, true)
	Citizen.Wait(5000)

	ESX.ShowNotification("Feeling more relaxed.", "success", 3000)
	TriggerServerEvent('hud:server:RelieveStress', 40)

	ClearPedTasks(ped)
	SetEntityCollision(ped, true, true)
	FreezeEntityPosition(ped, false)
end

function CreateBlip(coords)
	local blip = AddBlipForCoord(coords.x, coords.y, coords.z)

    SetBlipSprite(blip, 480)
    SetBlipColour(blip, 2)
    SetBlipScale(blip, 0.7)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Meditation")
    EndTextCommandSetBlipName(blip)
end