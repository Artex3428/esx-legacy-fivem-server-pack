-- Open windows
local windowStates = {}

function ToggleWindows(index)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle ~= 0 then
        local vehicleId = VehToNet(vehicle) -- Use a network ID or unique identifier for the vehicle
        windowStates[vehicleId] = windowStates[vehicleId] or {} -- Initialize state for this vehicle if not present

        -- Check the current state of the specified window
        local IsWindowUp = windowStates[vehicleId][index] or false

        if not IsWindowUp then
            -- Roll down the window
            RollDownWindow(vehicle, index)
            windowStates[vehicleId][index] = true -- Update state to "down"
        else
            -- Roll up the window
            RollUpWindow(vehicle, index)
            windowStates[vehicleId][index] = false -- Update state to "up"
        end
    else
        print("Player is not in a vehicle!")
    end
end



local speedLimiterActive = false
local currentSpeedLimit = 0.0
local vehicle = nil
function SetSpeed()
    local playerPed = PlayerPedId()
    vehicle = GetVehiclePedIsIn(playerPed, false)

    if vehicle ~= 0 then
        -- local currentSpeed = GetEntitySpeed(vehicle) * 3.6 -- Convert from meters per second to km/h

        if not speedLimiterActive then
            -- Set the current speed as the limit
            currentSpeedLimit = currentSpeed
            speedLimiterActive = true
            SetEntityMaxSpeed(vehicle, currentSpeedLimit ) --/ 3.6 -- Set the speed limit (convert back to m/s)
            ESX.ShowNotification("Speed limiter activated: " .. math.floor(currentSpeedLimit) .. ' km/h', "success", 3000)
        else
            -- Remove the speed limiter
            speedLimiterActive = false
            SetEntityMaxSpeed(vehicle, GetVehicleMaxSpeed(vehicle)) -- Reset the speed limit to the vehicle's max
            ESX.ShowNotification("Speed Limiter deactivated")
        end
    else
        ESX.ShowNotification("You must be in a vehicle to use the Speed Limiter")
    end
end



-- Neon lights
local alavalot = false

function ToggleneonLights()
	local ped = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(ped, false)
	local driver  = GetPedInVehicleSeat(vehicle, -1)
	local alavalotkiinni = IsVehicleNeonLightEnabled(vehicle, 1)

	if IsPedInVehicle(ped,vehicle, true) and driver == ped then
		if alavalotkiinni then
			if alavalot == false then
				alavalot = true
				DisableVehicleNeonLights(vehicle, true)
				--TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', length = 3000, text = 'Neonlights : OFF' })
				ESX.ShowNotification('Neonlights: OFF')
				Wait(2000)
			elseif alavalot == true then
				alavalot = false
				DisableVehicleNeonLights(vehicle, false)
				--TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', length = 3000, text = 'Neonlights : ON' })
				ESX.ShowNotification('Neonlights: ON')
				Wait(2000)
			end
		else
			--TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', length = 5000, text = 'You need to have installed Neonlights?' })
			ESX.ShowNotification('You need to have installed Neonlights')
			Wait(2000)
		end
	else
		Wait(1000)
	end
end



-- On / off extras
local extrasStates = {}

function ToggleExtras(index)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle ~= 0 then
        local vehicleId = VehToNet(vehicle) -- Use a network ID or unique identifier for the vehicle
        extrasStates[vehicleId] = extrasStates[vehicleId] or {} -- Initialize state for this vehicle if not present

        -- Check the current state of the specified extra (0 for on, 1 for off)
        local IsExtraUp = extrasStates[vehicleId][index] or false

        -- Toggle the extra state
        if not IsExtraUp then
            -- Turn the extra on (0 means enabled)
            SetVehicleExtra(vehicle, index, 0)
            extrasStates[vehicleId][index] = true -- Update state to "on"
        else
            -- Turn the extra off (1 means disabled)
            SetVehicleExtra(vehicle, index, 1)
            extrasStates[vehicleId][index] = false -- Update state to "off"
        end
    else
        print("Player is not in a vehicle!")
    end
end



-- ToggleConvertible
local convertibleStates = {}

function ToggleConvertible()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    
    -- Check if the player is in a vehicle
    if vehicle ~= 0 then
        local vehicleId = VehToNet(vehicle) -- Network ID or unique identifier for the vehicle
        
        -- Initialize state for this vehicle if not present
        if convertibleStates[vehicleId] == nil then
            convertibleStates[vehicleId] = false -- False means the roof is up initially
        end
        
        -- Check the current state of the convertible roof
        local isRoofUp = convertibleStates[vehicleId]

        -- Toggle the roof state
        if isRoofUp then
            -- Lower the roof
            LowerConvertibleRoof(vehicle)
            convertibleStates[vehicleId] = false -- Update state to "up"
        else
            -- Raise the roof
            RaiseConvertibleRoof(vehicle)
            convertibleStates[vehicleId] = true -- Update state to "down"
        end
    else
        print("Player is not in a vehicle!")
    end
end


-- Open doors
local doorStates = {}

function ToggleDoors(index)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle ~= 0 then
        local vehicleId = VehToNet(vehicle) -- Use a network ID or unique identifier for the vehicle
        doorStates[vehicleId] = doorStates[vehicleId] or {} -- Initialize state for this vehicle if not present

        -- Check the current state of the specified window
        local IsDoorOpen = doorStates[vehicleId][index] or false

        if not IsDoorOpen then
            -- Roll down the window
			SetVehicleDoorOpen(vehicle, index, false, false)
            doorStates[vehicleId][index] = true -- Update state to "down"
        else
            -- Roll up the window
            SetVehicleDoorShut(vehicle, index, false)
            doorStates[vehicleId][index] = false -- Update state to "up"
        end
    else
        print("Player is not in a vehicle!")
    end
end


-- Change seat
local seatStates = {}

function ToogleSeat(index)
    local seatIndex = index -- Get the seat index from the command argument
	local ped = PlayerPedId() -- Get the player's ped
    local vehicle = GetVehiclePedIsIn(ped, false) -- Get the vehicle the player is in


    if vehicle ~= 0 then
        local vehicleId = VehToNet(vehicle) -- Use a network ID or unique identifier for the vehicle
        seatStates[vehicleId] = seatStates[vehicleId] or {} -- Initialize state for this vehicle if not present

        if seatIndex and seatIndex >= -1 and seatIndex <= GetVehicleMaxNumberOfPassengers(vehicle) then
            -- Move the player to the specified seat
            TaskWarpPedIntoVehicle(ped, vehicle, seatIndex)
            print("Moved to seat: " .. seatIndex)
        else
            print("Invalid seat index! Use -1 (driver), 0, 1, etc., based on the vehicle.")
        end
    else
        print("Player is not in a vehicle!")
    end
end