Citizen.CreateThread( function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        if vehicle ~= 0 then -- Ensure the player is in a vehicle
            local vehicleClass = GetVehicleClass(vehicle) -- Get the class of the vehicle
            if vehicleClass == 8 then
                SetPedConfigFlag(PlayerPedId(), 35, false)
            else
                Citizen.Wait(1500)
            end
        else
            Citizen.Wait(1500)
        end
    end
end)