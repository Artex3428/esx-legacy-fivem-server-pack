Citizen.CreateThread(function()
    local lastVehicle = nil
    local engineStatus = false

    while true do
        Citizen.Wait(0) -- Keep script running every frame for responsiveness
        local ped = GetPlayerPed(-1)

        if not IsEntityDead(ped) then
            local vehicle = GetVehiclePedIsIn(ped, false)

            -- If the player's vehicle changes, update necessary values
            if vehicle ~= lastVehicle then
                lastVehicle = vehicle
                engineStatus = GetIsVehicleEngineRunning(vehicle)
            end

            -- Check if the player is getting into a vehicle
            if IsPedGettingIntoAVehicle(ped) then
                if not engineStatus then
                    SetVehicleEngineOn(vehicle, false, true, true) -- Ensure engine is off
                    DisableControlAction(2, 71, true) -- Disable auto-start of the engine
                end
            end

            -- If in a vehicle and engine is off, disable auto-start control
            if IsPedInAnyVehicle(ped, false) then
                if not GetIsVehicleEngineRunning(vehicle) then
                    DisableControlAction(2, 71, true) -- Disable auto-start of the engine
                end

                -- If the player presses the control to leave, restart the engine and exit vehicle
                if IsControlPressed(2, 75) then
                    if GetIsVehicleEngineRunning(vehicle) then
                        Citizen.Wait(100) -- Give time for engine to stop
                        SetVehicleEngineOn(vehicle, true, true, false) -- Restart the engine
                    end
                    TaskLeaveVehicle(ped, vehicle, 0) -- Make the player leave the vehicle
                end
            else
                Citizen.Wait(500)
            end

            -- Update engine status only when the engine state changes
            if engineStatus ~= GetIsVehicleEngineRunning(vehicle) then
                engineStatus = GetIsVehicleEngineRunning(vehicle)
            end
        end
    end
end)