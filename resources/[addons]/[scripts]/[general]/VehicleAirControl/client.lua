Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        if DoesEntityExist(veh) and not IsEntityDead(veh) then
            local model = GetEntityModel(veh)
            local roll = GetEntityRoll(veh) -- Gets the roll angle of the vehicle
            
            -- Check if the vehicle is off the ground or upside down
            if not IsThisModelABoat(model) and not IsThisModelAHeli(model) and not IsThisModelAPlane(model) then
                if IsEntityInAir(veh) or roll > 75.0 or roll < -75.0 then
                    DisableControlAction(0, 59) -- leaning left/right
                    DisableControlAction(0, 60) -- leaning up/down
                else
                    Citizen.Wait(1500)
                end
            else
                Citizen.Wait(1500)
            end
        else
            Citizen.Wait(1500)
        end
    end
end)