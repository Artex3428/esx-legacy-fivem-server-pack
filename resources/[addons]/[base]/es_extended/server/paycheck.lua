local notificationMessage = string.format(
    "%s\n%s\n%s",
    TranslateCap("bank"),                  -- Bank header
    TranslateCap("received_paycheck"),     -- Paycheck received message
    TranslateCap("received_help", salary)  -- Salary help message with the variable
)

local notificationMessage2 = string.format(
    "%s\n%s\n%s",
    TranslateCap("bank"),
    "",
    TranslateCap("company_nomoney")
)

local notificationMessage3 = string.format(
    "%s\n%s\n%s",
    TranslateCap("bank"),
    TranslateCap("received_paycheck"),
    TranslateCap("received_salary", salary)
)

local notificationMessage4 = string.format(
    "%s\n%s\n%s",
    TranslateCap("bank"),
    TranslateCap("received_paycheck"),
    TranslateCap("received_salary", salary)
)

local notificationMessage5 = string.format(
    "%s\n%s\n%s",
    TranslateCap("bank"),
    TranslateCap("received_paycheck"),
    TranslateCap("received_salary", salary)
)




function StartPayCheck()
    CreateThread(function()
        while true do
            Wait(Config.PaycheckInterval)
            for player, xPlayer in pairs(ESX.Players) do
                local jobLabel = xPlayer.job.label
                local job = xPlayer.job.grade_name
                local salary = xPlayer.job.grade_salary

                if salary > 0 then
                    if job == "unemployed" then -- unemployed
                        xPlayer.addAccountMoney("bank", salary, "Welfare Check")
                        TriggerClientEvent('esx:showNotification', xPlayer.source, notificationMessage)
                        if Config.LogPaycheck then
                            ESX.DiscordLogFields("Paycheck", "Paycheck - Unemployment Benefits", "green", {
                                { name = "Player", value = xPlayer.name, inline = true },
                                { name = "ID", value = xPlayer.source, inline = true },
                                { name = "Amount", value = salary, inline = true },
                            })
                        end
                    elseif Config.EnableSocietyPayouts then -- possibly a society
                        TriggerEvent("esx_society:getSociety", xPlayer.job.name, function(society)
                            if society ~= nil then -- verified society
                                TriggerEvent("esx_addonaccount:getSharedAccount", society.account, function(account)
                                    if account.money >= salary then -- does the society money to pay its employees?
                                        xPlayer.addAccountMoney("bank", salary, "Paycheck")
                                        account.removeMoney(salary)
                                        if Config.LogPaycheck then
                                            ESX.DiscordLogFields("Paycheck", "Paycheck - " .. jobLabel, "green", {
                                                { name = "Player", value = xPlayer.name, inline = true },
                                                { name = "ID", value = xPlayer.source, inline = true },
                                                { name = "Amount", value = salary, inline = true },
                                            })
                                        end

                                        TriggerClientEvent("esx:showNotification", xPlayer.source, notificationMessage3)
                                    else
                                        TriggerClientEvent("esx:showNotification", xPlayer.source, notificationMessage2)
                                    end
                                end)
                            else -- not a society
                                xPlayer.addAccountMoney("bank", salary, "Paycheck")
                                if Config.LogPaycheck then
                                    ESX.DiscordLogFields("Paycheck", "Paycheck - " .. jobLabel, "green", {
                                        { name = "Player", value = xPlayer.name, inline = true },
                                        { name = "ID", value = xPlayer.source, inline = true },
                                        { name = "Amount", value = salary, inline = true },
                                    })
                                end
                                TriggerClientEvent("esx:showNotification", xPlayer.source, notificationMessage5)
                            end
                        end)
                    else -- generic job
                        xPlayer.addAccountMoney("bank", salary, "Paycheck")
                        if Config.LogPaycheck then
                            ESX.DiscordLogFields("Paycheck", "Paycheck - Generic", "green", {
                                { name = "Player", value = xPlayer.name, inline = true },
                                { name = "ID", value = xPlayer.source, inline = true },
                                { name = "Amount", value = salary, inline = true },
                            })
                        end
                        TriggerClientEvent("esx:showNotification", xPlayer.source, notificationMessage4)
                    end
                end
            end
        end
    end)
end
