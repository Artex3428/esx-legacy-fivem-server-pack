cachedData = {
    SentMessages = {}
}

RegisterNetEvent('esx_me:eventHandler')
AddEventHandler('esx_me:eventHandler', function(Event, Data)
    local source, target = PlayerId(), GetPlayerFromServerId(Data.ID)

    if Event == "SendMessage" then
        if #Data.Message == 0 then return "No value" end
        local distance = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(GetPlayerPed(target)))

        if distance < Config.DrawDistance then 

            TriggerEvent("chat:addMessage", {
                args = { Data.Name, Data.Message }
            })

            table.insert(cachedData.SentMessages, {
                name = Data.Name,
                message = Data.Message
            })

            Show3DMe(GetPlayerFromServerId(Data.ID), Data.Message)

            if Data.Message == cachedData.SentMessages[1].message then 
                print("You can only send one message at a time.")
            end
        else
            ClearDrawOrigin()
        end
    end
end)