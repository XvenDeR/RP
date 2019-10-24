-- ESX = nil
-- local shopItems = {}

-- TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- MySQL.ready(function()

-- 	MySQL.Async.fetchAll('SELECT * FROM weashops', {}, function(result)
-- 		for i=1, #result, 1 do
-- 			if shopItems[result[i].zone] == nil then
-- 				shopItems[result[i].zone] = {}
-- 			end

-- 			table.insert(shopItems[result[i].zone], {
-- 				item  = result[i].item,
-- 				price = result[i].price,
-- 				label = ESX.GetWeaponLabel(result[i].item)
-- 			})
-- 		end

-- 		TriggerClientEvent('esx_weaponshop:sendShop', -1, shopItems)
-- 	end)

-- end)

-- ESX.RegisterServerCallback('esx_weaponshop:getShop', function(source, cb)
-- 	cb(shopItems)
-- end)

-- ESX.RegisterServerCallback('esx_weaponshop:buyLicense', function(source, cb)
-- 	local xPlayer = ESX.GetPlayerFromId(source)

-- 	if xPlayer.getMoney() >= Config.LicensePrice then
-- 		xPlayer.removeMoney(Config.LicensePrice)

-- 		TriggerEvent('esx_license:addLicense', source, 'weapon', function()
-- 			cb(true)
-- 		end)
-- 	else
-- 		TriggerClientEvent('esx:showNotification', source, _U('not_enough'))
-- 		cb(false)
-- 	end
-- end)

-- ESX.RegisterServerCallback('esx_weaponshop:buyWeapon', function(source, cb, weaponName, zone)
-- 	local xPlayer = ESX.GetPlayerFromId(source)
-- 	local price = GetPrice(weaponName, zone)

-- 	if price == 0 then
-- 		print(('esx_weaponshop: %s attempted to buy a unknown weapon!'):format(xPlayer.identifier))
-- 		cb(false)
-- 	end

-- 	if xPlayer.hasWeapon(weaponName) then
-- 		TriggerClientEvent('esx:showNotification', source, _U('already_owned'))
-- 		cb(false)
-- 	else
-- 		if zone == 'BlackWeashop' then

-- 			if xPlayer.getAccount('black_money').money >= price then
-- 				xPlayer.removeAccountMoney('black_money', price)
-- 				xPlayer.addWeapon(weaponName, 42)

-- 				cb(true)
-- 			else
-- 				TriggerClientEvent('esx:showNotification', source, _U('not_enough_black'))
-- 				cb(false)
-- 			end

-- 		else

-- 			if xPlayer.getMoney() >= price then
-- 				xPlayer.removeMoney(price)
-- 				xPlayer.addWeapon(weaponName, 42)

-- 				cb(true)
-- 			else
-- 				TriggerClientEvent('esx:showNotification', source, _U('not_enough'))
-- 				cb(false)
-- 			end

-- 		end
-- 	end
-- end)

-- function GetPrice(weaponName, zone)
-- 	local price = MySQL.Sync.fetchScalar('SELECT price FROM weashops WHERE zone = @zone AND item = @item', {
-- 		['@zone'] = zone,
-- 		['@item'] = weaponName
-- 	})

-- 	if price then
-- 		return price
-- 	else
-- 		return 0
-- 	end
-- end
ESX               = nil
local ItemsLabels = {}
local GunShopPrice = Config.EnableClip.GunShop.Price
local GunShopLabel = Config.EnableClip.GunShop.Label
local BlackWeashopPrice = Config.EnableClip.BlackWeashop.Price
local BlackWeashopLabel = Config.EnableClip.BlackWeashop.Label

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function LoadLicenses (source)
  TriggerEvent('esx_license:getLicenses', source, function (licenses)
    TriggerClientEvent('esx_weashop:loadLicenses', source, licenses)
  end)
end

if Config.EnableLicense == true then
  AddEventHandler('esx:playerLoaded', function (source)
    LoadLicenses(source)
  end)
end

RegisterServerEvent('esx_weashop:buyLicense')
AddEventHandler('esx_weashop:buyLicense', function ()
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_atm:pay', _source, "weaponshop", Config.LicensePrice, function(res)
    if res then
      TriggerEvent('esx_license:addLicense', _source, 'weapon', function ()
          LoadLicenses(_source)
      end)
    else
      TriggerClientEvent('esx:showNotification', _source, _U('not_enough'))
    end
  end)
end)


ESX.RegisterServerCallback('esx_weashop:requestDBItems', function(source, cb)

  MySQL.Async.fetchAll(
    'SELECT * FROM weashops',
    {},
    function(result)
      local shopItems  = {}

      for i=1, #result, 1 do

        if shopItems[result[i].zone] == nil then
          shopItems[result[i].zone] = {}
        end

        table.insert(shopItems[result[i].zone], {
          name  = result[i].item,
          price = result[i].price,
          label = ESX.GetWeaponLabel(result[i].item)
        })
      end

	  if Config.EnableClipGunShop == true then
		table.insert(shopItems["GunShop"], {
          name  = "clip",
          price = GunShopPrice,--Config.EnableClip.GunShop.Price,
          label = GunShopLabel--Config.EnableClip.GunShop.label
        })
		end

		if Config.EnableClipGunShop == true then
		table.insert(shopItems["BlackWeashop"], {
          name  = "clip",
          price = BlackWeashopPrice,--Config.EnableClip.BlackWeashop.Price,
          label = BlackWeashopLabel--Config.EnableClip.BlackWeashop.label
        })
		end
      cb(shopItems)

    end
  )

end)


RegisterServerEvent('esx_weashop:buyItem')
AddEventHandler('esx_weashop:buyItem', function(itemName, price, zone)

  local _source = source
  local xPlayer  = ESX.GetPlayerFromId(source)
  local account = xPlayer.getAccount('black_money')

  if zone=="BlackWeashop" then
    if account.money >= price then
		if itemName == "clip" then
			xPlayer.addInventoryItem(itemName, 1)
			TriggerClientEvent('esx:showNotification', _source, _U('buy') .. "chargeur")
		else
			xPlayer.addWeapon(itemName, 42)
			TriggerClientEvent('esx:showNotification', _source, _U('buy') .. ESX.GetWeaponLabel(itemName))
		end
		xPlayer.removeAccountMoney('black_money', price)
	else
		TriggerClientEvent('esx:showNotification', _source, _U('not_enough_black'))
	end

  else
	TriggerEvent('esx_atm:pay', _source, "weaponshop", price, function(res)
		if res then
			if itemName == "clip" then
				xPlayer.addInventoryItem(itemName, 1)
				TriggerClientEvent('esx:showNotification', _source, _U('buy') .. "chargeur")
			else
				xPlayer.addWeapon(itemName, 42)
				TriggerClientEvent('esx:showNotification', _source, _U('buy') .. ESX.GetWeaponLabel(itemName))
			end
		else
			TriggerClientEvent('esx:showNotification', _source, _U('not_enough'))
		end
	end)
  end

end)

-- thx to Pandorina for script
RegisterServerEvent('esx_weashop:remove')
AddEventHandler('esx_weashop:remove', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('clip', 1)
end)

ESX.RegisterUsableItem('clip', function(source)
	TriggerClientEvent('esx_weashop:clipcli', source)
end)
