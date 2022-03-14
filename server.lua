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
    if Character.money < Config.PricetoGuarma then
        TriggerClientEvent("vorp:TipBottom", _source, Config.NoMoney, 4000)
        return
    end

    Character.removeCurrency(0, Config.PricetoGuarma)
end)

RegisterServerEvent('wcrp:guarmaticketbuy2')
AddEventHandler("wcrp:guarmaticketbuy2", function()
    local User = VorpCore.getUser(source)
    local _source = source
    local Character = User.getUsedCharacter
    if Character.money < Config.PricetoSD then
        TriggerClientEvent("vorp:TipBottom", _source, Config.NoMoney, 4000)
        return
    end

    Character.removeCurrency(0, Config.PricetoSD)
end)
