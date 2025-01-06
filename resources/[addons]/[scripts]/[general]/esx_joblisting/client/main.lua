function ShowJobListingMenu()
  menuIsShowed = true
  ESX.TriggerServerCallback('esx_joblisting:getJobsList', function(jobs)
    local elements = {{unselectable = "true", title = TranslateCap('job_center'), icon = "fas fa-briefcase"}}

    for i = 1, #(jobs) do
      elements[#elements + 1] = {title = jobs[i].label, name = jobs[i].name}
    end

    ESX.OpenContext("right", elements, function(menu, SelectJob)
      TriggerServerEvent('esx_joblisting:setJob', SelectJob.name)
      ESX.CloseContext()
      ESX.ShowNotification(TranslateCap('new_job', SelectJob.title), "success")
    end, function()
    end)
  end)
end

-- Activate menu when player is inside marker, and draw markers
CreateThread(function()
  while true do
    exports['artex-3dtextui']:StartText3d("Joblisting", true, {46, 47}, TranslateCap("access_job_center"), Config.Zone, 5.0, 1.0, false, false, function(pressedKey)
      if pressedKey == 46 then
        ShowJobListingMenu()
      end
    end)
    Wait(0)
  end
end)

-- Create blips
if Config.Blip.Enabled then
  CreateThread(function()
      local blip = AddBlipForCoord(Config.Zone)

      SetBlipSprite(blip, Config.Blip.Sprite)
      SetBlipDisplay(blip, Config.Blip.Display)
      SetBlipScale(blip, Config.Blip.Scale)
      SetBlipColour(blip, Config.Blip.Colour)
      SetBlipAsShortRange(blip, Config.Blip.ShortRange)

      BeginTextCommandSetBlipName("STRING")
      AddTextComponentSubstringPlayerName(TranslateCap('blip_text'))
      EndTextCommandSetBlipName(blip)
  end)
end