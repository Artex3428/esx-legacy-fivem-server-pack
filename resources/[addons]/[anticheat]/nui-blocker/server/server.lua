local webhook = ''

RegisterServerEvent('nuiblocker')
AddEventHandler('nuiblocker', function()
    print('Nui_blocker ' .. GetPlayerName(source))
    sendToDiscord("NUI Blocker", GetPlayerName(source).." is someone who tried to use NUI-TOOLS ID: "..os.time())
    DropPlayer(source, 'You got kicked because you tried to open NUI-TOOLS.')
end)

function sendToDiscord(name, args, color)
    local connect = {
          {
              ["color"] = 16711680,
              ["title"] = "".. name .."",
              ["description"] = args,
              ["footer"] = {
                  ["text"] = "Nui blocker.",
              },
          }
      }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "NUI Blocker Log", embeds = connect, avatar_url = ""}), { ['Content-Type'] = 'application/json' })
end