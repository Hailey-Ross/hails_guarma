local VorpCore = {}
local Debug = Config.Debug  --Debugging Variable

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

RegisterServerEvent('wcrp:guarmaticketbuy')
AddEventHandler("wcrp:guarmaticketbuy", function()
    local User = VorpCore.getUser(source)
    local _source = source
    local Character = User.getUsedCharacter
    local _ticket = Config.PricetoGuarma
    Character.removeCurrency(0, _ticket)
    if Debug == true then print("Player paid " .. _ticket .. " to go to Guarma") end
end)

RegisterServerEvent('wcrp:guarmaticketbuy2')
AddEventHandler("wcrp:guarmaticketbuy2", function()
    local User = VorpCore.getUser(source)
    local _source = source
    local Character = User.getUsedCharacter
    local _ticket = Config.PricetoSD
    Character.removeCurrency(0, _ticket)
    if Debug == true then print("Player paid " .. _ticket .. " to return from Guarma") end
end)
