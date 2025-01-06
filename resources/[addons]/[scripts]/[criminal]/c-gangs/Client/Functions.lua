OpenGangInfo = function(source)
    ESX.UI.Menu.CloseAll()

    -- ESX.TriggerServerCallback('c-gangs:getInfo', function(info)
    for k,v in pairs(Config.Gangs) do
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ganginfo_', {
            title = 'Gang Info',
            align = Config.Align,
            elements = {
                {label = 'Your id: ' ..GetPlayerServerId(PlayerId())},
                {label = "Gang job: " ..ESX.PlayerData.job.label.. " - " ..ESX.PlayerData.job.grade_label},
                {label = "Society Money", value = 'society_money'}
            }
        }, function(data, menu)

            if data.current.value == 'society_money' then
                ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
                    ESX.ShowNotification('Your company now has  ' .. money .. ' $')
                end)
            end
        end, function(data, menu)
            menu.close()
        end)
    end
end

OpenShopMenu = function()
    ESX.UI.Menu.CloseAll()

    for k,v in pairs(Config.Gangs) do
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_', {
        title = 'Gang shop',
        align = Config.Align,
        elements = v.ItemShop
    }, function(data, menu)
        menu.close()

        local val = data.current.value
        ESX.ShowNotification("Item was given", "success", 3000)
        TriggerServerEvent('c-gangs:getItem', GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1))), val)
    end, function(data, menu)
        menu.close()
        end)
    end
end

OpenClothesMenu = function()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'clothes', {
        title = 'Skin',
        align = 'right',
        elements = {
            {label = 'Cambiarse de ropa', value  = 'skin'}
        }
    }, function(data, menu)

        if data.current.value == 'skin' then
            menu.close()
            local config = {
                ped = true,
                headBlend = true,
                faceFeatures = true,
                headOverlays = true,
                components = true,
                props = true,
            }

            exports['illenium-appearance']:startPlayerCustomization(function (appearance)
                if (appearance) then
                print('Saved')
                else
                print('Canceled')
                end
            end, config)
        end
    end, function(data, menu)
        menu.close()
    end)
end