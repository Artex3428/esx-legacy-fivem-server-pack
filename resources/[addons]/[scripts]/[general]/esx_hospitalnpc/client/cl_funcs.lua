Funcs = {}

function Funcs:HealthCare(HealthLost)
    ESX.TriggerServerCallback("esx_hospital:fetchAmbulance", function(Response)
        if (Response) then
            Hospital.BlockKeys = true
            DoScreenFadeOut(100)
            TriggerEvent("esx_ambulancejob:revive")
            Citizen.Wait(1000)
            SetEntityCoords(PlayerPedId(), Config.Settings.BedCoords)
            SetEntityHeading(PlayerPedId(), Config.Settings.BedHeading)
            TaskPlayAnim(PlayerPedId(), 'anim@gangops@morgue@table@', 'ko_front', 8.0, -8.0, -1, 1, 0, false, false, false)
            local Camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
            SetCamCoord(Camera, vector3(253.36151123046875, -1356.2506103515625, 24.53778266906738))
            SetCamRot(Camera, -10.0, 0.0, 220.0926971435547)
            SetCamActive(Camera, true)
            RenderScriptCams(true, false, 0, true, false)
            Citizen.Wait(500)
            DoScreenFadeIn(100)

            exports['esx_progressbar']:Progressbar(
                "Gets help...",
                300000,
                {

                }
            )
            TriggerServerEvent("esx_hospitalnpc:removeMoney", HealthLost)
            ESX.ShowNotification("You payed a bil on ~r~ $0")
            SetCamActive(Camera, false)
            RenderScriptCams(0, 1, 750, 1, 0)
            Hospital.BlockKeys = false

        else
            ESX.ShowNotification("I can't right now talk with the other guys.")

            if (ESX.PlayerData['job'].name == 'ambulance') then
                exports['esx_phone']:CreateAlarm({
                    Coords = GetEntityCoords(PlayerPedId()),
                    Title = 'Lobby',
                    Description = 'We got a unconscious person here, come here quick!',
                    Priority = '1'
                })
            end
        end
    end)
end