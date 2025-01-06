local stickies = {}

RegisterServerEvent('stickyme')
AddEventHandler('stickyme', function(text)
    local src = source

    if text and type(text) == 'string' then
        stickies[tostring(src)] = text
    else
        stickies[tostring(src)] = nil
    end

    TriggerClientEvent('stickyme:update', -1, stickies)
end)

RegisterServerEvent('stickyme:fetch')
AddEventHandler('stickyme:fetch', function()
    TriggerClientEvent('stickyme:update', -1, stickies)
end)

AddEventHandler('playerDropped', function()
    local src = source

    stickies[tostring(src)] = nil
    TriggerClientEvent('stickyme:update', -1, stickies)
end)