local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

--[[ TODO: Make it so you can't go into a negative balance from either transaction ]]
RegisterServerEvent('wcrp:guarmaticketbuy')
AddEventHandler("wcrp:guarmaticketbuy", function()
    local User = VorpCore.getUser(source)
    local _source = source
    local Character = User.getUsedCharacter
    local _ticket = Config.PricetoGuarma
    Character.removeCurrency(0, _ticket)

end)

RegisterServerEvent('wcrp:guarmaticketbuy2')
AddEventHandler("wcrp:guarmaticketbuy2", function()
    local User = VorpCore.getUser(source)
    local _source = source
    local Character = User.getUsedCharacter
    local _ticket = Config.PricetoSD
    Character.removeCurrency(0, _ticket)

end)
