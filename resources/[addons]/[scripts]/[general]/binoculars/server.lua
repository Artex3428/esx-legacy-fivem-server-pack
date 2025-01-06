--SERVER EVENT--

ESX.RegisterUsableItem('binocular', function(source) -- Consider the item as usable
	TriggerClientEvent('jumelles:Active', source) --Trigger the event when the player is using the item
end)