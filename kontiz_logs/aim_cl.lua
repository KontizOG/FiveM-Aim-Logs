ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerServerEvent('esx:getShareObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local ped = PlayerPedId()
        if IsPedArmed(ped, 4) then
            local boolean, targetPed = GetEntityPlayerIsFreeAimingAt(PlayerId())
            if boolean and targetPed ~= nil then
                if DoesEntityExist(targetPed) and IsEntityAPed(targetPed) then
                    local targetIdentifier = NetworkGetPlayerIndexFromPed(targetPed)
                    if targetIdentifier then
                        local pedIdentifier = GetPlayerServerId(targetIdentifier)
                        if pedIdentifier > 0 then
                            TriggerServerEvent('KontizAim', pedIdentifier)
                        end
                    end
                end
            end
        end
    end
end)