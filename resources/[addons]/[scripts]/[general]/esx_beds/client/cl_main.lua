CreateThread(function()
    while true do
        local Player = PlayerPedId()
        local PlayerCoords = GetEntityCoords(Player)
        local nearbyBedFound = false

        -- Limit the search for beds to a smaller radius to optimize performance
        for _, bedModel in pairs(Config.Beds) do
            local BedObject = GetClosestObjectOfType(PlayerCoords, 2.0, bedModel)

            if DoesEntityExist(BedObject) then
                local BedCoords = GetEntityCoords(BedObject)
                local Distance = #(PlayerCoords - BedCoords)

                if Distance <= 2.0 and IsPedOnFoot(Player) and Utils.CheckState() and not BedActive[BedObject] then
                    nearbyBedFound = true -- Flag to skip excessive looping

                    Funcs.DrawText3D(BedCoords, '[~g~E~s~] - Lay down in bed')

                    if IsControlJustReleased(0, 38) then
                        Utils.HandleBed(BedObject)
                    end
                end
            end
        end

        -- If no bed is nearby, avoid running every frame
        if not nearbyBedFound then
            Wait(1500) -- Longer delay when no bed is nearby
        else
            Wait(0) -- Short delay to keep interaction responsive
        end
    end
end)