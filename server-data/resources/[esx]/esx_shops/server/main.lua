ESX             = nil
local ShopItems = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- AddEventHandler('onResourceStart', function(resource)
-- 	if resource == GetCurrentResourceName() then
-- 		Citizen.Wait(3000)

-- 	MySQL.Async.fetchAll('SELECT * FROM shops LEFT JOIN items ON items.name = shops.item', {}, function(shopResult)
-- 		for i=1, #shopResult, 1 do
-- 			if shopResult[i].name then
-- 				if ShopItems[shopResult[i].store] == nil then
-- 					ShopItems[shopResult[i].store] = {}
-- 				end

-- 				if shopResult[i].limit == -1 then
-- 					shopResult[i].limit = 30
-- 				end

-- 				table.insert(ShopItems[shopResult[i].store], {
-- 					label = shopResult[i].label,
-- 					item  = shopResult[i].item,
-- 					price = shopResult[i].price,
-- 					limit = shopResult[i].limit
-- 				})
-- 			else
-- 				print(('esx_shops: invalid item "%s" found!'):format(shopResult[i].item))
-- 			end
-- 		end
-- 	end)
-- 	end
-- end)


MySQL.ready(function()
	MySQL.Async.fetchAll('SELECT * FROM shops LEFT JOIN items ON items.name = shops.item', {}, function(shopResult)
		for i=1, #shopResult, 1 do
			if shopResult[i].name then
				if ShopItems[shopResult[i].store] == nil then
					ShopItems[shopResult[i].store] = {}
				end

				if shopResult[i].limit == -1 then
					shopResult[i].limit = 30
				end

				table.insert(ShopItems[shopResult[i].store], {
					label = shopResult[i].label,
					item  = shopResult[i].item,
					price = shopResult[i].price,
					limit = shopResult[i].limit
				})
			else
				print(('esx_shops: invalid item "%s" found!'):format(shopResult[i].item))
			end
		end
	end)
end)

ESX.RegisterServerCallback('esx_shops:requestDBItems', function(source, cb)
	cb(ShopItems)
end)

RegisterServerEvent('esx_shops:buyItem')
AddEventHandler('esx_shops:buyItem', function(itemName, amount, zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	amount = ESX.Math.Round(amount)

	-- is the player trying to exploit?
	if amount < 0 then
		print('esx_shops: ' .. xPlayer.identifier .. ' attempted to exploit the shop!')
		return
	end

	-- get price
	local price = 0
	local itemLabel = ''

	for i=1, #ShopItems[zone], 1 do
		if ShopItems[zone][i].item == itemName then
			price = ShopItems[zone][i].price
			itemLabel = ShopItems[zone][i].label
			break
		end
	end

	price = price * amount

	-- can the player carry the said amount of x item?
	if sourceItem.limit ~= -1 and (sourceItem.count + amount) > sourceItem.limit then
		TriggerClientEvent('esx:showNotification', _source, _U('player_cannot_hold'))
		return
	end

	-- can the player afford this item?
	TriggerEvent('esx_atm:pay', xPlayer.source, "shops", price, function(res)
		if res then
			xPlayer.addInventoryItem(itemName, amount)
			TriggerClientEvent('esx:showNotification', _source, _U('bought', amount, itemLabel, ESX.Math.GroupDigits(price)))
		else
			local missingMoney = price - xPlayer.getMoney()
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough', ESX.Math.GroupDigits(missingMoney)))
		end
	end)
end)
