print("/!\ SCRIPT FOR DEV, command not restricted")

function notif(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(text)
    DrawNotification(true,false)
end 

RegisterCommand(config.commandName, function()
    local ped = PlayerPedId()
    TriggerServerEvent("HyDevTools:SendCoords", GetEntityCoords(ped),GetEntityHeading(ped))
    notif(config.notif)
end,false)
