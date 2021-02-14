local AE_info = require("AE_info.lua")
local ae = peripheral.wrap("back")

print("--- TEST getStoredPower ---")
print(AE_info.AE_info.getStoredPower(ae))
print(AE_info.AE_info.getStoredPower(ae, "AE"))
print(AE_info.AE_info.getStoredPower(ae, "EU"))
print(AE_info.AE_info.getStoredPower(ae, "RF"))

print("\nAll tests of AE_info.lua passed without error.")