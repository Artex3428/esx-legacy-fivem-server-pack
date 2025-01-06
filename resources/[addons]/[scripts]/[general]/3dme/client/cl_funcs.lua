Show3DMe = function(player, text)
    local currentTimer = 0
    text = text or "No value"

    while currentTimer < Config.Duration do
        Citizen.Wait(0)
        local PlayerCoords = GetEntityCoords(GetPlayerPed(player))
        currentTimer = currentTimer + 1

        Render3DText({ coords = PlayerCoords, message = text })
    end

end

Render3DText = function(data)
    SetDrawOrigin(data.coords.x, data.coords.y, data.coords.z + 1)

    SetTextScale(0.3, 0.3)
    SetTextFont(4)
    SetTextEntry('STRING')
    SetTextCentre(1)
    AddTextComponentString(data.message)
    DrawText(0.0, 0.0)
    DrawRect(0.0, 0.0125, 0.015 + data.message:len() / 360, 0.03, 41, 11, 41, 68)

    ClearDrawOrigin()
end
