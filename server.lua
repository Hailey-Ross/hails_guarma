local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

RegisterServerEvent('wcrp:guarmaticketbuy')
AddEventHandler("wcrp:guarmaticketbuy", function()
    local User = VorpCore.getUser(source)
    local _source = source
    local Character = User.getUsedCharacter
    Character.removeCurrency(0, Config.PricetoGuarma)
end)

RegisterServerEvent('wcrp:guarmaticketbuy2')
AddEventHandler("wcrp:guarmaticketbuy2", function()
    local User = VorpCore.getUser(source)
    local _source = source
    local Character = User.getUsedCharacter
    Character.removeCurrency(0, Config.PricetoSD)
end)
