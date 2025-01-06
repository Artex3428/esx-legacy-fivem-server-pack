local InService    = {}
local MaxInService = {}

function GetInServiceCount(name)
	local count = 0

	for k,v in pairs(InService[name]) do
		if v == true then
			count = count + 1
		end
	end

	return count
end

RegisterServerEvent('esx_service:activateService')
AddEventHandler('esx_service:activateService', function(name, max)
	InService[name] = {}
	MaxInService[name] = max
	GlobalState[name] = GetInServiceCount(name)
end)

RegisterServerEvent('esx_service:disableService')
AddEventHandler('esx_service:disableService', function(name)
    if InService[name] and InService[name][source] then
        InService[name][source] = nil -- Remove the player from service
        GlobalState[name] = GetInServiceCount(name) -- Update global state
    else
        print(("[esx_service] Attempted to disable service for '%s', but player or service was not found."):format(name))
    end
end)

-- Notify All In Service
RegisterServerEvent('esx_service:notifyAllInService')
AddEventHandler('esx_service:notifyAllInService', function(notification, name)
    if InService[name] then
        for k, v in pairs(InService[name]) do
            if v == true then
                TriggerClientEvent('esx_service:notifyAllInService', k, notification, source)
            end
        end
    else
        print(("[esx_service] No players found in service for '%s'."):format(name))
    end
end)

ESX.RegisterServerCallback('esx_service:enableService', function(source, cb, name)
	local inServiceCount = GetInServiceCount(name)
	
	if inServiceCount >= MaxInService[name] then
		cb(false, MaxInService[name], inServiceCount)
	else
		InService[name][source] = true
		GlobalState[name] = GetInServiceCount(name)
		cb(true, MaxInService[name], inServiceCount)		
	end
end)

ESX.RegisterServerCallback('esx_service:isInService', function(source, cb, name)
	local isInService = false

	if InService[name] ~= nil then
		if InService[name][source] then
			isInService = true
		end
	else
		print(('[^3WARNING^7] Attempted To Use Inactive Service - ^5%s^7'):format(name))
	end

	cb(isInService)
end)

ESX.RegisterServerCallback('esx_service:isPlayerInService', function(source, cb, name, target)
	local isPlayerInService = false
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if InService[name][targetXPlayer.source] then
		isPlayerInService = true
	end

	cb(isPlayerInService)
end)

ESX.RegisterServerCallback('esx_service:getInServiceList', function(source, cb, name)
	cb(InService[name])
end)

AddEventHandler('esx:playerDropped', function(playerId, reason)
	for k,v in pairs(InService) do
		if v[playerId] == true then
			v[playerId] = nil
			GlobalState[k] = GetInServiceCount(k)
		end
	end
end)
