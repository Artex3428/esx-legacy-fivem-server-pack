local SEARCH_STEP_SIZE = 10.0           -- Step size to search for traffic lights
local SEARCH_MIN_DISTANCE = 20.0        -- Minimum distance to search for traffic lights
local SEARCH_MAX_DISTANCE = 60.0        -- Maximum distance to search for traffic lights
local SEARCH_RADIUS = 10.0              -- Radius to search for traffic light after translating coordinates
local HEADING_THRESHOLD = 20.0          -- Player must match traffic light orientation within threshold (degrees)
local TRAFFIC_LIGHT_DURATION_MS = 5000  -- Duration to turn light green (ms)

local trafficLightObjects = {
    [0] = 0x3e2b73a4,  -- prop_traffic_01a
    [1] = 0x336e5e2a,  -- prop_traffic_01b
    [2] = 0xd8eba922,  -- prop_traffic_01d
    [3] = 0xd4729f50,  -- prop_traffic_02a
    [4] = 0x272244b2,  -- prop_traffic_02b
    [5] = 0x33986eae,  -- prop_traffic_03a
    [6] = 0x2323cdc5   -- prop_traffic_03b
}

RegisterNetEvent("trafficLights:setLight")
AddEventHandler("trafficLights:setLight", function(coords)
    for _, trafficLightObject in pairs(trafficLightObjects) do
        trafficLight = GetClosestObjectOfType(coords, 1.0, trafficLightObject, false, false, false)
        if trafficLight ~= 0 then
            SetEntityTrafficlightOverride(trafficLight, 0)
            Citizen.Wait(TRAFFIC_LIGHT_DURATION_MS)
            SetEntityTrafficlightOverride(trafficLight, -1)
            break
        end
    end
end)

Citizen.CreateThread(function()
    local lastTrafficLight = 0

    while true do
        Citizen.Wait(1000)
        local player = GetPlayerPed(-1)

        if IsPedInAnyVehicle(player) and IsVehicleStopped(GetVehiclePedIsIn(player)) then
            local playerPosition = GetEntityCoords(player)
            local playerHeading = GetEntityHeading(player)
            local trafficLight = 0

            for searchDistance = SEARCH_MAX_DISTANCE, SEARCH_MIN_DISTANCE, -SEARCH_STEP_SIZE do
                local searchPosition = translateVector3(playerPosition, playerHeading, searchDistance)

                for _, trafficLightObject in pairs(trafficLightObjects) do
                    trafficLight = GetClosestObjectOfType(searchPosition, SEARCH_RADIUS, trafficLightObject, false, false, false)
                    if trafficLight ~= 0 then
                        local lightHeading = GetEntityHeading(trafficLight)
                        local headingDiff = math.abs(playerHeading - lightHeading)
                        if ((headingDiff < HEADING_THRESHOLD) or (headingDiff > (360.0 - HEADING_THRESHOLD))) then
                            break
                        else
                            trafficLight = 0
                        end
                    end
                end
                if trafficLight ~= 0 then
                    break
                end
            end
            if (trafficLight ~= 0) and (trafficLight ~= lastTrafficLight) then
                TriggerServerEvent('trafficLights:setLight', GetEntityCoords(trafficLight, false))
                lastTrafficLight = trafficLight
                Citizen.Wait(TRAFFIC_LIGHT_DURATION_MS)
            end
        end
    end
end)

function translateVector3(pos, angle, distance)
    local angleRad = angle * 2.0 * math.pi / 360.0
    return vector3(pos.x - distance*math.sin(angleRad), pos.y + distance*math.cos(angleRad), pos.z)
end

function getNearbyVehicles()
    local vehicles = {}
    local findHandle, vehicle = FindFirstVehicle()
    if findHandle then
        local retval = true
        while retval and vehicle ~= 0 do
            table.insert(vehicles, vehicle)
            retval, vehicle = FindNextVehicle()
        end
        EndFindVehicle(findHandle)
    end
    return vehicles
end