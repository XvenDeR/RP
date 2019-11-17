ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('duty:onoff')
AddEventHandler('duty:onoff', function(job)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.name
    local grade = xPlayer.job.grade
    local identity = xPlayer.getSessionVar("identity")
    local plname = GetPlayerName(_source)
    if identity ~= nil then
        plname = identity.firstname .. " " .. identity.lastname
    end

    if job == 'police' or job == 'ambulance' or job == 'taxi' or job == 'mechanic' or job == 'mechanic-bennys' then
        xPlayer.setJob('off' ..job, grade)
        TriggerClientEvent('esx:showNotification', _source, _U('offduty'))
        TriggerClientEvent('esx_duty:dutyOff', -1, plname, job)
    elseif job == 'offpolice' then
        xPlayer.setJob('police', grade)
        TriggerClientEvent('esx:showNotification', _source, _U('onduty'))
        TriggerClientEvent('esx_duty:dutyOn', -1, plname, 'police')
    elseif job == 'offambulance' then
        xPlayer.setJob('ambulance', grade)
        TriggerClientEvent('esx:showNotification', _source, _U('onduty'))
        TriggerClientEvent('esx_duty:dutyOn', -1, plname, 'ambulance')
    elseif job == 'offtaxi' then
        xPlayer.setJob('taxi', grade)
        TriggerClientEvent('esx:showNotification', _source, _U('onduty'))
        TriggerClientEvent('esx_duty:dutyOn', -1, plname, 'taxi')
    elseif job == 'offmechanic' then
        xPlayer.setJob('mechanic', grade)
        TriggerClientEvent('esx:showNotification', _source, _U('onduty'))
        TriggerClientEvent('esx_duty:dutyOn', -1, plname, 'mechanic')
    elseif job == 'offmechanic-bennys' then
        xPlayer.setJob('mechanic-bennys', grade)
        TriggerClientEvent('esx:showNotification', _source, _U('onduty'))
        TriggerClientEvent('esx_duty:dutyOn', -1, plname, 'mechanic-bennys')
    end

end)
