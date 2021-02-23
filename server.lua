local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "marcus_attachments")


RegisterServerEvent('marcus:attachments')
AddEventHandler('marcus:attachments', function()
    local source = source
    local user_id = vRP.getUserId({source})
    if vRP.hasGroup({user_id,"Politi-Job"}) then
        TriggerClientEvent("attachmentspaa", source)
    else
        TriggerClientEvent("pNotify:SendNotification", source,{text = "Dette har du ikke adgang til.", type = "error", queue = "global", timeout = 8000, layout = "BottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
    end
end)