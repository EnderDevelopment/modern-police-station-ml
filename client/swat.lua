-- SWAT section script

-- Variables
local swatSection = {
    name = "SWAT Section",
    coords = vector3(441.7, -982.0, 30.6),
    interior = 281858,
    blip = nil
}

-- Create blip for the SWAT section
function createSwatBlip()
    swatSection.blip = AddBlipForCoord(swatSection.coords.x, swatSection.coords.y, swatSection.coords.z)
    SetBlipSprite(swatSection.blip, 60)
    SetBlipDisplay(swatSection.blip, 4)
    SetBlipScale(swatSection.blip, 0.8)
    SetBlipColour(swatSection.blip, 1)
    SetBlipAsShortRange(swatSection.blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(swatSection.name)
    EndTextCommandSetBlipName(swatSection.blip)
end

-- Teleport player to the SWAT section
function teleportToSwatSection()
    local playerPed = PlayerPedId()
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(0)
    end
    SetEntityCoords(playerPed, swatSection.coords.x, swatSection.coords.y, swatSection.coords.z)
    SetEntityHeading(playerPed, 0.0)
    Wait(1000)
    DoScreenFadeIn(500)
end

-- Main thread
Citizen.CreateThread(function()
    createSwatBlip()
    
    -- Register command to teleport to the SWAT section
    RegisterCommand("gotoswat", function()
        teleportToSwatSection()
    end, false)
end)
