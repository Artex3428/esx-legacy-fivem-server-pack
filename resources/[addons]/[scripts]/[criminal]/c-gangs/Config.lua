Config = {}

Config.webhook = ''

-- Version check
Config.Version = 1.4

-- Menu config
Config.Align = 'right'

-- Options Config
Config.EnableGangShop = true
Config.EnablePersonalGangInfo = true
Config.EnableCloakrooms = true
Config.EnableStash = true

-- Triggers

Config.Triggers = { -- Change triggers :)
    LoadSkin = 'skinchanger:loadSkin',
    PlayerOutfit = 'illenium-appearance:getPlayerOutfit',
    GetPSkin = 'skinchanger:getSkin',
    OpenBossMenu = 'esx_society:openBossMenu'
}

Config.Gangs = {
    ['Mafia'] = {
        Job = 'mafia',
        Society_Name = 'mafia',
        Boss = vec3(-12.47007274627685, -1435.1082763671875, 31.10155296325683),
        Cloakrooms = vec3(-17.67955780029297, -1432.1644287109375, 31.1015567779541),
        Stash = vec3(-9.14001178741455, -1435.1466064453125, 31.10156059265136),
        GangInfo = vec3(-8.97991180419921, -1440.9112548828125, 31.1015510559082),
        ItemShopCoords = vec3(-12.33154487609863, -1429.3016357421875, 31.10147094726562),
        ItemShop = {
            {label = 'Mafia key', value = 'key_mafia'}
        },
    }
}
