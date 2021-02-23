function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
  end


Citizen.CreateThread(function()
    Citizen.Wait(1)
    while true do
        Citizen.Wait(1)
          if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 458.30987548828,-979.40728759766,30.689308166504) > 4 then
            DrawMarker(25,458.30987548828,-979.40728759766,30.689308166504-1, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5001, 83, 255, 87, 200, 0, 1, 0, 1)
          else
            DrawMarker(25,458.30987548828,-979.40728759766,30.689308166504-1, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5001, 83, 255, 87, 200, 0, 1, 0, 1)
            DrawText3Ds(458.30987548828,-979.40728759766,30.689308166504+0.2, "Tryk ~r~[E]~s~ For at sætte attachments på dine våben")
            if IsControlJustPressed(1, 38) then
                TriggerServerEvent('marcus:attachments')
            end
        end
    end
end)

RegisterNetEvent('attachmentspaa')
AddEventHandler('attachmentspaa', function()
  local ped = GetPlayerPed(-1)
  local currentWeapon = GetSelectedPedWeapon(ped)
  if currentWeapon == GetHashKey("WEAPON_COMBATPISTOL") then
      GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH")) -- Flashlight
  elseif currentWeapon == GetHashKey("WEAPON_SMG") then
      GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_SCOPE_MACRO_02")) -- Scope
      GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_AR_FLSH")) -- Flashlight
  elseif currentWeapon == GetHashKey("WEAPON_CARBINERIFLE") then
      GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH")) -- Flashlight
      GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM")) -- Scope
      GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP")) -- Grip
  elseif currentWeapon == GetHashKey("WEAPON_PUMPSHOTGUN") then
      GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH")) -- Flashlight
  elseif currentWeapon == GetHashKey("WEAPON_HEAVYSNIPER") then
      GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER"), GetHashKey("COMPONENT_AT_SCOPE_MAX")) -- Scope
  elseif currentWeapon == GetHashKey("WEAPON_UNARMED") then
    TriggerEvent("pNotify:SendNotification", source,{text = "Du skal holde et våben", type = "error", queue = "global", timeout = 8000, layout = "BottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
  end
end)
