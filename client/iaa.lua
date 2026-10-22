-- IAA section script

-- Variables
local iaaSection = {
    name = "Internal Affairs Agency",
    coords = vector3(441.7, -982.0, 30.6),
    interior = 281859,
    blip = nil
}

-- Create blip for the IAA section
function createIaaBlip()
    iaaSection.blip = AddBlipForCoord(iaaSection.coords.x, iaaSection.coords.y, iaaSection.coords.z)
    SetBlipSprite(iaaSection.blip, 60)
    SetBlipDisplay(iaaSection.blip, 4)
    SetBlipScale(iaaSection.blip, 0.8)
    SetBlipColour(iaaSection.blip, 2)
    SetBlipAsShortRange(iaaSection.blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(iaaSection.name)
    EndTextCommandSetBlipName(iaaSection.blip)
end

-- Teleport player to the IAA section
function teleportToIaaSection()
    local playerPed = PlayerPedId()
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(0)
    end
    SetEntityCoords(playerPed, iaaSection.coords.x, iaaSection.coords.y, iaaSection.coords.z)
    SetEntityHeading(playerPed, 0.0)
    Wait(1000)
    DoScreenFadeIn(500)
end

-- Main thread
Citizen.CreateThread(function()
    createIaaBlip()
    
    -- Register command to teleport to the IAA section
    RegisterCommand("gotoiaa", function()
        teleportToIaaSection()
    end, false)
end)
