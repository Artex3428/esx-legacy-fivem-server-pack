Utils = {};
BedActive = {}
LastPressed = 0

Utils.HandleBed = function(Object)
    local Player, sleepThread = PlayerPedId(), 250;
    local Coords, Heading = GetEntityCoords(Object), GetEntityHeading(Object)

    BedActive[Object] = true

    SetEntityCoords(Player, Coords)
    Funcs.LoadAnimDict('anim@gangops@morgue@table@')
    TaskPlayAnim(Player, 'anim@gangops@morgue@table@', 'ko_front', 2.0, -1.0, -1, 1, 0, 0, 0, 0)
    SetEntityHeading(Player, Heading + 180.0)

    CreateThread(function()
        Wait(100)
        while true do

            if not Utils.CheckState() then BedActive[Object] = false end

            if IsEntityPlayingAnim(Player, 'anim@gangops@morgue@table@', 'ko_front', 3) or IsEntityPlayingAnim(Player, 'anim@heists@fleeca_bank@ig_7_jetski_owner' , 'owner_idle', 3) then
                sleepThread = 7;
                Funcs.ShowHelp('~INPUT_CONTEXT~ - Stand upp / ~INPUT_DETONATE~ - Change position')
    
                if IsControlJustReleased(0, 38) then
                    SetEntityHeading(Player, GetEntityHeading(Object) - 90.0)

                    Funcs.LoadAnimDict('switch@franklin@bed')
                    TaskPlayAnim(Player, 'switch@franklin@bed', 'sleep_getup_rubeyes', 2.0, -1.0, -1, 1, 0, 0, 0, 0)
                    
                    Wait(7000)
                    ClearPedTasks(Player)
                    BedActive[Object] = false
                end
    
                if IsControlJustReleased(0, 47) then
                    if IsEntityPlayingAnim(Player, 'anim@gangops@morgue@table@', 'ko_front', 3) then

                        Funcs.LoadAnimDict('anim@heists@fleeca_bank@ig_7_jetski_owner')
                        TaskPlayAnim(Player, 'anim@heists@fleeca_bank@ig_7_jetski_owner', 'owner_idle', 2.0, -1.0, -1, 1, 0, 0, 0, 0)
                    elseif IsEntityPlayingAnim(Player,'anim@heists@fleeca_bank@ig_7_jetski_owner' , 'owner_idle', 3) then

                        Funcs.LoadAnimDict('anim@gangops@morgue@table@')
                        TaskPlayAnim(Player, 'anim@gangops@morgue@table@', 'ko_front', 2.0, -1.0, -1, 1, 0, 0, 0, 0)
                    end

                end
            end
            Wait(sleepThread)
        end
    end)
end

Utils.CheckState = function()
    local Player = PlayerPedId();

    if IsEntityPlayingAnim(Player, 'anim@gangops@morgue@table@', 'ko_front', 3) or IsEntityPlayingAnim(Player, 'anim@heists@fleeca_bank@ig_7_jetski_owner' , 'owner_idle', 3) then
        return false
    else
        return true
    end
end