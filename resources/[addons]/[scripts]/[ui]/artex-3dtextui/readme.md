Do whatever you want with it, have fun :>

Install:
    1. Drag and drop the artex-3dtextui to your fivem server recources folder where you now want it to be
    2. Ensure the folder in the server.cfg if not already done with the [ParentForlderName] or whatever you named the file where you start your recources
    3. Done now you just have to add it to some script you want to use it on

You can remove the tryToRemovePlayerTextWhenClose.lua and toFix.txt if you don't want to try fix it

Usage in the client of a script:

1 arg: Title
2 arg: Whether to show the simpe text from far away or not
3 arg: Key you have to input when close to execute what you want
4 arg: Action like Press e to get healthcare or Press e to teleport to hospital
5 arg: Coords where it sohuld be(can be GetEntityCoords(PlayerPedId()) to put it on the ped)
6 arg: Global distance how far away the simple text should be shown
7 arg: Close range distance of how far away the advanced text/prompt to do sometihng will show
8 arg: Whether to have you hold the toggle keybind or not to show the simple text
9 arg: Whether you will display the advancetext or not(having this set to true will not let you press a button to execute stuff etc and setting to false will)
10 arg: A function that executes what you want to execute

Different colors you can use
~g~THIS IS GREEN~w~
~r~THIS IS RED~w~

exports['artex-3dtextui']:StartText3d("Healthcare", true, {46, 47}, "Press [~g~E~w~] to get healthcare or [~r~G~w~] to say hello", vector3(296.0008850097656, -591.5004272460938, 43.27257537841797), 3.0, 1.0, false, false, function(pressedKey)
    if pressedKey == 46 then
        print(GetEntityHealth(PlayerPedId()))
    elseif pressedKey == 47 then
        print("Hello")
    end
end)