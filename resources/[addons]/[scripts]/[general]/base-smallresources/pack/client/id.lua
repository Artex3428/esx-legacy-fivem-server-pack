-- Your own id
RegisterCommand('myid', function()
    local serverID = GetPlayerServerId(PlayerId())
    TriggerEvent('chat:addMessage', {
        args = {'Your ID is', '^1' .. serverID}
    })
end)