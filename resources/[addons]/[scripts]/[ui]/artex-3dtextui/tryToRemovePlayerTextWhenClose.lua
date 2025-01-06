DrawnTexts = {}

function IsTextAlreadyAdded(text, coords)
    for _, v in ipairs(DrawnTexts) do
        if v.text == text and #(v.coords - coords) < 0.01 then
            return true
        end
    end
    return false
end

function DrawText3d(text, targetCoords)
    local camCoords = GetFinalRenderedCamCoord()
    local playerPed = PlayerPedId()
    local rayHandle = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, targetCoords.x, targetCoords.y, targetCoords.z, 1, playerPed, 0)
    local _, hit, hitCoords, hitEntity, _ = GetShapeTestResult(rayHandle)

    if hit == 1 then
        return 'Obstructed by a wall or object'
    end

    local onScreen, _x, _y = World3dToScreen2d(targetCoords.x, targetCoords.y, targetCoords.z)

    if onScreen then
        SetTextScale(0.38, 0.38)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(Config.TxtColor.r, Config.TxtColor.g, Config.TxtColor.b, Config.TxtColor.a)
        SetTextEntry("STRING")
        SetTextCentre(1)

        AddTextComponentString(text)
        DrawText(_x, _y)

        local factor = string.len(text) / 370
        DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, Config.BgColor.r, Config.BgColor.g, Config.BgColor.b, Config.BgColor.a)
    end

    return onScreen
end

IsClose = false

function StartText3d(text, advancedText, keyInput, actionText, coords, isGlobalDistance, isCloseDistance, isOnlyOnControlHold, isNotAdvacedText, isMoving, callback)
    IsCloseToPoint = false
    local playerPos = GetEntityCoords(PlayerPedId())
    local distance = #(playerPos - coords)

    if not isNotAdvacedText then
        if distance < isCloseDistance then
            IsCloseToPoint = true
            if isMoving then
                if not IsClose then
                    DrawText3d(actionText, coords)
                end
            else
                DrawText3d(actionText, coords)
            end

            if not IsTextAlreadyAdded(actionText, coords) then
                if isMoving then
                    table.insert(DrawnTexts, {text = actionText, coords = coords, distance = isGlobalDistance, isEntityCoords = true})
                else
                    table.insert(DrawnTexts, {text = actionText, coords = coords, distance = isGlobalDistance, isEntityCoords = false})
                end
            end
            for _, key in ipairs(keyInput) do
                if IsControlJustPressed(0, key) then
                    callback(key)
                end
            end
        end
    end
    if isOnlyOnControlHold then
        if IsControlPressed(0, Config.HoldControl) then
            if distance < isGlobalDistance then
                if not advancedText then
                else
                    if distance < isGlobalDistance and not IsCloseToPoint then
                        if isMoving then
                            if not IsClose then
                                DrawText3d(text, coords)
                            end
                        else
                            DrawText3d(text, coords)
                        end

                        if not IsTextAlreadyAdded(text, coords) then
                            if isMoving then
                                table.insert(DrawnTexts, {text = text, coords = coords, distance = isGlobalDistance, isEntityCoords = true})
                            else
                                table.insert(DrawnTexts, {text = text, coords = coords, distance = isGlobalDistance, isEntityCoords = false})
                            end
                        end
                    end
                end
            end
            if isMoving then
                if not IsClose then
                    DrawText3d(text, playerPos)
                end
            else
                DrawText3d(text, playerPos)
            end

            if not IsTextAlreadyAdded(text, playerPos) then
                if isMoving then
                    table.insert(DrawnTexts, {text = text, coords = playerPos, distance = isGlobalDistance, isEntityCoords = true})
                else
                    table.insert(DrawnTexts, {text = text, coords = playerPos, distance = isGlobalDistance, isEntityCoords = false})
                end
            end
        end
    else
        if not advancedText then
        else
            if distance < isGlobalDistance and not IsCloseToPoint then
                if isMoving then
                    if not IsClose then
                        DrawText3d(text, coords)
                    end
                else
                    DrawText3d(text, coords)
                end

                if not IsTextAlreadyAdded(text, coords) then
                    if isMoving then
                        table.insert(DrawnTexts, {text = text, coords = coords, distance = isGlobalDistance, isEntityCoords = true})
                    else
                        table.insert(DrawnTexts, {text = text, coords = coords, distance = isGlobalDistance, isEntityCoords = false})
                    end
                end
            end
        end
        if isMoving then
            if not IsClose then
                DrawText3d(text, playerPos)
            end
        else
            DrawText3d(text, playerPos)
        end

        if not IsTextAlreadyAdded(text, playerPos) then
            if isMoving then
                table.insert(DrawnTexts, {text = text, coords = playerPos, distance = isGlobalDistance, isEntityCoords = true})
            else
                table.insert(DrawnTexts, {text = text, coords = playerPos, distance = isGlobalDistance, isEntityCoords = false})
            end
        end
    end

    local allOfRange = true

    for i = #DrawnTexts, 1, -1 do
        local v = DrawnTexts[i]
        local distance2 = #(playerPos - v.coords)

        if distance2 > v.distance then
            table.remove(DrawnTexts, i)
        else
            if distance2 < v.distance then
                allOfRange = false
            end
            if isMoving then
                if playerPos ~= v and not v.isEntityCoords then
                    if distance2 < v.distance then
                        -- Issue is that the text not gets drawn again when you exit the radius of other drawn texts
                        IsClose = true
                    end
                end
            end
        end
    end

    if allOfRange then
        Wait(500)
    end
end

CreateThread(function ()
    while true do
        Wait(0)
        StartText3d("Hello World!", true, {46, 47}, "[~g~E~w~] for copy [~r~G~w~] for paste", GetEntityCoords(PlayerPedId()), 3.0, 1.0, false, false, false, function(pressedKey)
            if pressedKey == 46 then
                print("Copied")
            elseif pressedKey == 47 then
                print("Pasted")
            end
        end)

        StartText3d("Hello World!", true, {46, 47}, "[~g~E~w~] for copy", vector3(-10.95554637908935, -1436.5828857421875, 31.10155296325683), 3.0, 1.0, false, false, false, function(pressedKey)
            if pressedKey == 46 then
                print("Copied")
            end
        end)
    end
end)