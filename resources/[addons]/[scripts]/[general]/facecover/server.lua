--SERVER EVENT--

ESX.RegisterUsableItem('facecover', function(source) -- Consider the item as usable
	xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('facecover:Active', source) --Trigger the event when the player is using the item
end)

RegisterServerEvent('facecover:ApplyMask')
AddEventHandler('facecover:ApplyMask', function(targetId)
	xPlayer.removeInventoryItem('facecover', 1)
	TriggerClientEvent('facecover:MaskPlayer', targetId)
end)