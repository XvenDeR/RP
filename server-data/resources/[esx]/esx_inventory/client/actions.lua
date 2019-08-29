AddEventHandler('esx_inventory:registerActions', function()


TriggerEvent('esx_inventory:registerItemAction', "equipped_weapon", "unequip", _U("inventory_action_unequip"), function(item)

	if item.extra.weapon.ammo > 0 then
		TriggerEvent("sosamba_ui:showInputBox", "unequip-box", "Сколько разэкипировать?", "Введите количество патронов", function(text)
			local val = tonumber(text)
			if val ~= nil and val >= 0 and val <= item.extra.weapon.ammo then
				TriggerEvent('esx_inventory:unequipWeapon', item.extra.weapon.name, val)
			else
				ESX.ShowNotification(_U('amount_invalid'))
			end
		end)
	else
		TriggerEvent('esx_inventory:unequipWeapon', item.extra.weapon.name, 0)
	end
end)

TriggerEvent('esx_inventory:registerItemAction', "weapon", "equip", _U("inventory_action_equip"), function(item)
	TriggerServerEvent('esx_inventory:equipWeapon', item)
end)

TriggerEvent('esx_inventory:registerItemAction', "esx_item", "esx_use", _U("inventory_action_use"), function(item)
	TriggerServerEvent('esx:useItem', item.extra.name)
	TriggerEvent('esx_inventory:updateInventory')
end, function(item)
	if item.extra == nil then
		return false
	end
-- FIXME: Разобраться, почему usable не обновляется для напитков из basicneeds

	if item.extra.name == "icetea" then
		return true
	elseif item.extra.name == "limonade" then
		return true
	elseif item.extra.name == "drpepper" then
		return true
	elseif item.extra.name == "energy" then
		return true
	elseif item.extra.name == "mixapero" then
		return true
	elseif item.extra.name == "vodka" then
		return true
	elseif item.extra.name == "jager" then
		return true
	elseif item.extra.name == "rhum" then
		return true
	elseif item.extra.name == "whisky" then
		return true
	elseif item.extra.name == "martini" then
		return true
	elseif item.extra.name == "vodkaenergy" then
		return true
	end

	return item.extra.usable == true
end)

TriggerEvent('esx_inventory:registerItemAction', "money_pack", "unpack", _U("inventory_action_unpack"), function(item)
	TriggerServerEvent('esx_inventory:actionUnpackMoney', item)
end)

TriggerEvent('esx_inventory:registerItemAction', "passport", "show", "Просмотреть", function(item)
	hideInventoryMenu()
	TriggerServerEvent('sosamba_ui:actionShowPassport', item)
end)


TriggerEvent('esx_inventory:registerItemAction', "@shared", "drop", "Выбросить", function(item) -- action
	local amount = 0

	if item == nil or item.amount == nil or item.amount < 1 then
		TriggerEvent('esx:showNotification', "Нельзя выбросить")
		return
	end

	if item.amount == 1 then
		TriggerServerEvent('esx_inventory:dropItem', "pocket", false, duplicateItem(item, { ["amount"] = 1 }))
		TriggerEvent('esx_inventory:updateInventory')
	else
		TriggerEvent("sosamba_ui:showInputBox", "drop-box", "Сколько выбросить?", "Введите количество предметов", function(text)
			local val = tonumber(text)
			if val ~= nil then
				amount = tonumber(text)
			end

			if amount ~= nil and amount > 0 then
				TriggerServerEvent('esx_inventory:dropItem', "pocket", false, duplicateItem(item, { ["amount"] = amount }))
				TriggerEvent('esx_inventory:updateInventory')
			end
		end)
	end

end, function(item) -- condition
	if item ~= nil and item.droppable ~= nil then
		return item.droppable
	end

	return true
end)

TriggerEvent('esx_inventory:registerItemAction', "@shared", "giveitemto", "Передать", function(item)
	local amount = item.amount

	if item == nil then
		TriggerEvent('esx:showNotification', "Неверный предмет для передачи")
		return
	end

	if amount == nil then
		TriggerEvent('esx:showNotification', "Неверное количество предметов для передачи")
		return
	end

	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
--	closestPlayer = PlayerId()
--	closestDistance = 1.0

	if closestPlayer < 1 or closestDistance > 3.0 then
		TriggerEvent('esx:showNotification', "Рядом никого нет")
		return
	end

        if amount < 2 then
		local ditem = duplicateItem(item, { ["amount"] = amount })
		ESX.TriggerServerCallback('esx_inventory:giveItemTo', function()
--			print(json.encode(ditem))
		end, GetPlayerServerId(closestPlayer), ditem)
		TriggerEvent('esx:showNotification', "Предмет передан")
	else
		TriggerEvent("sosamba_ui:showInputBox", "giveto-box", "Сколько передать?", "Введите количество предметов", function(text)
			amount = tonumber(text)

			if amount ~= nil and amount > 0 then
				local ditem = duplicateItem(item, { ["amount"] = amount })

				ESX.TriggerServerCallback('esx_inventory:giveItemTo', function()
--					print(json.encode(ditem))
				end, GetPlayerServerId(closestPlayer), ditem)
			else
				TriggerEvent('esx:showNotification', "Неверное количество предметов для передачи")
			end
		end)
	end
end, function(item) -- condition
	if item ~= nil and item.name ~= nil then
		return item.name ~= 'account_money' and item.name ~= 'equipped_weapon'
	end

	return true
end)

end)
