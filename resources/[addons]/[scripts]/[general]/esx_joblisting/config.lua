Config = {}

Config.Debug = ESX.GetConfig().EnableDebug

Config.Locale = GetConvar('esx:locale', 'en')

Config.Zone = vector3(-265.08, -964.1, 31.3)

Config.Blip = {
  Enabled = true,
  Sprite = 408,
  Display = 4,
  Scale = 0.8,
  Colour = 37,
  ShortRange = true
}
