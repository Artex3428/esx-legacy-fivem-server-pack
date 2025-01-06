RegisterServerEvent("trafficLights:setLight")
    AddEventHandler("trafficLights:setLight", function(coords)
        TriggerClientEvent("trafficLights:setLight", -1, coords)
end)