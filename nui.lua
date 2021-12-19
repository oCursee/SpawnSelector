local display = false
local spawnSelected = false

RegisterNetEvent('SpawnPlayer')
AddEventHandler('SpawnPlayer', function() 
    Wait(1500)
    DoScreenFadeOut(0)
    local ped = PlayerPedId()
    FreezeEntityPosition(ped, true)
    SetEntityCoords(ped, -73.54, -818.83, 326.16)
    DoScreenFadeIn(250)
    SetDisplay(not display)  
end)

RegisterNUICallback("exit", function(data)
    FreezeEntityPosition(PlayerPedId(), false)
    SetDisplay(false)
end)

RegisterNUICallback("main", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("legion", function()
    CheckAndTeleport(vector3(190.98, -850.67, 31.13))
end)

RegisterNUICallback("pier", function()
    CheckAndTeleport(vector3(-1607.64, -971.87, 13.02))
end)

RegisterNUICallback("arena", function()
    CheckAndTeleport(vector3(-270.14, -1919.85, 29.95))
end)

RegisterNUICallback("mirror", function()
    CheckAndTeleport(vector3(1125.26, -645.88, 56.72))
end)

RegisterNUICallback("sandy", function()
    SetEntityCoords(PlayerPedId(), 1782.05, 3334.44, 41.13)
end)

RegisterNUICallback("error", function(data)
    chat(data.error, {255,0,0})
    SetDisplay(false)
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
            
        DisableControlAction(0, 1, display)
        DisableControlAction(0, 2, display) 
        DisableControlAction(0, 142, display) 
        DisableControlAction(0, 18, display) 
        DisableControlAction(0, 322, display) 
        DisableControlAction(0, 106, display) 
    end
end)

function CheckAndTeleport(coords)
    if not spawnSelected then -- If it's the first time the player choose his spawn (prevents NUI abuse)
        SetEntityCoords(PlayerPedId(), coords)
        SetDisplay(false)
        spawnSelected = true -- set is as selected
    end
end

function chat(str, color)
    TriggerEvent("chat:addMessage",
    {
        color = color,
        multiline = true,
        args = {str}
    })
end
