cfg = {
    deformationMultiplier = -1, 		 -- How much should the vehicle visually deform from a collision. Range 0.0 to 10.0 Where 0.0 is no deformation and 10.0 is 10x deformation. -1 = Don't touch. Visual damage does not sync well to other players.
    deformationExponent = 0.4,  		 -- How much should the handling file deformation setting be compressed toward 1.0. (Make cars more similar). A value of 1=no change. Lower values will compress more, values above 1 it will expand. Dont set to zero or negative.
    collisionDamageExponent = 0.15,      -- How much should the handling file deformation setting be compressed toward 1.0. (Make cars more similar). A value of 1=no change. Lower values will compress more, values above 1 it will expand. Dont set to zero or negative.
    damageFactorEngine = 2.5,            -- Sane values are 1 to 100. Higher values means more damage to vehicle. A good starting point is 10
    damageFactorBody = 2.5,              -- Sane values are 1 to 100. Higher values means more damage to vehicle. A good starting point is 10
    damageFactorPetrolTank = 16.0,       -- Sane values are 1 to 200. Higher values means more damage to vehicle. A good starting point is 64
    engineDamageExponent = 0.15,         -- How much should the handling file engine damage setting be compressed toward 1.0. (Make cars more similar). A value of 1=no change. Lower values will compress more, values above 1 it will expand. Dont set to zero or negative.
    weaponsDamageMultiplier = 0.005,     -- How much damage should the vehicle get from weapons fire. Range 0.0 to 10.0, where 0.0 is no damage and 10.0 is 10x damage. -1 = don't touch
    degradingHealthSpeedFactor = 2.5,    -- Speed of slowly degrading health, but not failure. Value of 10 means that it will take about 0.25 second per health point, so degradation from 800 to 305 will take about 2 minutes of clean driving. Higher values means faster degradation
    cascadingFailureSpeedFactor = 2.0,   -- Sane values are 1 to 100. When vehicle health drops below a certain point, cascading failure sets in, and the health drops rapidly until the vehicle dies. Higher values means faster failure. A good starting point is 8
    degradingFailureThreshold = 200.0,   -- Below this value, slow health degradation will set in
    cascadingFailureThreshold = 80.0,    -- Below this value, health cascading failure will set in
    engineSafeGuard = 25.0,              -- Final failure value. Set it too high, and the vehicle won't smoke when disabled. Set too low, and the car will catch fire from a single bullet to the engine. At health 100 a typical car can take 3-4 bullets to the engine before catching fire.
    torqueMultiplierEnabled = true,      -- Decrease engine torque as engine gets more and more damaged
    limpMode = false,                    -- If true, the engine never fails completely, so you will always be able to get to a mechanic unless you flip your vehicle and preventVehicleFlip is set to true
    limpModeMultiplier = 0.075,          -- The torque multiplier to use when vehicle is limping. Sane values are 0.05 to 0.25
    preventVehicleFlip = true,           -- If true, you can't turn over an upside down vehicle
    sundayDriver = false,                -- If true, the accelerator response is scaled to enable easy slow driving. Will not prevent full throttle. Does not work with binary accelerators like a keyboard. Set to false to disable. The included stop-without-reversing and brake-light-hold feature does also work for keyboards.
    sundayDriverAcceleratorCurve = 7.5,  -- The response curve to apply to the accelerator. Range 0.0 to 10.0. Higher values enables easier slow driving, meaning more pressure on the throttle is required to accelerate forward. Does nothing for keyboard drivers
    sundayDriverBrakeCurve = 2.5,        -- The response curve to apply to the Brake. Range 0.0 to 10.0. Higher values enables easier braking, meaning more pressure on the throttle is required to brake hard. Does nothing for keyboard drivers
    displayBlips = false,                -- Show blips for mechanics locations
    compatibilityMode = false,           -- prevents other scripts from modifying the fuel tank health to avoid random engine failure with BVA 2.01 (Downside is it disabled explosion prevention)
    randomTireBurstInterval = 0,         -- Number of minutes (statistically, not precisely) to drive above 22 mph before you get a tire puncture. 0=feature is disabled

    classDamageMultiplier = {
        [0] =   1.0,        --  0: Compacts
                1.0,        --  1: Sedans
                1.0,        --  2: SUVs
                1.0,        --  3: Coupes
                1.0,        --  4: Muscle
                1.0,        --  5: Sports Classics
                1.0,        --  6: Sports
                1.0,        --  7: Super
                0.25,       --  8: Motorcycles
                0.7,        --  9: Off-road
                0.25,       --  10: Industrial
                1.0,        --  11: Utility
                1.0,        --  12: Vans
                1.0,        --  13: Cycles
                0.5,        --  14: Boats
                1.0,        --  15: Helicopters
                1.0,        --  16: Planes
                1.0,        --  17: Service
                0.75,       --  18: Emergency
                0.75,       --  19: Military
                1.0,        --  20: Commercia
                1.0         --  21: Trains
    }
}

local pedInSameVehicleLast=false
local vehicle
local lastVehicle
local vehicleClass
local fCollisionDamageMult = 0.0
local fDeformationDamageMult = 0.0
local fEngineDamageMult = 0.0
local fBrakeForce = 1.0
local isBrakingForward = false
local isBrakingReverse = false
local healthEngineLast = 1000.0
local healthEngineCurrent = 1000.0
local healthEngineNew = 1000.0
local healthEngineDelta = 0.0
local healthEngineDeltaScaled = 0.0
local healthBodyLast = 1000.0
local healthBodyCurrent = 1000.0
local healthBodyNew = 1000.0
local healthBodyDelta = 0.0
local healthBodyDeltaScaled = 0.0
local healthPetrolTankLast = 1000.0
local healthPetrolTankCurrent = 1000.0
local healthPetrolTankNew = 1000.0
local healthPetrolTankDelta = 0.0
local healthPetrolTankDeltaScaled = 0.0
local tireBurstLuckyNumber

math.randomseed(GetGameTimer());

local tireBurstMaxNumber = cfg.randomTireBurstInterval * 1200;

if cfg.randomTireBurstInterval ~= 0 then tireBurstLuckyNumber = math.random(tireBurstMaxNumber) end

local function isPedDrivingAVehicle()
    local ped = GetPlayerPed(-1)
    vehicle = GetVehiclePedIsIn(ped, false)
    if IsPedInAnyVehicle(ped, false) then
        if GetPedInVehicleSeat(vehicle, -1) == ped then
            local class = GetVehicleClass(vehicle)
            if class ~= 15 and class ~= 16 and class ~=21 and class ~=13 then
                return true
            end
        end
    end
    return false
end

local function fscale(inputValue, originalMin, originalMax, newBegin, newEnd, curve)
    local OriginalRange = 0.0
    local NewRange = 0.0
    local zeroRefCurVal = 0.0
    local normalizedCurVal = 0.0
    local rangedValue = 0.0
    local invFlag = 0
    if (curve > 10.0) then curve = 10.0 end
    if (curve < -10.0) then curve = -10.0 end
    curve = (curve * -.1)
    curve = 10.0 ^ curve
    if (inputValue < originalMin) then
    inputValue = originalMin
    end
    if inputValue > originalMax then
    inputValue = originalMax
    end
    OriginalRange = originalMax - originalMin
    if (newEnd > newBegin) then
        NewRange = newEnd - newBegin
    else
    NewRange = newBegin - newEnd
    invFlag = 1
    end
    zeroRefCurVal = inputValue - originalMin
    normalizedCurVal  =  zeroRefCurVal / OriginalRange
    if (originalMin > originalMax ) then
    return 0
    end
    if (invFlag == 0) then
        rangedValue =  ((normalizedCurVal ^ curve) * NewRange) + newBegin
    else
        rangedValue =  newBegin - ((normalizedCurVal ^ curve) * NewRange)
    end
    return rangedValue
end

if cfg.torqueMultiplierEnabled or cfg.preventVehicleFlip or cfg.limpMode then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            if cfg.torqueMultiplierEnabled or cfg.sundayDriver or cfg.limpMode then
                if pedInSameVehicleLast then
                    local factor = 1.0
                    if cfg.torqueMultiplierEnabled and healthEngineNew < 900 then
                        factor = (healthEngineNew+200.0) / 1100
                    end
                    if cfg.sundayDriver and GetVehicleClass(vehicle) ~= 14 then
                        local accelerator = GetControlValue(2,71)
                        local brake = GetControlValue(2,72)
                        local speed = GetEntitySpeedVector(vehicle, true)['y']
                        local brk = fBrakeForce
                        if speed >= 1.0 then
                            if accelerator > 127 then
                                local acc = fscale(accelerator, 127.0, 254.0, 0.1, 1.0, 10.0-(cfg.sundayDriverAcceleratorCurve*2.0))
                                factor = factor * acc
                            end
                            if brake > 127 then
                                isBrakingForward = true
                                brk = fscale(brake, 127.0, 254.0, 0.01, fBrakeForce, 10.0-(cfg.sundayDriverBrakeCurve*2.0))
                            end
                        elseif speed <= -1.0 then
                            if brake > 127 then
                                local rev = fscale(brake, 127.0, 254.0, 0.1, 1.0, 10.0-(cfg.sundayDriverAcceleratorCurve*2.0))
                                factor = factor * rev
                            end
                            if accelerator > 127 then
                                isBrakingReverse = true
                                brk = fscale(accelerator, 127.0, 254.0, 0.01, fBrakeForce, 10.0-(cfg.sundayDriverBrakeCurve*2.0))
                            end
                        else
                            local entitySpeed = GetEntitySpeed(vehicle)
                            if entitySpeed < 1 then
                                if isBrakingForward == true then
                                    DisableControlAction(2,72,true)
                                    SetVehicleForwardSpeed(vehicle,speed*0.98)
                                    SetVehicleBrakeLights(vehicle,true)
                                end
                                if isBrakingReverse == true then
                                    DisableControlAction(2,71,true)
                                    SetVehicleForwardSpeed(vehicle,speed*0.98)
                                    SetVehicleBrakeLights(vehicle,true)
                                end
                                if isBrakingForward == true and GetDisabledControlNormal(2,72) == 0 then
                                    isBrakingForward=false
                                end
                                if isBrakingReverse == true and GetDisabledControlNormal(2,71) == 0 then
                                    isBrakingReverse=false
                                end
                            end
                        end
                        if brk > fBrakeForce - 0.02 then brk = fBrakeForce end
                        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fBrakeForce', brk)
                    end
                    if cfg.limpMode == true and healthEngineNew < cfg.engineSafeGuard + 5 then
                        factor = cfg.limpModeMultiplier
                    end
                    SetVehicleEngineTorqueMultiplier(vehicle, factor)
                end
            end
            if cfg.preventVehicleFlip then
                local roll = GetEntityRoll(vehicle)
                if (roll > 75.0 or roll < -75.0) and GetEntitySpeed(vehicle) < 2 then
                    DisableControlAction(2,59,true)
                    DisableControlAction(2,60,true)
                end
            end
        end
    end)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local ped = GetPlayerPed(-1)
        if isPedDrivingAVehicle() then
            vehicle = GetVehiclePedIsIn(ped, false)
            vehicleClass = GetVehicleClass(vehicle)
            healthEngineCurrent = GetVehicleEngineHealth(vehicle)
            if healthEngineCurrent == 1000 then healthEngineLast = 1000.0 end
            healthEngineNew = healthEngineCurrent
            healthEngineDelta = healthEngineLast - healthEngineCurrent
            healthEngineDeltaScaled = healthEngineDelta * cfg.damageFactorEngine * cfg.classDamageMultiplier[vehicleClass]
            healthBodyCurrent = GetVehicleBodyHealth(vehicle)
            if healthBodyCurrent == 1000 then healthBodyLast = 1000.0 end
            healthBodyNew = healthBodyCurrent
            healthBodyDelta = healthBodyLast - healthBodyCurrent
            healthBodyDeltaScaled = healthBodyDelta * cfg.damageFactorBody * cfg.classDamageMultiplier[vehicleClass]
            healthPetrolTankCurrent = GetVehiclePetrolTankHealth(vehicle)
            if cfg.compatibilityMode and healthPetrolTankCurrent < 1 then
                healthPetrolTankLast = healthPetrolTankCurrent
            end
            if healthPetrolTankCurrent == 1000 then healthPetrolTankLast = 1000.0 end
            healthPetrolTankNew = healthPetrolTankCurrent
            healthPetrolTankDelta = healthPetrolTankLast-healthPetrolTankCurrent
            healthPetrolTankDeltaScaled = healthPetrolTankDelta * cfg.damageFactorPetrolTank * cfg.classDamageMultiplier[vehicleClass]
            if healthEngineCurrent > cfg.engineSafeGuard+1 then
                SetVehicleUndriveable(vehicle,false)
            end
            if healthEngineCurrent <= cfg.engineSafeGuard+1 and cfg.limpMode == false then
                SetVehicleUndriveable(vehicle,true)
            end
            if vehicle ~= lastVehicle then
                pedInSameVehicleLast = false
            end
            if pedInSameVehicleLast == true then
                if healthEngineCurrent ~= 1000.0 or healthBodyCurrent ~= 1000.0 or healthPetrolTankCurrent ~= 1000.0 then
                    local healthEngineCombinedDelta = math.max(healthEngineDeltaScaled, healthBodyDeltaScaled, healthPetrolTankDeltaScaled)
                    if healthEngineCombinedDelta > (healthEngineCurrent - cfg.engineSafeGuard) then
                        healthEngineCombinedDelta = healthEngineCombinedDelta * 0.7
                    end
                    if healthEngineCombinedDelta > healthEngineCurrent then
                        healthEngineCombinedDelta = healthEngineCurrent - (cfg.cascadingFailureThreshold / 5)
                    end
                    healthEngineNew = healthEngineLast - healthEngineCombinedDelta
                    if healthEngineNew > (cfg.cascadingFailureThreshold + 5) and healthEngineNew < cfg.degradingFailureThreshold then
                        healthEngineNew = healthEngineNew-(0.038 * cfg.degradingHealthSpeedFactor)
                    end
                    if healthEngineNew < cfg.cascadingFailureThreshold then
                        healthEngineNew = healthEngineNew-(0.1 * cfg.cascadingFailureSpeedFactor)
                    end
                    if healthEngineNew < cfg.engineSafeGuard then
                        healthEngineNew = cfg.engineSafeGuard
                    end
                    if cfg.compatibilityMode == false and healthPetrolTankCurrent < 750 then
                        healthPetrolTankNew = 750.0
                    end
                    if healthBodyNew < 0  then
                        healthBodyNew = 0.0
                    end
                end
            else
                fDeformationDamageMult = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fDeformationDamageMult')
                fBrakeForce = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fBrakeForce')
                local newFDeformationDamageMult = fDeformationDamageMult ^ cfg.deformationExponent
                if cfg.deformationMultiplier ~= -1 then SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fDeformationDamageMult', newFDeformationDamageMult * cfg.deformationMultiplier) end
                if cfg.weaponsDamageMultiplier ~= -1 then SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fWeaponDamageMult', cfg.weaponsDamageMultiplier/cfg.damageFactorBody) end
                fCollisionDamageMult = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fCollisionDamageMult')
                local newFCollisionDamageMultiplier = fCollisionDamageMult ^ cfg.collisionDamageExponent
                SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fCollisionDamageMult', newFCollisionDamageMultiplier)
                fEngineDamageMult = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fEngineDamageMult')
                local newFEngineDamageMult = fEngineDamageMult ^ cfg.engineDamageExponent
                SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fEngineDamageMult', newFEngineDamageMult)
                if healthBodyCurrent < cfg.cascadingFailureThreshold then
                    healthBodyNew = cfg.cascadingFailureThreshold
                end
                pedInSameVehicleLast = true
            end
            if healthEngineNew ~= healthEngineCurrent then
                SetVehicleEngineHealth(vehicle, healthEngineNew)
            end
            if healthBodyNew ~= healthBodyCurrent then SetVehicleBodyHealth(vehicle, healthBodyNew) end
            if healthPetrolTankNew ~= healthPetrolTankCurrent then SetVehiclePetrolTankHealth(vehicle, healthPetrolTankNew) end
            healthEngineLast = healthEngineNew
            healthBodyLast = healthBodyNew
            healthPetrolTankLast = healthPetrolTankNew
            lastVehicle=vehicle
            if cfg.randomTireBurstInterval ~= 0 and GetEntitySpeed(vehicle) > 10 then tireBurstLottery() end
        else
            if pedInSameVehicleLast == true then
                lastVehicle = GetVehiclePedIsIn(ped, true)              
                if cfg.deformationMultiplier ~= -1 then SetVehicleHandlingFloat(lastVehicle, 'CHandlingData', 'fDeformationDamageMult', fDeformationDamageMult) end
                SetVehicleHandlingFloat(lastVehicle, 'CHandlingData', 'fBrakeForce', fBrakeForce)
                if cfg.weaponsDamageMultiplier ~= -1 then SetVehicleHandlingFloat(lastVehicle, 'CHandlingData', 'fWeaponDamageMult', cfg.weaponsDamageMultiplier) end
                SetVehicleHandlingFloat(lastVehicle, 'CHandlingData', 'fCollisionDamageMult', fCollisionDamageMult)
                SetVehicleHandlingFloat(lastVehicle, 'CHandlingData', 'fEngineDamageMult', fEngineDamageMult)
            end
            pedInSameVehicleLast = false
        end
    end
end)