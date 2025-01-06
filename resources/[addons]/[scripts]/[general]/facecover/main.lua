local facecover = false

-- Function to open the NUI

--FUNCTIONS--
function DisableThings()
    -- Disable HUD components and controls once
    HideHelpTextThisFrame()
    HideHudAndRadarThisFrame()
    HideHudComponentThisFrame(1) -- Wanted Stars
    HideHudComponentThisFrame(2) -- Weapon icon
    HideHudComponentThisFrame(3) -- Cash
    HideHudComponentThisFrame(4) -- MP CASH
    HideHudComponentThisFrame(6)
    HideHudComponentThisFrame(7)
    HideHudComponentThisFrame(8)
    HideHudComponentThisFrame(9)
    HideHudComponentThisFrame(13) -- Cash Change
    HideHudComponentThisFrame(11) -- Floating Help Text
    HideHudComponentThisFrame(12) -- more floating help text
    HideHudComponentThisFrame(15) -- Subtitle Text
    HideHudComponentThisFrame(18) -- Game Stream
    HideHudComponentThisFrame(19) -- Weapon wheel
    DisableControlAction(0, 288, true) -- Disable phone
    DisableControlAction(0, 289, true) -- Inventory
    DisableControlAction(0, 349, true) -- Inventory
end

function EnableThings()
    -- Re-enable the HUD components and controls
    ShowHudComponentThisFrame(1)  -- Show Wanted Stars
    ShowHudComponentThisFrame(2)  -- Show Weapon Icon
    ShowHudComponentThisFrame(3)  -- Show Cash
    ShowHudComponentThisFrame(4)  -- Show MP Cash
    ShowHudComponentThisFrame(6)
    ShowHudComponentThisFrame(7)
    ShowHudComponentThisFrame(8)
    ShowHudComponentThisFrame(9)
    ShowHudComponentThisFrame(13) -- Cash Change
    ShowHudComponentThisFrame(11) -- Floating Help Text
    ShowHudComponentThisFrame(12) -- More Floating Help Text
    ShowHudComponentThisFrame(15) -- Subtitle Text
    ShowHudComponentThisFrame(18) -- Game Stream
    ShowHudComponentThisFrame(19) -- Weapon Wheel
    EnableControlAction(0, 288, true) -- Enable Phone
    EnableControlAction(0, 289, true) -- Enable Inventory
    EnableControlAction(0, 349, true) -- Enable Inventory
end

RegisterNetEvent('facecover:MaskPlayer')
AddEventHandler("facecover:MaskPlayer", function(source)

	TriggerEvent('ps-hud:disableHudTemporarly', false)
	SendNUIMessage({
		type = 'opennui'
	})
	DisableThings()

	-- Function to close the NUI
	TriggerEvent('ps-hud:enableHudTemporarly', true)
	SendNUIMessage({
		type = 'closenui'
	})

end)

RegisterNetEvent('facecover:Active') --Just added the event to activate the binoculars
AddEventHandler('facecover:Active', function()
	if not facecover then
		facecover = true

		local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
		if closestPlayer ~= -1 and closestDistance <= 2.0 then
			targetId = GetPlayerServerId(closestPlayer)
			TriggerServerEvent('facecover:ApplyMask', targetId)
		else
			ESX.ShowNotification("There isn't anyone nerby", "error", 3000)
		end
	else
		facecover = false
	end
end)



--- Need to fix to check if the player already have a mask on them and then if so and you have used the mask on them you take it off and get back a item.