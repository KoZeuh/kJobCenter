ESX              = nil
local PlayerData = {}

TriggerEvent('ESX:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('kozeuh_emploi:setJob')
AddEventHandler('kozeuh_emploi:setJob', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.setJob(job, 0)	-- a changé, si le job s'apelle "miner" dans la bdd et bah tu mets ça et le 0 c'est le grade
end)