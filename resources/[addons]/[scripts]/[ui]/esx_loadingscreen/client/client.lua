local ClientLoadESX = false
Citizen.CreateThread( function ()
    while true do
        Citizen.Wait(0)
    end
end)
AddEventHandler("playerSpawned", function()
    if not ClientLoadESX then
        ShutdownLoadingScreenNui()
        ClientLoadESX = true
        if Config.Fade then
            DoScreenFadeOut(0)
            Wait(3000)
            DoScreenFadeIn(2500)
        end
    end
end)
