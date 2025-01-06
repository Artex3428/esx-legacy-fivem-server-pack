CreateThread(function()
    while true do
        Wait(0)
        local isinmode = GetFollowPedCamViewMode() -- Get what view player is in to prevent crosshair in first person


        if not IsPlayerUsingSniper() and not IsPlayerInArmedPlane() then
            HideHudComponentThisFrame(14)
        end

        if IsPedArmed(PlayerPedId(), 4 | 2) and isinmode ~= 4 then
            if (IsPlayerFreeAiming(PlayerId())) then
                SendNUIMessage({display = "crosshairShow"})
            else
                SendNUIMessage({display = "crosshairHide"})
            end
        else
            Citizen.Wait(500)
            SendNUIMessage({display = "crosshairHide"})
        end

        if IsPedArmed(PlayerPedId(), 4 | 2) and IsPlayerFreeAiming(PlayerId()) and IsPedInAnyVehicle(PlayerPedId(), false) and not IsPlayerInArmedPlane() then
            SendNUIMessage({display = "crosshairShow"})
        end
    end
end)

function IsPlayerUsingSniper()
    if IsPlayerFreeAiming(PlayerId()) then
        local player = GetPlayerPed(-1)
        local currentWeapon = GetSelectedPedWeapon(player)

        -- List of sniper weapon hashes
        local sniperWeapons = {
            GetHashKey("WEAPON_MARKSMANRIFLE"),
            GetHashKey("WEAPON_HEAVYSNIPER"),
            GetHashKey("WEAPON_MARKSMANSNIPERMK2"),
            GetHashKey("WEAPON_SNIPERRIFLE"),
            GetHashKey("WEAPON_HEAVYSNIPERMK2")
        }

        -- Check if the player is using a sniper weapon
        local usingSniper = false
        for _, weaponHash in pairs(sniperWeapons) do
            if currentWeapon == weaponHash then
                usingSniper = true
                break
            end
        end

        return usingSniper
    end
end

function IsPlayerInArmedPlane()
    local player = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(player, false)

    local armedPlanes = {
        GetHashKey("lazer"),
        GetHashKey("savage"),
        GetHashKey("hydra"),
        GetHashKey("besra"),
        GetHashKey("rogue"),
        GetHashKey("buzzard"),
        GetHashKey("hunter"),
        GetHashKey("akula"),
        GetHashKey("annihilator"),
        GetHashKey("bombushka"),
        GetHashKey("strikeforce"),
        GetHashKey("pyro"),
        GetHashKey("tula"),
        GetHashKey("molotok"),
        GetHashKey("nokota"),
        GetHashKey("starling"),
        GetHashKey("volatol"),
        GetHashKey("valkyrie2"),
        GetHashKey("valkyrie"),
        GetHashKey("sparrow"),
    }

    -- Check if the player is in a plane with weapons
    local inArmedPlane = false
    for _, planeHash in pairs(armedPlanes) do
        if IsVehicleModel(vehicle, planeHash) then
            inArmedPlane = true
            break
        end
    end

    return inArmedPlane
end