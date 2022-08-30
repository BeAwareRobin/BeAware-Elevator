--Important!

--Marker Types: https://docs.fivem.net/docs/game-references/markers/
--Controls: https://docs.fivem.net/docs/game-references/controls/#controls
--Text Formattig: https://docs.fivem.net/docs/game-references/text-formatting/#input-codes


--     Template:
--            text = ("Drücke ~INPUT_PICKUP~ um den Aufzug zu benutzen"),
--            label = ("Eingang"),
--            description = ("Fahre zum Eingang"),
--            marker = {type = 1, scale = 5.0, height = 0.5, r = 227, g = 28, b = 130, a = 200},
--            coords = {x = -43.8, y = -795.0, z = 43.23, h = 357.51},
--            jobs = {
--				["police"] = 4,
--				["ambulance"] = 3,
--			  },
--            items = {
--				"bread",
--				"water",
--			  },



Config = {}

Config.MarkerDistance = 50 --default: 50
Config.Key = 38 --default E
Config.Description = "Aufzug"
Config.TooFarAway = "Du bist zu weit entfernt!"
Config.NoPermission = "Dazu hast du keine Rechte!"
Config.ScreenFade = false

Config.Elevator = {

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
            label = ("Casino"),
            description = ("Betrete das Casino"),
            marker = {type = 1, scale = 3.0, height = 0.5, r = 0, g = 255, b = 255, a = 200},
            coords = {x = 1089.96, y = 206.27, z = -50.0, h = 321.09},
            
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



    --PD = {
    --    {
    --        text = ("Drücke ~INPUT_PICKUP~ um den Aufzug zu benutzen"),
    --        label = ("Deine Mutter"),
    --        description = ("Fahre auf das Neger"),
    --        marker = {type = 1, scale = 5.0, height = 0.5, r = 227, g = 28, b = 130, a = 200},
    --        coords = {x = -69.0, y = -786.0, z = 43.23, h = 357.51},
    --        jobs = {
	--			["police"] = 1,
	--			["ambulance"] = 1,
	--		},
    --        items = {
	--			"bread",
	--			"water",
	--		},
    --    },
    --    {
    --        text = ("Drücke ~INPUT_PICKUP~ um den Aufzug zu benutzen"),
    --        label = ("Hurensohn"),
    --        description = ("wixxer"),
    --        marker = {type = 1, scale = 5.0, height = 0.5, r = 21, g = 232, b = 78, a = 200},
    --        coords = {x = -61.6, y = -775.87, z = 43.23, h = 343.65},
    --        jobs = {
	--			["police"] = 1,
	--			["ambulance"] = 1,
	--		},
    --        items = {
	--			"bread",
	--			"water",
	--		},
    --    },
--
    --},





}