Citizen.CreateThread(function()
    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end

    SpawnHospitalNpc()

    while true do
        local wait = 250

        if Hospital.BlockKeys then
            for i = 0, 31 do
                DisableAllControlActions(i)
            end

            wait = 0
        end

        Wait(wait)
    end
end)

Hospital = {
    TimeCaring = 1 * 60000,
    BlockKeys = false
}

Citizen.CreateThread(function()
    while true do
        local Player = PlayerPedId()

        local HealthLost = (GetEntityMaxHealth(Player) - GetEntityHealth(Player)) * 1

        -- ESX.ShowHelpNotification("~INPUT_CONTEXT~ Get healthcare for ~g~$" .. HealthLost .. "~w~")

        exports['artex-3dtextui']:StartText3d("Healthcare", true, {46}, "Press [~g~E~w~] to get healthcare for $", vector3(268.1099548339844, -1357.4644775390625, 24.53780555725097), 3.0, 2.0, false, false, function(pressedKey)
            if pressedKey == 46 then                
                if IsEntityDead(Player) then
                    Funcs:HealthCare(HealthLost)
                else
                    ESX.ShowNotification("Talk to the other guys about your damage.")
                end
            end
        end)
        Citizen.Wait(0)
    end
end)