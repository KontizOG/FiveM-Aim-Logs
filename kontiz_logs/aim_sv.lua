ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local text = "ΤΟ ΤΕΧΤ ΠΟΥ ΘΕΣ" --OPTIONAL
local url = "TO IMAGE ΠΟΥ ΘΕΣ" --OPTIONAL
local webhook = "TO WEBHOOK ΠΟΥ ΘΕΣ"

--@Author/Kontiz
RegisterServerEvent('KontizAim')
AddEventHandler('KontizAim', function(pedIdentifier)
    local _source = source
    local attackerName = GetPlayerName(_source)
    local victimName = GetPlayerName(pedIdentifier)
    local time = os.date('%Y-%m-%d %H:%M')
    local description = {
        {
            ["color"] = "63471",
            ["title"] = "**" ..attackerName.. "  is aiming  " ..victimName.."**",
            ["description"] = "📋**DESCRIPTION**\n\n🕵🏻‍♂️**Player[ATTACKER]**: "..attackerName.."\n 🕵🏻‍♂️**Player[VICTIM]** : "..victimName.."\n 🕐**Time [HAPPENED]**: "..time.."",
	        ["footer"] = {
                ["text"] = text,
                ["icon_url"] = url,
            },
        }
    }    

PerformHttpRequest(webhook, function (err, text, headers) end, 'POST', json.encode({username = text, embeds = description}), { ['Content-Type'] = 'application/json' })
end)
