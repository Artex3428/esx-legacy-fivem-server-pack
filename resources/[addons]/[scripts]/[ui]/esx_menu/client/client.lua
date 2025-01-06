function OpenGeneralActionsMenu()
    local elements = {
        {unselectable = true, icon = "fas fa-cog", title = TranslateCap('menu_title')},
        {icon = "fas fa-user", title = TranslateCap('citizen_interaction'), value = 'citizen_interaction'},
        {icon = "fas fa-car", title = TranslateCap('vehicle_interaction'), value = 'vehicle_interaction'},
        {icon = "fas fa-female", title = TranslateCap('animation_menu'), value = 'animation_menu'}
    }

    ESX.OpenContext("right", elements, function(menu, element)
        local action = element.value

        if action == 'citizen_interaction' then
            OpenCitizenInteractionMenu(element.title)
        elseif action == 'vehicle_interaction' then
            OpenVehicleInteractionMenu(element.title)
        elseif action == "animation_menu" then
            TriggerEvent("OpenAnimationMenu")
        end
    end)
end

function OpenCitizenInteractionMenu(title)
    local elements = {
        {unselectable = true, icon = "fas fa-user", title = title},
        {icon = "fas fa-spinner", title = TranslateCap('search'), value = 'search'},
        {icon = "fas fa-file", title = TranslateCap('billing'), value = 'billing'},
    }

    ESX.OpenContext("right", elements, function(menu, element)
        local action = element.value
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

        if action == 'search' then
            if closestPlayer ~= -1 and closestDistance <= 3.0 then
                ESX.CloseContext()
                exports.ox_inventory:openInventory('player', GetPlayerServerId(closestPlayer))
            else
                ESX.ShowNotification("Nobody close", "error", 3000)
            end
        elseif action == 'billing' then
            TriggerEvent("OpenBills")
        end
    end)
end

function OpenVehicleInteractionMenu(title)
    local elements = {
        {unselectable = true, icon = "fas fa-car", title = title},
        {icon = "fas fa-users", title = TranslateCap('seat'), value = 'seats'},
        {icon = "fas fa-eject", title = TranslateCap('belt'), value = 'belt'},
        {icon = "fas fa-cogs", title = TranslateCap('engine'), value = 'engine'},
        {icon = "fas fa-key", title = TranslateCap('lock_vehicle'), value = 'lock'},
        {icon = "fas fa-bus", title = TranslateCap('doors'), value = 'doors'},
        {icon = "fas fa-window-restore", title = TranslateCap('windows'), value = 'windows'},
        {icon = "fas fa-tachometer", title = TranslateCap('speed_limit'), value = 'speedlimit'},
        {icon = "fas fa-bolt", title = TranslateCap('neonlights'), value = 'neonlights'},
        {icon = "fas fa-cog", title = TranslateCap('convertible'), value = 'convertible'},
        {icon = "fas fa-adjust", title = TranslateCap('extras'), value = 'extras'},
    }

    ESX.OpenContext("right", elements, function(menu, element)
        local action = element.value

        if action == 'belt' then
            TriggerEvent("ToggleSeatbelt")
        elseif action == 'engine' then
            TriggerEvent("ToggleTheEngine")
        elseif action == 'lock' then
            TriggerEvent("ToggleVehicleLock")
        elseif action == 'neonlights' then
            ToggleneonLights()
        elseif action == 'convertible' then
            ToggleConvertible()
        elseif action == 'speedlimit' then
            SetSpeed()
        elseif action == 'extras' then
            OpenExtrasMenu(title)
        elseif action == 'windows' then
            OpenWindowsMenu(title)
        elseif action == 'doors' then
            OpenDoorsMenu(title)
        elseif action == 'seats' then
            OpenSeatsMenu(title)
        end
    end)
end

function OpenExtrasMenu(title)
    local elements = {
		{unselectable = true, icon = "fas fa-window-maximize", title = TranslateCap('extras')},
	}
    for i = 1, 9 do
        table.insert(elements, {icon = "fas fa-window-maximize", title = TranslateCap('extra_' .. i), value = 'extra_' .. i})
    end

    ESX.OpenContext("right", elements, function(menu, element)
        local extraIndex = tonumber(element.value:match('%d+'))
        if extraIndex then
            ToggleExtras(extraIndex)
        end
    end)
end

function OpenWindowsMenu(title)
    local elements = {
		{unselectable = true, icon = "fas fa-window-restore", title = TranslateCap('windows')},
	}
    for i = 1, 4 do
        table.insert(elements, {icon = "fas fa-window-maximize", title = TranslateCap('window_' .. i), value = 'window_' .. i})
    end

    ESX.OpenContext("right", elements, function(menu, element)
        local windowIndex = tonumber(element.value:match('%d+')) - 1
        if windowIndex then
            ToggleWindows(windowIndex)
        end
    end)
end

function OpenDoorsMenu(title)
    local elements = {
		{unselectable = true, icon = "fas fa-bus", title = TranslateCap('doors')},
	}
    for i = 1, 6 do
        table.insert(elements, {icon = "fas fa-unlock", title = TranslateCap('door_' .. i), value = 'door_' .. i})
    end

    ESX.OpenContext("right", elements, function(menu, element)
        local doorIndex = tonumber(element.value:match('%d+')) - 1
        if doorIndex then
            ToggleDoors(doorIndex)
        end
    end)
end

function OpenSeatsMenu(title)
    local elements = {
		{unselectable = true, icon = "fas fa-users", title = TranslateCap('seat')},
	}
    for i = 1, 5 do
        table.insert(elements, {icon = "fas fa-user", title = TranslateCap('seat_' .. i), value = 'seat_' .. i})
    end

    ESX.OpenContext("right", elements, function(menu, element)
        local seatIndex = tonumber(element.value:match('%d+')) - 2
        if seatIndex then
            ToogleSeat(seatIndex)
        end
    end)
end

-- Open the menu
local isMenuActive = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlPressed(0, 20) and not isMenuActive then
            isMenuActive = true
            OpenGeneralActionsMenu()
        elseif IsControlJustReleased(0, 20) and isMenuActive then
            isMenuActive = false
			exports['esx_context']:Close()
        end
    end
end)