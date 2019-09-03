ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	TriggerEvent('esx_inventory:registerActions')
--	ESX.PlayerData = ESX.GetPlayerData()
end)

--inventory = {}
itemActions = {}
itemActions["@shared"] = {}

pocketWeight = 0.0
movementSpeed = 1.0

Citizen.CreateThread(function()
	while true do
		movementSpeed = 1.0

		if pocketWeight > Config.PocketWeightLimit then
			local speed = 1.0 - (pocketWeight-Config.PocketWeightLimit)/10.0
			if speed < 0.1 then
				speed = 0.1
			end
			movementSpeed = speed
		end

		Citizen.Wait(100)
	end
end)

Citizen.CreateThread(function()
	while true do
		SetPedMoveRateOverride(PlayerPedId(), movementSpeed)
		Citizen.Wait(0)
	end
end)


function duplicateItem(item, modifiers)
	local item2 = {}

	for k,v in pairs(item) do
		item2[k] = v
	end

	if modifiers ~= nil then
		for k,v in pairs(modifiers) do
			item2[k] = v
		end
	end

	return item2
end

function showInputDialog(name, title, cb)
        local dialog_flag = false
	local text = nil

	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), name, {
		title = title
	}, function(data3, menu3)
		text = data3.value
		dialog_flag = true
		menu3.close()

	end, function(data3, menu3)
		text = nil
		dialog_flag = true
		menu3.close()
	end)

	while not dialog_flag do
		Citizen.Wait(100)
	end

	return text
end

function GetWeaponConfig(name)
	name = name:upper()
	for i=1, #Config.Weapons, 1 do
		if name == Config.Weapons[i].name then
			return Config.Weapons[i]
		end
	end

	return nil
end

function registerItemAction(itemName, actionName, actionLabel, cb_use, cb_if)
	if itemActions[itemName] == nil then
		itemActions[itemName] = {}
	end

	local act = {}
	act.label = actionLabel
	act.cb = cb_use
	act.condition = cb_if

	itemActions[itemName][actionName] = act
end

function getItemActions(itemName)

	if itemActions[itemName] == nil then
		itemActions[itemName] = {}
	end

	local actions = itemActions[itemName]
	for k,v in pairs(itemActions["@shared"]) do actions[k] = v end

	return actions
end

function runItemAction(itemName, actionName, item)
	if actionName == "giveto" then
		return action_giveto(item)
	elseif actionName == "return" then
		return
	end

	if itemActions[itemName] == nil then
		print("runItemAction: Unknown item, name = "..itemName)
	elseif itemActions[itemName][actionName] == nil then
		print("runItemAction: Unknown action, name = "..itemName..", action = "..actionName)
	elseif itemActions[itemName][actionName].cb == nil then
		print("runItemAction: nil action callback, name = "..itemName..", action = "..actionName)
	end

	return itemActions[itemName][actionName].cb(item)
end

function action_giveto(item)
	local amount = item.amount

	if amount ~= nil and amount > 0 then
		TriggerServerEvent('esx_inventory:giveItemTo', "pocket", false, duplicateItem(item, { ["amount"] = amount }))
		TriggerEvent('esx_inventory:updateInventory', "pocket", false)
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local forward = GetEntityForwardVector(playerPed)
		TriggerServerEvent('esx_inventory:playerCoords', coords, forward)
	end
end)

RegisterNetEvent('esx_inventory:updateInventory')
AddEventHandler('esx_inventory:updateInventory', function(name, shared)
	ESX.TriggerServerCallback('esx_inventory:getInventory', function(inventory)
		TriggerEvent('esx_inventory:onInventoryUpdate', inventory)
	end, name, shared)
end)

RegisterNetEvent('esx_inventory:showInventoryMenu')
AddEventHandler('esx_inventory:showInventoryMenu', function(inventory)
--	TriggerEvent('chat:addMessage', { args = { '^1SYSTEM', json.encode(inventory) } })
--	inventory = _inventory
	showInventoryMenu(inventory)
end)

function inventoryAddMoneyItems(elements)
	local playerData = ESX.GetPlayerData()
	if playerData.money > 0 then
		local formattedMoney = _U('locale_currency', ESX.Math.GroupDigits(playerData.money))

		local item = {}
		item.name = 'money'
		item.extra = {}
		item.amount = playerData.money
		item.droppable = true

		table.insert(elements, {
			label     = ('%s: <span style="color:green;">%s</span>'):format(_U('cash'), formattedMoney),
			value     = item,
		})
	end

	for i=1, #playerData.accounts, 1 do
		if playerData.accounts[i].money > 0 then
			local formattedMoney = _U('locale_currency', ESX.Math.GroupDigits(playerData.accounts[i].money))

			local item = {}
			item.name = 'account_money'
			item.extra = {["account_name"] = playerData.accounts[i].name}

			if playerData.accounts[i].name == "black_money" then
				item.name = "black_money"
				item.extra = {}
			end

			item.amount = playerData.accounts[i].money
			item.droppable = playerData.accounts[i].name ~= 'bank'

			table.insert(elements, {
				label     = ('%s: <span style="color:green;">%s</span>'):format(playerData.accounts[i].label, formattedMoney),
				value     = item,
			})
		end
	end
end

function inventoryAddWeaponItems(elements)
	local playerPed = PlayerPedId()
	for i=1, #Config.Weapons, 1 do
		local weaponHash = GetHashKey(Config.Weapons[i].name)

		if HasPedGotWeapon(playerPed, weaponHash, false) and Config.Weapons[i].name ~= 'WEAPON_UNARMED' then
			local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)

			local item = {}
			item.name = 'equipped_weapon'
			item.extra = {["weapon_name"] = Config.Weapons[i].name, ["ammo"] = ammo, equipped = true}
			item.amount = 1
			item.droppable = false

			local elem_label = Config.Weapons[i].label .. ' [' .. ammo .. ']'.._U("inventory_status_equipped")
			if ammo == 0 then
				elem_label = Config.Weapons[i].label .. _U("inventory_status_equipped")
			end

			table.insert(elements, {
				label     = elem_label,
				value     = item,
			})
		end
	end
end

function inventoryAddESXItems(elements)
	local playerData = ESX.GetPlayerData()
	for i=1, #playerData.inventory, 1 do
		if playerData.inventory[i].count > 0 then
			local item = {}
			item.name = "esx_item"
			item.extra = {
				["name"]=playerData.inventory[i].name,
				["label"]=playerData.inventory[i].label,
				["usable"] = playerData.inventory[i].usable,
				["rare"] = playerData.inventory[i].rare,
				["canRemove"] = playerData.inventory[i].canRemove
			}
			item.amount = playerData.inventory[i].count
			item.droppable = playerData.inventory[i].canRemove

			table.insert(elements, {
				label     = playerData.inventory[i].label .. ' x' .. item.amount,
				value     = item,
			})
		end
	end
end

function showInventoryMenu(inventory)
	local elements = {}

	ESX.UI.Menu.CloseAll()

	if inventory == nil or inventory.items == nil then
		return
	end

	if inventory.name == "pocket" then
		inventoryAddMoneyItems(elements)
	end

	for k,v in pairs(inventory.items) do
		local itemlabel = v.name .. " [" .. v.amount .. "]"
		if v.name == "weapon" then
			itemlabel = _U(v.extra.weapon_name:lower())
			local amount_mod = ""
			if v.amount > 1 then
				amount_mod = " x" .. v.amount
			end

			if v.extra.ammo == 0 then
				itemlabel = itemlabel .. " [" .. v.amount .. "]"
			else
				itemlabel = itemlabel .. " [" .. v.extra.ammo .. amount_mod .. "]"
			end
		elseif v.name == "carkey" and v.extra.plate ~= nil then
			itemLabel = "Ключ от машины "..v.extra.plate
		end

		table.insert(elements, {
			label = itemlabel,
			value = v,
		})
	end

	if inventory.name == "pocket" then
		inventoryAddESXItems(elements)
		inventoryAddWeaponItems(elements)
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'inventory-menu',
	{
		title    = "Inventory",
		align    = 'bottom-right',
		elements = elements,
	}, function(data, menu)
		menu.close()
		Citizen.Wait(10)
		showInventoryItemMenu(inventory, data.current.value, data.current.label)
	end, function(data, menu)
		menu.close()
	end)

end

RegisterNetEvent('esx_inventory:unequipWeapon')
AddEventHandler('esx_inventory:unequipWeapon', function(weaponName, amount)
	local playerPed = PlayerPedId()
	local weaponHash = GetHashKey(weaponName)
	local current_ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
	local weapon_config = GetWeaponConfig(weaponName)

--	print("Unequip "..weaponName.." "..amount)

	if HasPedGotWeapon(playerPed, weaponHash, false) and current_ammo >= amount then
		if GetSelectedPedWeapon(playerPed) == weaponHash then
			SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"), true)
		end

		SetPedAmmo(playerPed, weaponHash, current_ammo - amount)
		RemoveWeaponFromPed(playerPed, weaponHash)

		TriggerServerEvent('esx_inventory:unequipWeapon', weaponName, amount, weapon_config)
	end
end)

RegisterNetEvent('esx_inventory:equipWeapon')
AddEventHandler('esx_inventory:equipWeapon', function(item)
	local weaponName = item.extra.weapon_name
	local playerPed = PlayerPedId()
	local weaponHash = GetHashKey(weaponName)

--	print("Equip "..weaponName.." "..item.extra.ammo)

	if HasPedGotWeapon(playerPed, weaponHash, false) then
		ESX.ShowNotification(_U('already_equipped'))
	else
		GiveWeaponToPed(playerPed, weaponHash, item.extra.ammo, false, true)
		TriggerEvent('esx_inventory:updateInventory', "pocket", false)
	end
end)

RegisterNetEvent('esx_inventory:showItemNotification')
AddEventHandler('esx_inventory:showItemNotification', function(add, label, count)
	ESX.UI.ShowInventoryItemNotification(add, {['label'] = label}, count)
end)

AddEventHandler("playerSpawned", function()
	TriggerServerEvent('esx_inventory:playerSpawned')
end)

RegisterNetEvent('esx_inventory:itemAction')
AddEventHandler('esx_inventory:itemAction', function(act)
	runItemAction(act.item.name, act.key, act.item)
end)

AddEventHandler('esx_inventory:registerItemAction', function(itemName, actionName, actionLabel, cb_action, cb_condition)
	return registerItemAction(itemName, actionName, actionLabel, cb_action, cb_condition)
end)


RegisterNetEvent('esx_inventory:getWeapons')
AddEventHandler('esx_inventory:getWeapons', function(cb)
	local weapons = {}
	local playerPed = PlayerPedId()
	for i=1, #Config.Weapons, 1 do
		local weaponHash = GetHashKey(Config.Weapons[i].name)

		if HasPedGotWeapon(playerPed, weaponHash, false) and Config.Weapons[i].name ~= 'WEAPON_UNARMED' then
			local weapon = {}
			weapon.name = Config.Weapons[i].name
			weapon.label = Config.Weapons[i].label
			weapon.weight = Config.Weapons[i].weight

			if weapon.weight == nil then
				weapon.weight = 1.0
			end

			weapon.hash = weaponHash
			weapon.ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
			weapon.melee = false

			local group = GetWeapontypeGroup(weaponHash)
			if group == -728555052 then
				weapon.melee = true
			end

			table.insert(weapons, weapon)
		end
	end
	cb(weapons)
end)

AddEventHandler('esx_inventory:initialized', function(cb)
	cb(true)
end)

RegisterNetEvent('esx_inventory:onInventoryUpdate')
AddEventHandler('esx_inventory:onInventoryUpdate', function(inventory)
	if inventory.name == "pocket" then
		pocketWeight = inventory.weight or 0
	end
end)
