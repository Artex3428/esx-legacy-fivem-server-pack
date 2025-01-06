Funcs = {
    ShowHelp = function(Message)
        BeginTextCommandDisplayHelp('STRING')
        AddTextComponentSubstringPlayerName(Message)
        EndTextCommandDisplayHelp(0, false, true, -1)
    end,

    LoadAnimDict = function(dict)
        RequestAnimDict(dict)

        while not HasAnimDictLoaded(dict) do
            Wait(10)
        end
    end,

    DrawText3D = function(Coords, Text)
        local onScreen, _x, _y = World3dToScreen2d(Coords.x, Coords.y, Coords.z)
        
        SetTextScale(0.38, 0.38)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 200)
        SetTextEntry("STRING")
        SetTextCentre(1)
    
        AddTextComponentString(Text)
        DrawText(_x, _y)
    
        local factor = string.len(Text) / 370
        DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
    end
};