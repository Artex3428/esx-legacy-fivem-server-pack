AddEventHandler('chatMessage', function(playerId, playerName, message)
    -- Check if the message does not start with a slash (indicating a regular chat message)
    if string.sub(message, 1, 1) ~= '/' then
        CancelEvent() -- Cancel the chat message
    end
end)