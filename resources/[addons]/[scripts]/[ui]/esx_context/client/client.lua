local activeMenu
IsMenuOpen = false
-- local Debug = ESX.GetConfig().EnableDebug
local Debug = true

-- Global functions
-- [ Post | Open | Closed ]

function Post(fn, ...)
    SendNUIMessage({
        func = fn,
        args = { ... },
    })
end

function Open(position, eles, onSelect, onClose, canClose)
    IsMenuOpen = true
    SetNuiFocus(true, true)
    if Config.AbleToMove then
        SetNuiFocusKeepInput(true)
    end

    if Config.CenterCursor then
        local boxX = 0.85  -- X-coordinate for the center (0.0 - 1.0)
        local boxY = 0.5  -- Y-coordinate for the center (0.0 - 1.0)
        SetCursorLocation(boxX, boxY)
    end
    local canCloseMenu = canClose == nil and true or canClose
    activeMenu = {
        position = position,
        eles = eles,
        canClose = canCloseMenu,
        onSelect = onSelect,
        onClose = onClose,
    }

    LocalPlayer.state:set("context:active", true)

    Post("Open", eles, position)
end

function Closed()
    SetNuiFocus(false, false)
    if Config.AbleToMove then
        SetNuiFocusKeepInput(false)
    end

    local menu = activeMenu
    local cb = menu.onClose

    activeMenu = nil


    LocalPlayer.state:set("context:active", false)

    if cb then
        cb(menu)
    end

    Citizen.Wait(250)
    IsMenuOpen = false
end

-- Exports
-- [ Preview | Open | Close ]

exports("Preview", Open)

exports("Open", function(...)
    Open(...)
end)

exports("Close", function()
    if not activeMenu then
        return
    end

    Post("Closed")

    Closed()
end)



Citizen.CreateThread(function ()
    while true do
        Wait(0)
        if IsMenuOpen then
            DisableControlAction(0, 1,    true) -- LookLeftRight
			DisableControlAction(0, 2,    true) -- LookUpDown
			DisableControlAction(0, 25,   true) -- Input Aim
			DisableControlAction(0, 106,  true) -- Vehicle Mouse Control Override

			DisableControlAction(0, 24,   true) -- Input Attack
			DisableControlAction(0, 140,  true) -- Melee Attack Alternate
			DisableControlAction(0, 141,  true) -- Melee Attack Alternate
			DisableControlAction(0, 142,  true) -- Melee Attack Alternate
			DisableControlAction(0, 257,  true) -- Input Attack 2
			DisableControlAction(0, 263,  true) -- Input Melee Attack
			DisableControlAction(0, 264,  true) -- Input Melee Attack 2

			DisableControlAction(0, 12,   true) -- Weapon Wheel Up Down
			DisableControlAction(0, 14,   true) -- Weapon Wheel Next
			DisableControlAction(0, 15,   true) -- Weapon Wheel Prev
			DisableControlAction(0, 16,   true) -- Select Next Weapon
			DisableControlAction(0, 17,   true) -- Select Prev Weapon

            DisableControlAction(0, 85, true) -- INPUT_VEH_RADIO_WHEEL (Wheel open/close)
            DisableControlAction(0, 86, true) -- INPUT_VEH_RADIO_WHEEL_NEXT (Wheel next)
            DisableControlAction(0, 87, true) -- INPUT_VEH_RADIO_WHEEL_PREV (Wheel previous)
            DisableControlAction(0, 81, true) -- INPUT_VEH_NEXT_RADIO (Next station)
            DisableControlAction(0, 82, true) -- INPUT_VEH_PREV_RADIO (Previous station)
            DisableControlAction(0, 202, true) -- INPUT_FRONTEND_CANCEL (Cancel menu)

            DisableControlAction(0, 199,   true) -- P
            DisableControlAction(0, 200,   true) -- ESC
        end
    end
end)

exports("Refresh", function(eles, position)
    if not activeMenu then
        return
    end

    activeMenu.eles = eles or activeMenu.eles
    activeMenu.position = position or activeMenu.position

    Post("Open", activeMenu.eles, activeMenu.position)
end)

-- NUI Callbacks
-- [ closed | selected | changed ]

RegisterNUICallback("closed", function(_, cb)
    if not activeMenu or (activeMenu and not activeMenu.canClose) then
        return cb(false)
    end
    cb(true)
    Closed()
end)

RegisterNUICallback("selected", function(data, cb)
    if not activeMenu or not activeMenu.onSelect or not data.index then
        return
    end
    local index = tonumber(data.index)
    local ele = activeMenu.eles[index]

    if not ele or ele.input then
        return
    end

    activeMenu:onSelect(ele)
    if cb then
        cb("ok")
    end
end)

RegisterNUICallback("changed", function(data, cb)
    if not activeMenu or not data.index or not data.value then
        return
    end

    local index = tonumber(data.index)
    local ele = activeMenu.eles[index]

    if not ele or not ele.input then
        return
    end

    if ele.inputType == "number" then
        ele.inputValue = tonumber(data.value)

        if ele.inputMin then
            ele.inputValue = math.max(ele.inputMin, ele.inputValue)
        end

        if ele.inputMax then
            ele.inputValue = math.min(ele.inputMax, ele.inputValue)
        end
    elseif ele.inputType == "text" then
        ele.inputValue = data.value
    elseif ele.inputType == "radio" then
        ele.inputValue = data.value
    end
    if cb then
        cb("ok")
    end
end)

-- Keybind
local function focusPreview()
    if not activeMenu or not activeMenu.onSelect then
        return
    end

    SetNuiFocus(true, true)
end

if  PREVIEW_KEYBIND then
    RegisterCommand("previewContext", focusPreview)

    RegisterKeyMapping("previewContext", "Preview Active Context", "keyboard", PREVIEW_KEYBIND)
end

exports("focusPreview", focusPreview)

-- Debug/Test
-- Commands:
-- [ ctx:preview | ctx:open | ctx:close | ctx:form ]

if Debug then
    local position = "right"

    local eles = {
        {
            unselectable = true,
            icon = "fas fa-info-circle",
            title = "Unselectable Item (Header/Label?)",
        },
        {
            icon = "fas fa-check",
            title = "Item A",
            description = "Some description here. Add some words to make the text overflow.",
        },
        {
            disabled = true,
            icon = "fas fa-times",
            title = "Disabled Item",
            description = "Some description here. Add some words to make the text overflow.",
        },
        {
            icon = "fas fa-check",
            title = "Item B",
            description = "Some description here. Add some words to make the text overflow.",
        },
    }

    local function onSelect(menu, ele)
        print("Ele selected", ele.title)

        if ele.name == "close" then
            exports["esx_context"]:Close()
        end

        if ele.name ~= "submit" then
            return
        end

        for _, element in ipairs(menu.eles) do
            if element.input then
                print(element.name, element.inputType, element.inputValue)
            end
        end

        exports["esx_context"]:Close()
    end

    local function onClose()
        print("Menu closed.")
    end

    RegisterCommand("ctx:preview", function()
        exports["esx_context"]:Preview(position, eles)
    end)

    RegisterCommand("ctx:open", function()
        exports["esx_context"]:Open(position, eles, onSelect, onClose)
    end)

    RegisterCommand("ctx:close", function()
        exports["esx_context"]:Close()
    end)

    RegisterCommand("ctx:form", function()
        local formMenu = {
            {
                unselectable = true,
                icon = "fas fa-info-circle",
                title = "Unselectable Item (Header/Label?)",
            },
            {
                icon = "fas fa-info-circle",
                title = "Input Text",
                input = true,
                inputType = "text",
                inputPlaceholder = "Placeholder...",
                name = "firstname",
            },
            {
                icon = "",
                title = "Input Text",
                input = true,
                inputType = "text",
                inputPlaceholder = "Placeholder...",
                name = "lastname",
            },
            {
                icon = "",
                title = "Input Number",
                input = true,
                inputType = "number",
                inputPlaceholder = "Placeholder...",
                inputValue = 0,
                inputMin = 0,
                inputMax = 50,
                name = "age",
            },
            {
                icon = "fas fa-check",
                title = "Submit",
                name = "submit",
            },
        }

        exports["esx_context"]:Open(position, formMenu, onSelect, onClose)
    end)
end


RegisterNUICallback('disableInput', function(data, cb)
    SetNuiFocusKeepInput(false)
    cb('ok') -- Always respond to the NUI callback
end)