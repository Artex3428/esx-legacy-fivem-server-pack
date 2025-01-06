CreateThread(function()
    while ESX == nil do
        Wait(100) -- Wait for ESX to be initialized
    end

    while ESX.GetPlayerData().job == nil do
        Wait(100) -- Wait for the player's job to be loaded
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function()
    ESX.PlayerData = ESX.GetPlayerData()
end)

IsTrue = false

-- Main loop --
CreateThread(function()
    while true do
        Wait(0)
        if IsTrue then            
            if ESX.PlayerData ~= nil then
                for k,v in pairs(Config.Gangs) do
                    if ESX.PlayerData.job.name == v.Job then
    
                        if ESX.PlayerData.job.grade_name == 'boss' then
                            exports['artex-3dtextui']:StartText3d("Boss", true, {46}, "Press [~g~E~w~] to open boss menu", v.Boss, 3.0, 1.0, false, false, function(pressedKey)
                                if pressedKey == 46 then
                                    TriggerEvent(Config.Triggers.OpenBossMenu, v.Society_Name, function(data, menu)
    
                                    end)
                                end
                            end)
                        end

                        if Config.EnableGangShop then
                            exports['artex-3dtextui']:StartText3d("Stash", true, {46}, "Press [~g~E~w~] to open key storage", v.ItemShopCoords, 3.0, 1.0, false, false, function(pressedKey)
                                if pressedKey == 46 then
                                    OpenShopMenu()
                                end
                            end)
                        end
    
                        if Config.EnableStash then
                            exports['artex-3dtextui']:StartText3d("Stash", true, {46}, "Press [~g~E~w~] to open stash", v.Stash, 3.0, 1.0, false, false, function(pressedKey)
                                if pressedKey == 46 then
                                    local stashId = ESX.PlayerData.job.name .. '_stash'
                                    exports.ox_inventory:openInventory('stash', { id = stashId })
                        
                                end
                            end)
                        end
    
                        if Config.EnableCloakrooms then
                            exports['artex-3dtextui']:StartText3d("Cloakroom", true, {46}, "Press [~g~E~w~] to open cloakroom", v.Cloakrooms, 3.0, 1.0, false, false, function(pressedKey)
                                if pressedKey == 46 then
                                    TriggerEvent('illenium-appearance:client:openOutfitMenu')
                                end
                            end)
                        end
    
                        if Config.EnablePersonalGangInfo then
                            exports['artex-3dtextui']:StartText3d("Info", true, {46}, "Press [~g~E~w~] to view gang info", v.GangInfo, 3.0, 1.0, false, false, function(pressedKey)
                                if pressedKey == 46 then
                                    OpenGangInfo()
                                end
                            end)
                        end
                    end
                end
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(1000) -- Reduced frequency to avoid unnecessary processing

        if ESX.PlayerData ~= nil and ESX.PlayerData.job ~= nil then
            IsTrue = true
            break
        end
    end
end)