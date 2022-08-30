# BeAware-Elevator
A highly configurable ESX elevator script based on NativeUI

Features:
- Multiple Floors
- Job whitelist
- Item whitelist
- Configurable Text

# Dependency
NativeUILua: Get it [here!](https://github.com/FrazzIe/NativeUILua)

# Help
- Marker Types: [here!](https://docs.fivem.net/docs/game-references/markers)
- Controls: [here!](https://docs.fivem.net/docs/game-references/controls/#controls)
- Text Formatting: [here!](https://docs.fivem.net/docs/game-references/text-formatting/#input-codes)

## Template
```
Casino = {
    {
        text = ("Drücke ~INPUT_PICKUP~ um den Aufzug zu benutzen"),
        label = ("Eingang"),
        description = ("Fahre zum Eingang"),
        marker = {type = 1, scale = 3.0, height = 0.5, r = 0, g = 255, b = 255, a = 200},
        coords = {x = 924.43, y = 46.87, z = 80.11, h = 60.01},
        
    },
    {
        text = ("Drücke ~INPUT_PICKUP~ um den Aufzug zu benutzen"),
        label = ("Terasse"),
        description = ("Betrete die Terasse"),
        marker = {type = 1, scale = 1.5, height = 0.5, r = 0, g = 255, b = 255, a = 200},
        coords = {x = 964.49, y = 58.76, z = 111.55, h = 55.63},
        jobs = {
		["police"] = 2,
		["ambulance"] = 1,
	},
        items = {
		"bread",
		"water",
	},
     },
    
},
```
