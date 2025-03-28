Citizen.CreateThread(function()
    ESX.PlayerData = ESX.GetPlayerData()
    SpawnNPC()
end)

Citizen.CreateThread(function()
    while true do 
        local _apx = 850
        local _ped = PlayerPedId()
        local _pedpos = GetEntityCoords(_ped)
        if GetDistanceBetweenCoords(_pedpos, Config.Coords.x, Config.Coords.y, Config.Coords.z, true) < 3 then
            _apx = 0
            showFloatingHelpNotification(Config.Text, vector3(Config.Coords.x, Config.Coords.y, Config.Coords.z + 1.8))
            if IsControlJustPressed(1, 38) then
                ESX.TriggerServerCallback('apx_starterpack:server:checkIfUsed', function(hasChecked)
                    if hasChecked then
                        ESX.ShowNotification('You have already received your pack')
                    else
                        Menu()
                    end
                end)
            end
        end
        Citizen.Wait(_apx)
    end
end)

function showFloatingHelpNotification(message, coords)
    AddTextEntry('float', message)
    SetFloatingHelpTextWorldPosition(1, coords)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    BeginTextCommandDisplayHelp('float')
    EndTextCommandDisplayHelp(2, false, false, -1)
end
