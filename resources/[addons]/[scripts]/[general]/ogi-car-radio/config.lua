Config = {}

Config.Framework = "ESX" -- Framework | types: ESX

Config.Language = 'EN' --[ 'EN' / 'PT' / 'SR' / 'PL' ]   You can add your own locales to Locales.lua, but be sure to update the Config.Language to match it.

-- default volume for the radio
Config.defaultRadioVolume = 0.2
-- max distance for the radio to be heard
-- distance is relative to the volume, so if you have a volume of 0.2 distance would be 0.2 * 50.0 = 10.0
Config.maxDistance = 50.0
-- distance for the sound to be heard for people in the vehicle where the sound is playing from, 
-- go above 50.0 or sound will not be heard on high speeds, 
-- Config.maxDistance is ignored when in vehicle from which the sound is playing
Config.soundDistanceInMusicVehicle = 100.0

function isYoutubeUrl(url)
    return string.match(url, "^https?://www%.youtube%.com/watch%?v=.-$") ~= nil or string.match(url, "^https?://youtu%.be/.-$") ~= nil
end

function get_keys(t)
    local keys={}
    for key,_ in pairs(t) do
        table.insert(keys, key)
    end
    return keys
end

function get_key_for_value(t, value) -- should change this
    for k,v in pairs(t) do
        if v==value then return k end
    end
    return nil
end

function contains(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end