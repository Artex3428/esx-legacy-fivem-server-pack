if GetVehicleClass(veh) == 18 then

    local actv_manu = false
    local actv_horn = false

    DisableControlAction(0, 86, true) -- INPUT_VEH_HORN
    DisableControlAction(0, 172, true) -- INPUT_CELLPHONE_UP 
    DisableControlAction(0, 81, true) -- INPUT_VEH_NEXT_RADIO
    DisableControlAction(0, 82, true) -- INPUT_VEH_PREV_RADIO
    DisableControlAction(0, 19, true) -- INPUT_CHARACTER_WHEEL 
    DisableControlAction(0, 85, true) -- INPUT_VEH_RADIO_WHEEL 
    DisableControlAction(0, 80, true) -- INPUT_VEH_CIN_CAM 

    SetVehRadioStation(veh, "OFF")
    SetVehicleRadioEnabled(veh, false)

    if state_lxsiren[veh] ~= 1 and state_lxsiren[veh] ~= 2 and state_lxsiren[veh] ~= 3 then
        state_lxsiren[veh] = 0
    end
    if state_pwrcall[veh] ~= true then
        state_pwrcall[veh] = false
    end
    if state_airmanu[veh] ~= 1 and state_airmanu[veh] ~= 2 and state_airmanu[veh] ~= 3 then
        state_airmanu[veh] = 0
    end

    if useFiretruckSiren(veh) and state_lxsiren[veh] == 1 then
        TogMuteDfltSrnForVeh(veh, false)
        dsrn_mute = false
    else
        TogMuteDfltSrnForVeh(veh, true)
        dsrn_mute = true
    end

    if not IsVehicleSirenOn(veh) and state_lxsiren[veh] > 0 then
        PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
        SetLxSirenStateForVeh(veh, 0)
        count_bcast_timer = delay_bcast_timer
    end
    if not IsVehicleSirenOn(veh) and state_pwrcall[veh] == true then
        PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
        TogPowercallStateForVeh(veh, false)
        count_bcast_timer = delay_bcast_timer
    end

    ----- CONTROLS -----
    if not IsPauseMenuActive() then

        -- TOGGLE DEFAULT SIREN LIGHTS WITH Q
        if IsDisabledControlJustReleased(0, 44) then -- INPUT_VEH_SIREN (Q)
            if IsVehicleSirenOn(veh) then
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                SetVehicleSiren(veh, false)
            else
                PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                SetVehicleSiren(veh, true)
                count_bcast_timer = delay_bcast_timer
            end
        end

        -- CYCLE SOUND MODES WITH E
        if IsDisabledControlJustReleased(0, 38) then -- INPUT_CONTEXT (E)
            local cstate = state_lxsiren[veh]
            if cstate == 0 then
                PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1) -- Sound on
                SetLxSirenStateForVeh(veh, 1)
            elseif cstate == 1 then
                PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1) -- Switch to mode 2
                SetLxSirenStateForVeh(veh, 2)
            elseif cstate == 2 then
                PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1) -- Switch to mode 3
                SetLxSirenStateForVeh(veh, 3)
            else
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1) -- Sound off
                SetLxSirenStateForVeh(veh, 0)
            end
            count_bcast_timer = delay_bcast_timer
        end

        -- HORN
        if IsDisabledControlPressed(0, 86) then
            actv_horn = true
        else
            actv_horn = false
        end
    end
    
    ---- ADJUST HORN / MANU STATE ----
    -- local hmanu_state_new = 0
    -- if actv_horn == true and actv_manu == false then
    -- 	hmanu_state_new = 1
    -- elseif actv_horn == false and actv_manu == true then
    -- 	hmanu_state_new = 2
    -- elseif actv_horn == true and actv_manu == true then
    -- 	hmanu_state_new = 3
    -- end
    -- if hmanu_state_new == 1 then
    -- 	if not useFiretruckSiren(veh) then
    -- 		if state_lxsiren[veh] > 0 and actv_lxsrnmute_temp == false then
    -- 			srntone_temp = state_lxsiren[veh]
    -- 			SetLxSirenStateForVeh(veh, 0)
    -- 			actv_lxsrnmute_temp = true
    -- 		end
    -- 	end
    -- else
    -- 	if not useFiretruckSiren(veh) then
    -- 		if actv_lxsrnmute_temp == true then
    -- 			SetLxSirenStateForVeh(veh, srntone_temp)
    -- 			actv_lxsrnmute_temp = false
    -- 		end
    -- 	end
    -- end
    -- if state_airmanu[veh] ~= hmanu_state_new then
    -- 	SetAirManuStateForVeh(veh, hmanu_state_new)
    -- 	count_bcast_timer = delay_bcast_timer
    -- end	
end