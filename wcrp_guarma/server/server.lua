local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

RegisterServerEvent('wcrp:guarmaticketbuy')
AddEventHandler("wcrp:guarmaticketbuy", function()
    local _source = source
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    Character.removeCurrency(0, Config.PricetoGuarma)
    TriggerClientEvent("vorp:TipBottom", _source, 'You purchase a ticket and Embark to Guarma', 5000)
        
end)

RegisterServerEvent('wcrp:guarmaticketbuy2')
AddEventHandler("wcrp:guarmaticketbuy2", function()
    local _source = source
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter
    Character.removeCurrency(0, Config.PricetoSD)
    TriggerClientEvent("vorp:TipBottom", _source, 'You use the ticket stub to Embark to Saint Denis', 5000)
        
end)
