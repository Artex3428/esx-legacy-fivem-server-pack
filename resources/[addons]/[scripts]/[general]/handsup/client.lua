LoadAnimDict = function(Dict)
    if not DoesAnimDictExist(Dict) then return print('message from ' .. GetInvokingResource() or GetCurrentResourceName() .. ' ' .. Dict .. ' is not a valid animation dictionary') end
    RequestAnimDict(Dict)

    while not HasAnimDictLoaded(Dict) do
        Wait(10)
    end
end

CreateThread(function()
    Wait(100)

    while true do
        local Player, sleepThread = PlayerPedId(), 100
        if not IsPedInAnyVehicle(PlayerPedId(), false) then
            if IsControlPressed(0, 323) then
                if IsEntityPlayingAnim(Player, "mp_arresting", "idle", 3) then return end

                handsup = true;
            else
                if handsup then
                    handsup = false;
                    SetFacialIdleAnimOverride(Player, 'pose_normal_1', 0)
                    ClearPedTasks(Player)
                end
            end

            if handsup then
                if not IsEntityPlayingAnim(Player, 'random@mugging3', 'handsup_standing_base', 3) then
                    SetFacialIdleAnimOverride(Player, 'mood_stressed_1', 0)

                    if not IsEntityPlayingAnim(Player, 'random@mugging3', 'handsup_standing_base', 3) then
                        LoadAnimDict('random@mugging3')
                        TaskPlayAnim(Player, 'random@mugging3', 'handsup_standing_base', 2.0, -1.0, -1, 49, 0, 0, 0, 0)
                    end
                end
            end

            if IsControlJustReleased(0, 323) then
                if IsEntityPlayingAnim(Player, "mp_arresting", "idle", 3) then return end
                SetFacialIdleAnimOverride(Player, 'pose_normal_1', 0)
                ClearPedTasks(Player)
            end
        end
        Wait(sleepThread)
    end
end)