local crouched = false

Citizen.CreateThread( function()
    while true do
        Citizen.Wait( 1 )

        if not IsPedInAnyVehicle(PlayerPedId(), false) and not IsPlayerFreeAiming(PlayerId()) then
            local ped = GetPlayerPed( -1 )

            if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
                DisableControlAction( 0, 36, true )

                if ( not IsPauseMenuActive() ) then
                    if ( IsDisabledControlJustPressed( 0, 36 ) ) then
                        RequestAnimSet( "move_ped_crouched" )

                        while ( not HasAnimSetLoaded( "move_ped_crouched" ) ) do
                            Citizen.Wait( 100 )
                        end

                        if ( crouched == true ) then 
                            ResetPedMovementClipset( ped, 0 )
                            crouched = false 
                        elseif ( crouched == false ) then
                            SetPedMovementClipset( ped, "move_ped_crouched", 0.25 )
                            crouched = true
                        end
                    end
                end
            end
        else
            Citizen.Wait(500)
        end
    end
end )