Entity = {}

SpawnHospitalNpc = function()
	if not DoesEntityExist(Entity.Npc) then
		RequestModel(Config.Npc.Model)

		while not HasModelLoaded(Config.Npc.Model) do
			Citizen.Wait(0)
		end

		Entity.Npc = CreatePed(5, Config.Npc.Model, Config.Npc.Coords - vector4(0, 0, 0.98, 0), false, false)

		TaskStartScenarioInPlace(Entity.Npc, "WORLD_HUMAN_SEAT_LEDGE_EATING", 0, true)

		FreezeEntityPosition(Entity.Npc, true)
        SetEntityInvincible(Entity.Npc, true)
        SetBlockingOfNonTemporaryEvents(Entity.Npc, true)
        SetPedDefaultComponentVariation(Entity.Npc)

		SetPedComponentVariation(Entity.Npc, 2, Config.Npc.Outfit.Hair1, Config.Npc.Outfit.Hair2, 2)--Hair
		SetPedComponentVariation(Entity.Npc, 8, Config.Npc.Outfit.Tshirt1, Config.Npc.Outfit.Tshirt2, 2)--Tshirt
		SetPedComponentVariation(Entity.Npc, 11, Config.Npc.Outfit.Torso1, Config.Npc.Outfit.Torso2, 2)--torsoparts
		SetPedComponentVariation(Entity.Npc, 4, Config.Npc.Outfit.Pants1, Config.Npc.Outfit.Pants2, 2)--pants
		SetPedComponentVariation(Entity.Npc, 6, Config.Npc.Outfit.Shoes1, Config.Npc.Outfit.Shoes2, 2)--shoes
		SetPedComponentVariation(Entity.Npc, 7, Config.Npc.Outfit.Chain1, Config.Npc.Outfit.Chain2, 2)--chain
		SetPedComponentVariation(Entity.Npc, 3, 88, 0, 2) -- torso 

		SetPedHeadBlendData     (Entity.Npc, 45, 45, 45, 10, 10, 10, 1.0, 1.0, 1.0, true)
		SetPedHeadOverlay       (Entity.Npc, 8,    5,    (3 / 10) + 0.0) -- Lipstick + opacity
		SetPedHeadOverlayColor  (Entity.Npc, 2, 1, 3,     0)             -- Eyebrows Color
		SetPedHeadOverlayColor  (Entity.Npc, 8, 1, 24,     0)             -- Lipstick Color
	end
end

