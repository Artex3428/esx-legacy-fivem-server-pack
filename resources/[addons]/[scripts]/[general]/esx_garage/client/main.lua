local LastMarker, LastPart, thisGarage, thisPound = nil, nil, nil, nil
local next = next
local nearMarker, menuIsShowed = false, false
local vehiclesList, vehiclesImpoundedList = {}, {}

RegisterNetEvent('esx_garage:closemenu')
AddEventHandler('esx_garage:closemenu', function()
    menuIsShowed = false
    vehiclesList, vehiclesImpoundedList = {}, {}

    SetNuiFocus(false)
    SendNUIMessage({
        hideAll = true
    })

end)

RegisterNUICallback('escape', function(data, cb)
    TriggerEvent('esx_garage:closemenu')
    cb('ok')
end)

RegisterNUICallback('spawnVehicle', function(data, cb)
    local spawnCoords = vector3(data.spawnPoint.x, data.spawnPoint.y, data.spawnPoint.z)
    if thisGarage then

        if ESX.Game.IsSpawnPointClear(spawnCoords, 2.5) then
            thisGarage = nil
            TriggerServerEvent('esx_garage:updateOwnedVehicle', false, nil, nil, data, spawnCoords)
            TriggerEvent('esx_garage:closemenu')

            ESX.ShowNotification(TranslateCap('veh_released'))

        else
            ESX.ShowNotification(TranslateCap('veh_block'), 'error')
        end

    elseif thisPound then

        ESX.TriggerServerCallback('esx_garage:checkMoney', function(hasMoney)
            if hasMoney then
                if ESX.Game.IsSpawnPointClear(spawnCoords, 2.5) then
                    TriggerServerEvent('esx_garage:payPound', data.exitVehicleCost)
                    thisPound = nil

                    TriggerServerEvent('esx_garage:updateOwnedVehicle', false, nil, nil, data, spawnCoords)
                    TriggerEvent('esx_garage:closemenu')

                else
                    ESX.ShowNotification(TranslateCap('veh_block'), 'error')
                end
            else
                ESX.ShowNotification(TranslateCap('missing_money'))
            end
        end, data.exitVehicleCost)

    end

    cb('ok')
end)

RegisterNUICallback('impound', function(data, cb)
    local poundCoords = {
        x = data.poundSpawnPoint.x,
        y = data.poundSpawnPoint.y
    }

    TriggerServerEvent('esx_garage:setImpound', data.poundName, data.vehicleProps)
    TriggerEvent('esx_garage:closemenu')

    SetNewWaypoint(poundCoords.x, poundCoords.y)

    cb('ok')
end)


local activeBlips = {}

function RemoveJobBlips()
    for _, blip in pairs(activeBlips) do
        RemoveBlip(blip) -- Remove each blip from the map
    end
    activeBlips = {} -- Clear the table
end

function CheckPlayerJob()
    if ESX.PlayerData and ESX.PlayerData.job then
        return ESX.PlayerData.job.name
    end
end


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job -- Update the job in ESX.PlayerData
    print('Job updated: ' .. job.name)
    RemoveJobBlips()
    CreaTheBlips() -- Optionally call this to re-check or notify the player
end)

-- Create Blips
function CreaTheBlips()
    CreateThread(function()
        for k, v in pairs(Config.Garages) do
            if v.Job == "" then
                if v.ShowBlip then
                    local blip = AddBlipForCoord(v.EntryPoint.x, v.EntryPoint.y, v.EntryPoint.z)
                    
                    SetBlipSprite(blip, v.Sprite)
                    SetBlipDisplay(blip, 4)
                    SetBlipScale(blip, v.Scale)
                    SetBlipColour(blip, v.Colour)
                    SetBlipAsShortRange(blip, true)
                    
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentSubstringPlayerName(TranslateCap('parking_blip_name'))
                    EndTextCommandSetBlipName(blip)
                end
            end
            if v.Job == CheckPlayerJob() then
                local blip = AddBlipForCoord(v.EntryPoint.x, v.EntryPoint.y, v.EntryPoint.z)

                SetBlipSprite(blip, v.Sprite)
                SetBlipDisplay(blip, 4)
                SetBlipScale(blip, v.Scale)
                SetBlipColour(blip, v.Colour)
                SetBlipAsShortRange(blip, true)

                BeginTextCommandSetBlipName("STRING")
                AddTextComponentSubstringPlayerName(TranslateCap('parking_blip_name'))
                EndTextCommandSetBlipName(blip)

                table.insert(activeBlips, blip)
            end
        end

        for k, v in pairs(Config.Impounds) do
            local blip = AddBlipForCoord(v.GetOutPoint.x, v.GetOutPoint.y, v.GetOutPoint.z)

            SetBlipSprite(blip, v.Sprite)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, v.Scale)
            SetBlipColour(blip, v.Colour)
            SetBlipAsShortRange(blip, true)

            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(TranslateCap('Impound_blip_name'))
            EndTextCommandSetBlipName(blip)
        end
    end)
end

CreateThread(function()
    while not ESX or not ESX.PlayerData.job do
        Wait(100) -- Wait until ESX and job data are loaded
    end
    CreaTheBlips() -- Create the blips after loading
end)

AddEventHandler('esx_garage:hasEnteredMarker', function(name, part)
    if part == 'EntryPoint' then
        local garage = Config.Garages[name]
        thisGarage = garage
    end

    if part == 'GetOutPoint' then
        local pound = Config.Impounds[name]
        thisPound = pound
    end
end)

AddEventHandler('esx_garage:hasExitedMarker', function()
    thisGarage = nil
    thisPound = nil
    ESX.HideUI()
    TriggerEvent('esx_garage:closemenu')
end)

-- Display markers
CreateThread(function()
    while true do
        local sleep = 500

        local playerPed = ESX.PlayerData.ped
        local coords = GetEntityCoords(playerPed)
        local inVehicle = IsPedInAnyVehicle(playerPed, false)

        if not inVehicle then
            
            -- parking
            for k, v in pairs(Config.Garages) do
                if v.Job == "" then
                    if (#(coords - vector3(v.EntryPoint.x, v.EntryPoint.y, v.EntryPoint.z)) < Config.DrawDistance) then
                        exports['artex-3dtextui']:StartText3d(TranslateCap('title'), true, {46}, TranslateCap('access_parking'), vector3(v.EntryPoint.x, v.EntryPoint.y, v.EntryPoint.z), 3.0, 1.0, false, false, function(pressedKey)
    
                        end)
                        sleep = 0
                        break
                    end
                else
                    if v.Job == CheckPlayerJob() then
                        if (#(coords - vector3(v.EntryPoint.x, v.EntryPoint.y, v.EntryPoint.z)) < Config.DrawDistance) then
                            exports['artex-3dtextui']:StartText3d(TranslateCap('title'), true, {46}, TranslateCap('access_parking'), vector3(v.EntryPoint.x, v.EntryPoint.y, v.EntryPoint.z), 3.0, 1.0, false, false, function(pressedKey)
                                
                            end)
                            sleep = 0
                            break
                        end
                    end
                end
            end
        end

        -- SpawnPoint
        if inVehicle then
            for k, v in pairs(Config.Garages) do
                if v.Job == "" then
                    if (#(coords - vector3(v.SpawnPoint.x, v.SpawnPoint.y, v.SpawnPoint.z)) < Config.DrawDistance) then
                        exports['artex-3dtextui']:StartText3d(TranslateCap('title'), true, {46}, TranslateCap('park_veh'), vector3(v.SpawnPoint.x, v.SpawnPoint.y, v.SpawnPoint.z), 5.0, 1.0, false, false, function(pressedKey)

                        end)
                        sleep = 0
                        break
                    end
                else
                    if v.Job == CheckPlayerJob() then
                        if (#(coords - vector3(v.EntryPoint.x, v.EntryPoint.y, v.EntryPoint.z)) < Config.DrawDistance) then
                            exports['artex-3dtextui']:StartText3d(TranslateCap('title'), true, {46}, TranslateCap('park_veh'), vector3(v.SpawnPoint.x, v.SpawnPoint.y, v.SpawnPoint.z), 5.0, 1.0, false, false, function(pressedKey)

                            end)
                            sleep = 0
                            break
                        end
                    end
                end
            end
        end

        -- Impound
        for k, v in pairs(Config.Impounds) do
            if (#(coords - vector3(v.GetOutPoint.x, v.GetOutPoint.y, v.GetOutPoint.z)) < Config.DrawDistance) then
                exports['artex-3dtextui']:StartText3d(TranslateCap('title_impound'), true, {46}, TranslateCap('access_Impound'), vector3(v.GetOutPoint.x, v.GetOutPoint.y, v.GetOutPoint.z), 3.0, 1.0, false, false, function(pressedKey)
                    
                end)
                sleep = 0
                break
            end
        end

        if sleep == 0 then
            nearMarker = true
        else
            nearMarker = false
        end

        Wait(sleep)
    end
end)

-- Enter / Exit marker events (parking)
CreateThread(function()
    while true do
        if nearMarker then
            local playerPed = ESX.PlayerData.ped
            local coords = GetEntityCoords(playerPed)
            local isInMarker = false
            local currentMarker = nil
            local currentPart = nil

            for k, v in pairs(Config.Garages) do
                if (#(coords - vector3(v.EntryPoint.x, v.EntryPoint.y, v.EntryPoint.z)) <
                    Config.Markers.EntryPoint.Size.x) then
                    isInMarker = true
                    currentMarker = k
                    currentPart = 'EntryPoint'
                    local isInVehicle = IsPedInAnyVehicle(playerPed, false)

                    if not isInVehicle then
                        if IsControlJustReleased(0, 38) and not menuIsShowed then
                            ESX.TriggerServerCallback('esx_garage:getVehiclesInParking', function(vehicles)
                                if next(vehicles) then
                                    menuIsShowed = true

                                    for i = 1, #vehicles, 1 do
                                        table.insert(vehiclesList, {
                                            model = GetDisplayNameFromVehicleModel(vehicles[i].vehicle.model),
                                            plate = vehicles[i].plate,
                                            props = vehicles[i].vehicle
                                        })

                                    end

                                    local spawnPoint = {
                                        x = v.SpawnPoint.x,
                                        y = v.SpawnPoint.y,
                                        z = v.SpawnPoint.z,
                                        heading = v.SpawnPoint.heading
                                    }

                                    ESX.TriggerServerCallback('esx_garage:getVehiclesImpounded', function(vehicles)
                                        if next(vehicles) then

                                            for i = 1, #vehicles, 1 do
                                                table.insert(vehiclesImpoundedList, {
                                                    model = GetDisplayNameFromVehicleModel(vehicles[i].vehicle.model),
                                                    plate = vehicles[i].plate,
                                                    props = vehicles[i].vehicle
                                                })
                                            end

                                            local poundSpawnPoint = {
                                                x = Config.Impounds[v.ImpoundedName].GetOutPoint.x,
                                                y = Config.Impounds[v.ImpoundedName].GetOutPoint.y
                                            }

                                            SendNUIMessage({
                                                showMenu = true,
                                                type = 'garage',
                                                vehiclesList = {json.encode(vehiclesList)},
                                                vehiclesImpoundedList = {json.encode(vehiclesImpoundedList)},
                                                poundName = v.ImpoundedName,
                                                poundSpawnPoint = poundSpawnPoint,
                                                spawnPoint = spawnPoint,
                                                locales = {
                                                    action = TranslateCap('veh_exit'),
                                                    veh_model = TranslateCap('veh_model'),
                                                    veh_plate = TranslateCap('veh_plate'),
                                                    veh_condition = TranslateCap('veh_condition'),
                                                    veh_action = TranslateCap('veh_action'),
                                                    impound_action = TranslateCap('impound_action')
                                                }
                                            })
                                        else
                                            SendNUIMessage({
                                                showMenu = true,
                                                type = 'garage',
                                                vehiclesList = {json.encode(vehiclesList)},
                                                spawnPoint = spawnPoint,
                                                locales = {
                                                    action = TranslateCap('veh_exit'),
                                                    veh_model = TranslateCap('veh_model'),
                                                    veh_plate = TranslateCap('veh_plate'),
                                                    veh_condition = TranslateCap('veh_condition'),
                                                    veh_action = TranslateCap('veh_action'),
                                                    no_veh_impounded = TranslateCap('no_veh_impounded')
                                                }
                                            })
                                        end
                                    end)

                                    SetNuiFocus(true, true)

                                    if menuIsShowed then
                                        ESX.HideUI()
                                    end
                                else
                                    menuIsShowed = true

                                    ESX.TriggerServerCallback('esx_garage:getVehiclesImpounded', function(vehicles)
                                        if next(vehicles) then

                                            for i = 1, #vehicles, 1 do
                                                table.insert(vehiclesImpoundedList, {
                                                    model = GetDisplayNameFromVehicleModel(vehicles[i].vehicle.model),
                                                    plate = vehicles[i].plate,
                                                    props = vehicles[i].vehicle
                                                })
                                            end

                                            local poundSpawnPoint = {
                                                x = Config.Impounds[v.ImpoundedName].GetOutPoint.x,
                                                y = Config.Impounds[v.ImpoundedName].GetOutPoint.y
                                            }

                                            SendNUIMessage({
                                                showMenu = true,
                                                type = 'garage',
                                                vehiclesImpoundedList = {json.encode(vehiclesImpoundedList)},
                                                poundName = v.ImpoundedName,
                                                poundSpawnPoint = poundSpawnPoint,
                                                locales = {
                                                    action = TranslateCap('veh_exit'),
                                                    veh_model = TranslateCap('veh_model'),
                                                    veh_plate = TranslateCap('veh_plate'),
                                                    veh_condition = TranslateCap('veh_condition'),
                                                    veh_action = TranslateCap('veh_action'),
                                                    no_veh_parking = TranslateCap('no_veh_parking'),
                                                    no_veh_impounded = TranslateCap('no_veh_impounded'),
                                                    impound_action = TranslateCap('impound_action')
                                                }
                                            })
                                        else
                                            SendNUIMessage({
                                                showMenu = true,
                                                type = 'garage',
                                                locales = {
                                                    action = TranslateCap('veh_exit'),
                                                    veh_model = TranslateCap('veh_model'),
                                                    veh_plate = TranslateCap('veh_plate'),
                                                    veh_condition = TranslateCap('veh_condition'),
                                                    veh_action = TranslateCap('veh_action'),
                                                    no_veh_parking = TranslateCap('no_veh_parking')
                                                }
                                            })
                                        end
                                    end)

                                    SetNuiFocus(true, true)

                                    if menuIsShowed then
                                        ESX.HideUI()
                                    end
                                end
                            end, currentMarker)
                        end
                    end

                    break
                end
            end

            for k, v in pairs(Config.Garages) do
                if (#(coords - vector3(v.SpawnPoint.x, v.SpawnPoint.y, v.SpawnPoint.z)) < Config.Markers.SpawnPoint.Size.x) then
                    isInMarker = true
                    currentMarker = k
                    currentPart = 'SpawnPoint'
                    local isInVehicle = IsPedInAnyVehicle(playerPed, false)


                    if isInVehicle then
                        if IsControlJustReleased(0, 38) then
                            local vehicle = GetVehiclePedIsIn(playerPed, false)
                            local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
                            ESX.TriggerServerCallback('esx_garage:checkVehicleOwner', function(owner)
                                if owner then
                                    ESX.Game.DeleteVehicle(vehicle)
                                    TriggerServerEvent('esx_garage:updateOwnedVehicle', true, currentMarker, nil,
                                        {vehicleProps = vehicleProps})
                                else
                                    ESX.ShowNotification(TranslateCap('not_owning_veh'), 'error')
                                end
                            end, vehicleProps.plate)
                        end
                    end
                    break
                end
            end

            for k, v in pairs(Config.Impounds) do

                if (#(coords - vector3(v.GetOutPoint.x, v.GetOutPoint.y, v.GetOutPoint.z)) < 2.0) then
                    isInMarker = true
                    currentMarker = k
                    currentPart = 'GetOutPoint'

                    if IsControlJustReleased(0, 38) and not menuIsShowed then
                        ESX.TriggerServerCallback('esx_garage:getVehiclesInPound', function(vehicles)
                            if next(vehicles) then
                                menuIsShowed = true

                                for i = 1, #vehicles, 1 do
                                    table.insert(vehiclesList, {
                                        model = GetDisplayNameFromVehicleModel(vehicles[i].vehicle.model),
                                        plate = vehicles[i].plate,
                                        props = vehicles[i].vehicle
                                    })
                                end

                                local spawnPoint = {
                                    x = v.SpawnPoint.x,
                                    y = v.SpawnPoint.y,
                                    z = v.SpawnPoint.z,
                                    heading = v.SpawnPoint.heading
                                }

                                SendNUIMessage({
                                    showMenu = true,
                                    type = 'impound',
                                    vehiclesList = {json.encode(vehiclesList)},
                                    spawnPoint = spawnPoint,
                                    poundCost = v.Cost,
                                    locales = {
                                        action = TranslateCap('pay_impound'),
                                        veh_model = TranslateCap('veh_model'),
                                        veh_plate = TranslateCap('veh_plate'),
                                        veh_condition = TranslateCap('veh_condition'),
                                        veh_action = TranslateCap('veh_action')
                                    }
                                })

                                SetNuiFocus(true, true)

                                if menuIsShowed then
                                    ESX.HideUI()
                                end
                            else
                                ESX.ShowNotification(TranslateCap('no_veh_Impound'))
                            end
                        end, currentMarker)
                    end
                    break
                end
            end

            if isInMarker and not HasAlreadyEnteredMarker or
                (isInMarker and (LastMarker ~= currentMarker or LastPart ~= currentPart)) then

                if LastMarker ~= currentMarker or LastPart ~= currentPart then
                    TriggerEvent('esx_garage:hasExitedMarker')
                end

                HasAlreadyEnteredMarker = true
                LastMarker = currentMarker
                LastPart = currentPart

                TriggerEvent('esx_garage:hasEnteredMarker', currentMarker, currentPart)
            end

            if not isInMarker and HasAlreadyEnteredMarker then
                HasAlreadyEnteredMarker = false

                TriggerEvent('esx_garage:hasExitedMarker')
            end

            Wait(0)
        else
            Wait(500)
        end
    end
end)
