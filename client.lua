function drawSpeedometer(kmh)
    if kmh < 1 then kmh = 0 end
    SetTextFont(2)
    SetTextProportional(0)
    SetTextOutline()
    SetTextScale(1.5, 1.5)
    SetTextEntry("STRING")
    AddTextComponentString(getSpeedColor(kmh)..kmh.." KMH")
    DrawText(0.45, 0.91)
end

function getSpeedColor(kmh)
    if kmh < 50 then
        return "~g~"
    end
    if kmh >= 50 and kmh < 100 then
        return "~y~"
    end
    if kmh >= 100 then
        return "~r~"
    end
end

Citizen.CreateThread(function()
    while true do
        if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
            local getKmh = (GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6)
            drawSpeedometer(math.floor(getKmh))
        end
        Citizen.Wait(1)
    end

end)