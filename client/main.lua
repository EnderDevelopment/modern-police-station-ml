-- Main client script for the police station

-- Variables
local policeStation = {
    name = "Modern Police Station",
    coords = vector3(441.7, -982.0, 30.6),
    interior = 281857,
    blip = nil
}

-- Create blip for the police station
function createPoliceStationBlip()
    policeStation.blip = AddBlipForCoord(policeStation.coords.x, policeStation.coords.y, policeStation.coords.z)
    SetBlipSprite(policeStation.blip, 60)
    SetBlipDisplay(policeStation.blip, 4)
    SetBlipScale(policeStation.blip, 0.8)
    SetBlipColour(policeStation.blip, 3)
    SetBlipAsShortRange(policeStation.blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(policeStation.name)
    EndTextCommandSetBlipName(policeStation.blip)
end

-- Teleport player to the police station
function teleportToPoliceStation()
    local playerPed = PlayerPedId()
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(0)
    end
    SetEntityCoords(playerPed, policeStation.coords.x, policeStation.coords.y, policeStation.coords.z)
    SetEntityHeading(playerPed, 0.0)
    Wait(1000)
    DoScreenFadeIn(500)
end

-- Main thread
Citizen.CreateThread(function()
    createPoliceStationBlip()
    
    -- Register command to teleport to the police station
    RegisterCommand("gotops", function()
        teleportToPoliceStation()
    end, false)
end)
