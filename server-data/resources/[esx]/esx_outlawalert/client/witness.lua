--[[
function getPedsAround(alive_only)
    local handle, ped = FindFirstPed()
    local finished = false -- FindNextPed will turn the first variable to false when it fails to find another ped in the index
    local i = 1
    local result = {}

    repeat
        if not alive_only or not IsEntityDead(ped) then
                result[i] = ped
		i = i + 1
        end
        finished, ped = FindNextPed(handle) -- first param returns true while entities are found
    until not finished
    EndFindPed(handle)

    return result
end
]]--

-- flags=1 -- map only
function RaycastPeds(ped1, ped2, radius, flags)
	local pedCoords1 = GetEntityCoords(ped1)
	local pedCoords2 = GetEntityCoords(ped2)

	local rayHandle    = StartShapeTestCapsule(pedCoords1.x, pedCoords1.y, pedCoords1.z, pedCoords2.x, pedCoords2.y, pedCoords2.z, radius, flags, ped1, 0)

	local numRayHandle, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(rayHandle)

	if hit == 1 then
		return entityHit
	end

	return nil
end

function getWitness(sight_distance, hear_distance, outside_only)
	hear_distance = hear_distance or 0

	local player_ped = PlayerPedId()
	if outside_only and GetInteriorFromEntity(player_ped) ~= 0 then
		return nil
	end

	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	local peds = ESX.Game.GetPeds()
	local pedHear = nil

	local PED_TYPE_ANIMAL = 28

	for another_ped_id,another_ped in pairs(peds) do
		local ped_type = GetPedType(another_ped)
		-- only alive non-player, non-animal peds
		if player_ped ~= another_ped and not IsPedDeadOrDying(another_ped) and ped_type ~= PED_TYPE_ANIMAL and ped_type >= 4 and not IsPedInMeleeCombat(another_ped) and not IsPedAPlayer(another_ped) then

--			local ped_ammo_count = GetAmmoInPedWeapon(GetBestPedWeapon(another_ped,0)) --IsPedArmed(another_ped, 7)

			local c1 = GetEntityCoords(player_ped)
			local c2 = GetEntityCoords(another_ped)
			local dist = #(c1-c2)

			if dist < hear_distance then
				pedHear = another_ped
			end

			-- ped viewing angle is 160 degrees
			if IsPedFacingPed(another_ped, player_ped, 160.0) and dist <= sight_distance then

				local hit = RaycastPeds(player_ped, another_ped, 0.1, 1)
				if hit == nil then
					return another_ped, false
				end
			end
		end
	end

	if pedHear ~= nil then
		return pedHear, true
	end

	return nil, nil
end
