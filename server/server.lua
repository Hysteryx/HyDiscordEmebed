print("SCRIPT FOR DEV, command not restricted")

RegisterNetEvent("HyDevTools:SendCoords")
AddEventHandler("HyDevTools:SendCoords", function(coords, head)
    local _src = source 
    local name = GetPlayerName(_src)
    local steam = GetPlayerIdentifier(_src,0)

    local embeds = {
        {
            ["title"] = config.webhookTitle,
            ["color"] = config.webhookColor,
            --["type"]="rich",
            ["footer"]=  {
                ["text"]= "💻 Github.com/Hysteryx",
           },
           ["fields"] = {
                {
                    ["name"] = config.webhookText,
                    ["value"] = "x : "..coords.x.."\ny : "..coords.y.."\nz : "..coords.z,
                },
                {
                    ["name"] = config.webhookText2,
                    ["value"] = tostring(head),
                },
                {
                    ["name"] = "Vector3",
                    ["value"] = "vector3("..coords.x..","..coords.y..","..coords.z..")"
                }
            },
        },
    }

    PerformHttpRequest(config.webhookURL, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = config.img}), { ['Content-Type'] = 'application/json' })
end)

