local customStations = {}
local liveRadioSounds = {}
local youtubeActive = false
local radioVolume = Config.defaultRadioVolume
xSound = exports.xsound

if Config.Framework == "ESX" then
    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded', function()
        lib.callback('ogi-car-radio:server:getRadios', false, function(vehicles)
            for vehNetId, info in pairs(vehicles) do
                TriggerEvent('ogi-car-radio:client:syncAudio', vehNetId, info.radio, info.volume, info.url)
            end
        end)
    end)
end

RegisterNetEvent('ogi-car-radio:client:syncAudio', function(vehNetId, musicId)
    if not musicId then
        liveRadioSounds[vehNetId] = nil
        return
    end

    xSound:onPlayStart(musicId, function()
        liveRadioSounds[vehNetId] = musicId
    end)

    -- Ensure youtubeActive is reset to false when music finishes playing
    xSound:onPlayEnd(musicId, function()
        youtubeActive = false
        liveRadioSounds[vehNetId] = nil -- Cleanup the liveRadioSounds table entry
    end)
end)

RegisterCommand("carradio", function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)

    if vehicle ~= 0 and vehicle ~= nil then
        if not youtubeActive and GetPedInVehicleSeat(vehicle, -1) == ped then
            local inputData = lib.inputDialog(Language[Config.Language]["name"], {
                {
                    type = "number",
                    label = Language[Config.Language]["volume_label"],
                    icon = Language[Config.Language]["volume_icon"],
                    min = 0,
                    max = 10, -- do not change this
                    placeholder = Language[Config.Language]["volume_help"],
                    default = 2,
                    required = true,
                },
                {
                    type = "input",
                    label = Language[Config.Language]["custom_url_label"],
                    icon = Language[Config.Language]["custom_url_icon"],
                    placeholder = Language[Config.Language]["custom_url_help"],
                },
            })
            if inputData then
                radioVolume = inputData[1] / 10
                if inputData[2] and inputData[2] ~= "" and isYoutubeUrl(inputData[2]) then
                    youtubeActive = true
                    TriggerServerEvent('ogi-car-radio:server:saveAudio', VehToNet(vehicle), customStations[radioStationName], radioVolume, inputData[2])
                else
                    TriggerServerEvent('ogi-car-radio:server:saveAudio', VehToNet(vehicle), nil, radioVolume, nil)
                end
            end
        else
            local vehNetId = VehToNet(vehicle)
            local musicId = liveRadioSounds[vehNetId]

            if musicId and xSound:soundExists(musicId) then
                xSound:Destroy(musicId) -- Destroy the sound
                liveRadioSounds[vehNetId] = nil -- Remove from active list
                youtubeActive = false
            else
                print("[ERROR] Unable to destroy musicId: nil or invalid")
                liveRadioSounds[vehNetId] = nil -- Clean up invalid entry to prevent future errors
            end
        end
    else
        local vehicle = GetVehiclePedIsIn(ped, true)
        if vehicle ~= 0 and vehicle ~= nil then
            if NetworkDoesEntityExistWithNetworkId(VehToNet(vehicle)) then
                lib.callback('ogi-car-radio:server:getRadioForVehicle', false, function(radio)
                    if not GetIsVehicleEngineRunning(vehicle) or not IsVehicleRadioEnabled(vehicle) then -- stop radio
                        youtubeActive = false
                        TriggerServerEvent('ogi-car-radio:server:saveAudio', VehToNet(vehicle), nil, radioVolume, nil)
                    end
                end, VehToNet(vehicle))
            end
        end
    end
end)

-- Update sound position or destroy if vehicle is gone
Citizen.CreateThread(function()
    while true do
        local sleep = 500
        for vehNetId, musicId in pairs(liveRadioSounds) do
            if not musicId or not xSound:soundExists(musicId) then
                liveRadioSounds[vehNetId] = nil
            elseif not vehNetId or not NetworkDoesEntityExistWithNetworkId(vehNetId) or GetVehicleEngineHealth(NetToVeh(vehNetId)) < 0 then
                if xSound:soundExists(musicId) then
                    xSound:Destroy(musicId)
                end
                liveRadioSounds[vehNetId] = nil
            else
                local vehicle = NetToVeh(vehNetId)
                if vehicle and GetVehiclePedIsIn(PlayerPedId(), false) == vehicle then -- inside vehicle playing radio
                    if xSound:getDistance(musicId) ~= Config.soundDistanceInMusicVehicle then
                        xSound:Distance(musicId, Config.soundDistanceInMusicVehicle)
                    end
                else -- outside vehicle
                    if xSound:getDistance(musicId) == Config.soundDistanceInMusicVehicle then
                        xSound:Distance(musicId, xSound:getVolume(musicId) * 50) -- max distance = 50
                    end
                end
                xSound:Position(musicId, GetEntityCoords(vehicle))
            end
        end
        Wait(sleep)
    end
end)