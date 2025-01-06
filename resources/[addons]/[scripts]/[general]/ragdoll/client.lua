local ragdoll = false
CreateThread(function()
    while true do
        Wait(0)
		if not IsPedInAnyVehicle(PlayerPedId(), false) then
			if IsControlJustPressed(0, 303) then
				if ragdoll then
					ragdoll = false
				else
					ragdoll = true
				end
			end

			if IsPlayerDead(PlayerId()) and ragdoll == true then
				ragdoll = false
			end

			if ragdoll then
				SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
			end
		else
			Wait(500)
		end
    end
end)