local function clampDensity(value, fallback)
    local number = tonumber(value)

    if number == nil then
        return fallback
    end

    if number < 0.0 then
        return 0.0
    end

    if number > 1.0 then
        return 1.0
    end

    return number
end

local settings = {
    traffic = clampDensity(Config.TrafficDensity, 0.0),
    ped = clampDensity(Config.PedDensity, 0.0),
}

local trafficFullyDisabled = settings.traffic <= 0.0
local pedFullyDisabled = settings.ped <= 0.0

local function logDebugSettings()
    print(('[rs-ai-controler] Traffic density: %.2f'):format(settings.traffic))
    print(('[rs-ai-controler] Ped density: %.2f'):format(settings.ped))
    print(('[rs-ai-controler] Traffic fully disabled: %s'):format(trafficFullyDisabled and 'true' or 'false'))
    print(('[rs-ai-controler] Peds fully disabled: %s'):format(pedFullyDisabled and 'true' or 'false'))
end

local function drawDebugLine(x, y, scale, text)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(scale, scale)
    SetTextColour(255, 255, 255, 215)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextOutline()
    SetTextEntry('STRING')
    AddTextComponentString(text)
    DrawText(x, y)
end

if Config.Debug == true then
    logDebugSettings()
end

CreateThread(function()
    while true do
        SetVehicleDensityMultiplierThisFrame(settings.traffic)
        SetParkedVehicleDensityMultiplierThisFrame(settings.traffic)
        SetRandomVehicleDensityMultiplierThisFrame(settings.traffic)
        SetPedDensityMultiplierThisFrame(settings.ped)
        SetScenarioPedDensityMultiplierThisFrame(settings.ped, settings.ped)

        if trafficFullyDisabled then
            SetVehiclePopulationBudget(0)
            SetGarbageTrucks(false)
            SetRandomBoats(false)
            SetCreateRandomCops(false)
            SetCreateRandomCopsOnScenarios(false)
            SetCreateRandomCopsNotOnScenarios(false)
        end

        if pedFullyDisabled then
            SetPedPopulationBudget(0)
        end

        if Config.Debug == true then
            drawDebugLine(0.015, 0.700, 0.32, ('RS AI Controler | TrafficDensity: %.2f'):format(settings.traffic))
            drawDebugLine(0.015, 0.725, 0.32, ('PedDensity: %.2f'):format(settings.ped))
            drawDebugLine(0.015, 0.750, 0.32, ('Traffic disabled: %s'):format(trafficFullyDisabled and 'true' or 'false'))
            drawDebugLine(0.015, 0.775, 0.32, ('Peds disabled: %s'):format(pedFullyDisabled and 'true' or 'false'))
        end

        Wait(0)
    end
end)
