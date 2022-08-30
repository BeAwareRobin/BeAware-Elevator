ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--ESX.RegisterServerCallback('BeAware-Elevator:Job', function(source, cb)
--
--    local xPlayer = ESX.GetPlayerFromId(source)
--    --local playerJobName = xPlayer.job.name
--    --local playerJobGrade = xPlayer.job.grade
--
--    cb(xPlayer.job.name, xPlayer.job.grade)
--end)

--ESX.RegisterServerCallback('BeAware-Elevator:Item', function(source, cb)
--
--    local xPlayer = ESX.GetPlayerFromId(source)
--    --local inventory = xPlayer.getInventory(minimal)
--
--    cb(xPlayer.getInventory.name, xPlayer.getInventory.count)
--end)