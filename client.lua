local Debug = Config.debug
local Floor = Config.SeedFloor
local Ceiling = Config.SeedCeiling
local MasterCeiling = Ceiling + Ceiling  --Create maximum
local testsuccess, result = pcall(os.time) --Time Module Test Call
local ctestsuccess, crypto = pcall(require, "crypto") --Crypto Module Test Call
local seed = math.random(Floor,Ceiling) + math.random(Floor,Ceiling) * math.random(1,3) - math.random(Floor,MasterCeiling) -- Default Seed Generation ALL BUILT IN LUA
local time --Empty Time Variable

if ctestsuccess and testsuccess then --IF we have Crypto and Time pass their tests, use both for Seed Generation
	time = os.time() % 100000
	seed = crypto.rng() * (Ceiling - Floor) + time + math.random(Floor,Ceiling) + math.random(Floor,Ceiling) * math.random(1,3) - math.random(Floor,MasterCeiling)
        math.randomseed(seed)
            if Debug == true then print("Crypto Module PASSED Test."); print("os.time PASSED Test. Result: " .. result); print("Resulting SEED: " ..seed) end
elseif ctestsuccess then --IF only crypto passes, use that for seed generation
	seed = crypto.rng() * (Ceiling - Floor) + math.random(Floor,Ceiling) + math.random(Floor,Ceiling) * math.random(1,3) - math.random(Floor,MasterCeiling)
        math.randomseed(seed)
            if Debug == true then print("Crypto Module PASSED Test."); print("os.time FAILED Test. Result: " .. result); print("Resulting SEED: " ..seed) end
elseif testsuccess then --IF only time passes its test then use that for seed generation
	time = os.time() % 100000
	seed = time + math.random(Floor,Ceiling) + math.random(Floor,Ceiling) * math.random(1,3) - math.random(Floor,MasterCeiling)
        math.randomseed(seed)
            if Debug == true then print("Crypto Module FAILED Test."); print("os.time PASSED Test. Result: " .. result); print("Resulting SEED: " ..seed) end
else --IF All else fails then fall back on default seed generation, pure psuedo-random gneration
        math.randomseed(seed)
	    if Debug == true then print("Crypto Module FAILED Test."); print("os.time FAILED Test. Result: " .. result); print("Resulting SEED: " ..seed) end
end

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(1)
	local coords = GetEntityCoords(PlayerPedId())
        local traveltext = Config.TraveltextTOGuarma
        local diceroll = math.random(1,5)
        local diceroll2 = math.random(1,5)
        local diceroll3 = math.random(1,5)
        local diceroll4 = math.random(1,5)
        local diceroll5 = math.random(1,5)
        local spawnroll = diceroll + diceroll2 + diceroll3 + diceroll4 + diceroll5
        if (Vdist(coords.x, coords.y, coords.z, 2671.13, -1552.96, 46.47) < 2.0) then
            DrawTxt( traveltext, 0.50, 0.85, 0.7, 0.5, true, 255, 255, 255, 255, true)
            if IsControlJustReleased(0, 0x760A9C6F) then
                local player = PlayerPedId()
                local Ped = PlayerPedId()
                if Config.debug == true then print("Pre-roll 1: "..diceroll); print("Pre-roll 2: "..diceroll2); print("Pre-roll 3: "..diceroll3); print("Pre-roll 4: "..diceroll4); print("Pre-roll 5: "..diceroll5); print("Roll Math: "..diceroll.." + "..diceroll2.." + "..diceroll3.." + "..diceroll4.." + "..diceroll5) end
                TriggerServerEvent('wcrp:guarmaticketbuy')
                TriggerEvent("vorp:TipBottom", Config.TravelTiptextTO, 5000)
                FreezeEntityPosition(Ped,true) -- Freeze person
                if Config.transitions == true then ExecuteCommand('hud'); DoScreenFadeOut(3000) end
                Wait(3000)
                SetEntityCoords(Ped, 2524.167, -1839.067, 44.93) -- Boat Transition area
                if Config.transitions == true then DoScreenFadeIn(500); Citizen.InvokeNative(0x1E5B70E53DB661E5, 0, 0, 0, 'Guarma', 'El Bahia Del Paz', 'Your boat is sailing. .') end
                Citizen.InvokeNative(0xA657EC9DBC6CC900, 1935063277) -- Native setting Minimap by hash, can be either Guarma or World
                Citizen.InvokeNative(0xE8770EE02AEE45C2, 1) -- Set Guarma Water Type
                Citizen.InvokeNative(0x74E2261D2A66849A, true) -- Set Guarma Horizon Status
                Wait(20000)
                if spawnroll == 5 then
                    if Config.debug == true then print("Section: 5"); print("Final Roll: "..spawnroll) end
                    SetEntityCoords(Ped, 1269.325, -6851.982, 43.168)
                elseif spawnroll >= 6 and spawnroll <= 9 then
                    if Config.debug == true then print("Section: 6-9"); print("Final Roll: "..spawnroll) end
                    SetEntityCoords(Ped, 1269.55, -6854.188, 43.168)
                elseif spawnroll >= 10 and spawnroll <= 15 then
                    if Config.debug == true then print("Section: 10-15"); print("Final Roll: "..spawnroll) end
                    SetEntityCoords(Ped, 1269.724, -6855.1577, 43.168)
                elseif spawnroll >= 16 and spawnroll <= 20 then
                    if Config.debug == true then print("Section: 16-20"); print("Final Roll: "..spawnroll) end
                    SetEntityCoords(Ped, 1270.245, -6854.557, 43.168)
                elseif spawnroll >= 21 and spawnroll <= 25 then
                    if Config.debug == true then print("Section: 21-25"); print("Final Roll: "..spawnroll) end
                    SetEntityCoords(Ped, 1265.973, -6854.015, 43.168)
                else
                    if Config.debug == true then print("Error: No Category within range"); print("Final Roll: "..spawnroll) end
                    SetEntityCoords(Ped, 1270.34, -6857.038, 43.168)
                end
                FreezeEntityPosition(Ped,false) -- Unfreeze person
                if Config.transitions == true then DoScreenFadeOut(1000); Wait(900); ShutdownLoadingScreen(); Wait(500); DoScreenFadeIn(4000); ExecuteCommand('hud') end
                guarma = true
            end
        end
    end
end)

Citizen.CreateThread(function() -- TP Back from Guarma
	while true do
	Citizen.Wait(1)
	local coords = GetEntityCoords(PlayerPedId())
        local diceroll = math.random(1,5)
        local diceroll2 = math.random(1,5)
        local diceroll3 = math.random(1,5)
        local diceroll4 = math.random(1,5)
        local diceroll5 = math.random(1,5)
        local spawnroll = diceroll + diceroll2 + diceroll3 + diceroll4 + diceroll5
    if (Vdist(coords.x, coords.y, coords.z, 1265.8421, -6852.1635, 43.4185) < 2.0) then
            DrawTxt( Config.TraveltextTOSD, 0.50, 0.85, 0.7, 0.5, true, 255, 255, 255, 255, true)
            if IsControlJustReleased(0, 0x760A9C6F) then
                local player = PlayerPedId()
                local Ped = PlayerPedId()
                if Config.debug == true then print("Pre-roll 1: "..diceroll); print("Pre-roll 2: "..diceroll2); print("Pre-roll 3: "..diceroll3); print("Pre-roll 4: "..diceroll4); print("Pre-roll 5: "..diceroll5); print("Roll Math: "..diceroll.." + "..diceroll2.." + "..diceroll3.." + "..diceroll4.." + "..diceroll5) end
                TriggerServerEvent('wcrp:guarmaticketbuy2')
                TriggerEvent("vorp:TipBottom", Config.TravelTiptextFROM, 5000)
                if Config.transitions == true then ExecuteCommand('hud') end
                if Config.transitions == true then DoScreenFadeOut(3000) end
		FreezeEntityPosition(Ped,true)
                Wait(3000)
                if Config.transitions == true then DoScreenFadeIn(500); Citizen.InvokeNative(0x1E5B70E53DB661E5, 0, 0, 0, 'Mainland', 'Saint Denis Harbor', 'Feeling refreshed. .') end
                Citizen.InvokeNative(0x74E2261D2A66849A, 0)
                Citizen.InvokeNative(0xA657EC9DBC6CC900, -1868977180)
                Citizen.InvokeNative(0xE8770EE02AEE45C2, 0)
                SetEntityCoords(Ped, 2534.975, -1835.944, 41.93) -- Boat Transition Area
                Wait(20000)
                --Wait(2000)
                if spawnroll == 5 then
                    if Config.debug == true then print("Section: 5"); print("Final Roll: "..spawnroll) end
                    SetEntityCoords(Ped, 2670.69, -1547.34, 45.819)
                elseif spawnroll >= 6 and spawnroll <= 9 then
                    if Config.debug == true then print("Section: 6-9"); print("Final Roll: "..spawnroll) end
                    SetEntityCoords(Ped, 2673.952, -1547.87, 45.819)
                elseif spawnroll >= 10 and spawnroll <= 15 then
                    if Config.debug == true then print("Section: 10-15"); print("Final Roll: "..spawnroll) end
                    SetEntityCoords(Ped, 2670.850, -1550.013, 45.819)
                elseif spawnroll >= 16 and spawnroll <= 20 then
                    if Config.debug == true then print("Section: 16-20"); print("Final Roll: "..spawnroll) end
                    SetEntityCoords(Ped, 2668.939, -1545.1269, 45.819)
                elseif spawnroll >= 21 and spawnroll <= 25 then
                    if Config.debug == true then print("Section: 21-25"): print("Final Roll: "..spawnroll) end
                    SetEntityCoords(Ped, 2674.150, -1544.462, 45.819)
                else
                    if Config.debug == true then print("Error: No Category within range"): print("Final Roll: "..spawnroll) end
                    SetEntityCoords(Ped, 2665.937, -1554.36, 45.522)
                end
                if Config.transitions == true then DoScreenFadeIn(4000); ShutdownLoadingScreen() end
                FreezeEntityPosition(Ped,false)
                Wait(1000)
                if Config.transitions == true then ExecuteCommand('hud') end
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
