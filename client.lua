Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local coords = GetEntityCoords(PlayerPedId())
        local traveltext = Config.TraveltextTOGuarma
        if (Vdist(coords.x, coords.y, coords.z, 2671.13, -1552.96, 46.47) < 2.0) then
            DrawTxt( traveltext, 0.50, 0.85, 0.7, 0.7, true, 255, 255, 255, 255, true)
            if IsControlJustReleased(0, 0x760A9C6F) then
                local player = PlayerPedId()
                TriggerServerEvent('wcrp:guarmaticketbuy')
                TriggerEvent("vorp:TipBottom", Config.TravelTiptextTO, 5000)
                FreezeEntityPosition(PlayerPedId(),true)
		Wait(5000)
                DoScreenFadeOut(5000)
                Wait(5000)
		FreezeEntityPosition(PlayerPedId(),false)
                SetEntityCoords(player, 1269.55, -6854.188, 43.318)
                Citizen.InvokeNative(0xA657EC9DBC6CC900, 1935063277) -- Native setting Minimap by hash, can be either Guarma or World
                Citizen.InvokeNative(0xE8770EE02AEE45C2, 1) -- Set Guarma Water Type
                Citizen.InvokeNative(0x74E2261D2A66849A, true) -- Set Guarma Horizon Status
		DoScreenFadeIn(4000)
                guarma = true
            end
        end
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local coords = GetEntityCoords(PlayerPedId())
    if (Vdist(coords.x, coords.y, coords.z, 1270.0314, -6854.6113, 43.4185) < 2.0) then
            DrawTxt( Config.TraveltextTOSD, 0.50, 0.85, 0.7, 0.7, true, 255, 255, 255, 255, true)
            if IsControlJustReleased(0, 0x760A9C6F) then
                local player = PlayerPedId()
                TriggerServerEvent('wcrp:guarmaticketbuy2')
                TriggerEvent("vorp:TipBottom", Config.TravelTiptextFROM, 5000)
		FreezeEntityPosition(PlayerPedId(),true)
		DoScreenFadeOut(5000)
                Wait(5000)
                Citizen.InvokeNative(0x74E2261D2A66849A, 0)
                Citizen.InvokeNative(0xA657EC9DBC6CC900, -1868977180)
                Citizen.InvokeNative(0xE8770EE02AEE45C2, 0)
                Wait(5000)
		FreezeEntityPosition(PlayerPedId(),false)
		SetEntityCoords(player, 2670.69, -1547.34, 46.47)
                DoScreenFadeIn(4000)
		guarma = false
            end
        end
    end
end)


function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str, Citizen.ResultAsLong())
   SetTextScale(w, h)
   SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
   SetTextCentre(centre)
   if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
   Citizen.InvokeNative(0xADA9255D, 10);
   DisplayText(str, x, y)
end
