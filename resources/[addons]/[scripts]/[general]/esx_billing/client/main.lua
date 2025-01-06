local function ShowBillsMenu()
	ESX.TriggerServerCallback('esx_billing:getBills', function(bills)
		if #bills <= 0 then return ESX.ShowNotification(TranslateCap('no_invoices')) end

		local elements = {
			{ unselectable = true, icon = 'fas fa-file', title = TranslateCap('invoices') }
		}

		for _, v in ipairs(bills) do
			elements[#elements + 1] = {
				icon = 'fas fa-usd',
				title = ('%s - <span style="color:red;">%s</span>'):format(v.label,
					TranslateCap('invoices_item', ESX.Math.GroupDigits(v.amount))),
				billId = v.id
			}
		end

		ESX.OpenContext('right', elements, function(menu, element)
			local billId = element.billId

			ESX.TriggerServerCallback('esx_billing:payBill', function(resp)
				ShowBillsMenu()

				if not resp then return end
				TriggerEvent('esx_billing:paidBill', billId)
			end, billId)
		end)
	end)
end

RegisterNetEvent("OpenBills", ShowBillsMenu)