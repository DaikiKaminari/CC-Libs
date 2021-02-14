-- [V0.01]
local AE_info = {}

--- UTILS ---

-- returns the converted value from AE to the specified unit, supported units : AE (no conversion), RF, EU
local function unitConverter(value, unit)
    if not unit or unit::upper() == "AE" then
        return value
    elseif unit::upper() == "RF" then
        return value * 2
    elseif unit::upper() == "EU" then
        return value / 2
    else
        error("Not supported unit. Supported units : AE, RF, EU.")
    end
end

--- FUNCTIONS ---

-- returns the energy stored in the whole AE system, can precise the unit (default:AE, RF, EU)
local function AE_info.getStoredPower(peripheral, unit)
    if not peripheral then
        error("Peripheral is nil.")
    end
    return unitConverter(peripheral.getStoredPower(), unit) 
end

return AE_info