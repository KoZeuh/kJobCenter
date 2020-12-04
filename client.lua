ESX                     = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('ESX:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

------------ Création du Menu / Sous Menu -----------

RMenu.Add('emploi', 'main', RageUI.CreateMenu("", "Bureau des emplois"))

Citizen.CreateThread(function()
    while true do
        RageUI.IsVisible(RMenu:Get('emploi', 'main'), true, true, true, function()
            for k,v in pairs(Config.Jobs) do
                RageUI.Button(v.nameButton, "Une fois le métier signé veuillez vous référer à votre GPS pour votre lieu de travail.", {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('kozeuh_emploi:setJob', v.job)  
                        TriggerEvent('ESX:showAdvancedNotification', 'Contrat', 'Signature confirmée.✅👨‍🌾', '', 'CHAR_MP_MEX_DOCKS', 2)
                        PlaySoundFrontend(-1, "Pin_Good", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
                        if v.waypoint then
                            SetNewWaypoint(v.coords) -- coordonnées du point gps
                            RageUI.CloseAll()
                        end
                    end
                end)
            end
        end, function()
        end, 1)
            Citizen.Wait(0)
        end
    end)
    
Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
    
            for k,v in pairs(Config.PosMenu) do
    
                local CoordsPlay = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(CoordsPlay.x, CoordsPlay.y, CoordsPlay.z, v)
    
                if dist <= 1.5 then

                   RageUI.Text({
                        message = "[~b~E~w~] pour intéragir avec le secrétaire",
                        time_display = 1
                    })
                    if IsControlJustPressed(1,51) then
                        RageUI.Visible(RMenu:Get('emploi', 'main'), not RageUI.Visible(RMenu:Get('emploi', 'main')))
                    end
                end
            end
        end
end)

Citizen.CreateThread(function()
	for i=1, #Config.PosMenu, 1 do
		Locblip = Config.PosMenu[i]

		local blip = AddBlipForCoord(Locblip)
		SetBlipSprite(blip, 407)
		SetBlipScale  (blip, 0.8)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString("Job Center")
		EndTextCommandSetBlipName(blip)
	end
end)