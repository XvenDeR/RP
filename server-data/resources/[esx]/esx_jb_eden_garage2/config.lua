Config = {}
Config.Blip			= {sprite= 290, color = 30}
Config.MecanoBlip	= {sprite= 290, color = 20}
Config.Price		= 50

Config.StoreOnServerStart = true -- Store all vehicles in garage on server start?

-- Центральная

Config.Garages = {
	Garage_Centre = {
		Pos = {x=216.800, y=-810.057, z=30.74},
		Distance = 2.5,
		Marker = {t=36, w= 1.0, h= 1.0,r = 255, g = 224, b = 0},
		Name = 'Гараж',
		HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы открыть гараж",
		SpawnPoint = {
			Pos = {x=229.700, y= -800.1149, z= 30.58},
			Distance = 2.5,
			Heading = 160.0,
			Marker = {t=36, w= 1.0, h= 1.0,r=60,g=255,b=0},
			HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы выгнать транспорт",
		},
		DeletePoint = {
			Pos = {x=215.124, y=-791.377, z=30.78},
			Distance = 2.5,
			Marker = {t=36, w= 1.0, h= 1.0,r=255,g=60,b=0},
			HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы припарковать транспорт",
		},
	},

--  2я центральная

	Garage_Centre2 = {
		Pos = {x = -1229.431,y = -662.517,z = 25.896},
		Distance = 2.5,
		Marker = {t=36, w= 1.0, h= 1.0,r = 255, g = 224, b = 0},
		Name = 'Гараж',
		HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы открыть гараж",
		SpawnPoint = {
			Pos = {x = -1220.64,y = -654.36,z = 25.942},
			Distance = 2.5,
			Heading = 160.0,
			Marker = {t=36, w= 1.0, h= 1.0,r=60,g=255,b=0},
			HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы выгнать транспорт",
		},
		DeletePoint = {
			Pos = {x = -1233.722,y = -654.880,z = 25.942},
			Distance = 2.5,
			Marker = {t=36, w= 1.0, h= 1.0,r=255,g=60,b=0},
			HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы припарковать транспорт",
		},
	},


	Garage_Paleto = {
		Pos = {x=90.769, y=6363.176, z=31.2373},
		Distance = 2.5,
		Marker = {t=36, w= 1.0, h= 1.0,r = 254, g = 224, b = 0},
		Name = 'Гараж',
		HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы открыть гараж",
		SpawnPoint = {
			Pos = {x=109.12322, y= 6380.6765, z= 31.2328},
			Distance = 2.5,
			Heading = 160.0,
			Marker = {t=36, w= 1.0, h= 1.0,r=60,g=255,b=0},
			HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы выгнать транспорт",
		},
		DeletePoint = {
			Pos = {x=77.082, y=6384.5410, z=31.2365},
			Distance = 2.5,
			Marker = {t=36, w= 1.0, h= 1.0,r=255,g=60,b=0},
			HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы припарковать транспорт",
		},
	},

	Garage_SandyShore = {
		Pos = {x=1643.419, y=3808.156, z=35.1173},
		Distance = 2.5,
		Marker = {t=36, w= 1.0, h= 1.0,r = 254, g = 224, b = 0},
		Name = 'Гараж',
		HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы открыть гараж",
		SpawnPoint = {
			Pos = {x=1638.53322, y= 3795.6265, z= 34.8128},
			Distance = 2.5,
			Heading = 160.0,
			Marker = {t=36, w= 1.0, h= 1.0,r=60,g=255,b=0},
			HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы выгнать транспорт",
		},
		DeletePoint = {
			Pos = {x=1626.472, y=3786.1710, z=34.6965},
			Distance = 2.5,
			Marker = {t=36, w= 1.0, h= 1.0,r=255,g=60,b=0},
			HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы припарковать транспорт",
		},
	},

-- Шоссе 2

	-- Garage_Ocean1 = {
	-- 	Pos = {x = -3140.323,y = 1124.463,z = 20.706},
	-- 	Marker = {t=1, w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
	-- 	Name = 'Гараж',
	-- 	HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы открыть гараж",
	-- 	SpawnPoint = {
	-- 		Pos = {x = -3132.638,y = 1126.662,z = 20.667},
	-- 		Heading = 160.0,
	-- 		Marker = {t=1, w= 1.5, h= 1.0,r=0,g=255,b=0},
	-- 		HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы выгнать транспорт",
	-- 	},
	-- 	DeletePoint = {
	-- 		Pos = {x = -3136.902,y = 1102.685,z = 20.654},
	-- 		Marker = {t=1, w= 1.5, h= 1.0,r=255,g=0,b=0},
	-- 		HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы припарковать транспорт",
	-- 	},
	-- },

-- Шоссе

	-- Garage_Ocean2 = {
	-- 	Pos = {x = -2982.561,y = 327.506,z = 14.935},
	-- 	Marker = {t=1, w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
	-- 	Name = 'Гараж',
	-- 	HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы открыть гараж",
	-- 	SpawnPoint = {
	-- 		Pos = {x = -2977.238,y = 337.777,z = 14.768},
	-- 		Heading = 160.0,
	-- 		Marker = {t=1, w= 1.5, h= 1.0,r=0,g=255,b=0},
	-- 		HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы выгнать транспорт",
	-- 	},
	-- 	DeletePoint = {
	-- 		Pos = {x = -2971.814,y = 355.331,z = 14.771},
	-- 		Marker = {t=1, w= 1.5, h= 1.0,r=255,g=0,b=0},
	-- 		HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы припарковать транспорт",
	-- 	},
	-- },

-- Гараж Гетто

	-- Garage_Sud = {
	-- 	Pos = {x = 443.6696,y = -1969.4372,z = 24.401},
	-- 	Marker = {t=1, w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
	-- 	Name = 'Гараж',
	-- 	HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы открыть гараж",
	-- 	SpawnPoint = {
	-- 		Pos = {x = 437.8140,y = -1958.572,z = 22.957},
	-- 		Heading = 182.0,
	-- 		Marker = {t=1, w= 1.5, h= 1.0,r=0,g=255,b=0},
	-- 		HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы выгнать транспорт",
	-- 	},
	-- 	DeletePoint = {
	-- 		Pos = {x = 457.91,y = -1971.343,z = 22.553},
	-- 		Marker = {t=1, w= 1.5, h= 1.0,r=255,g=0,b=0},
	-- 		HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы припарковать транспорт",
	-- 	},
	-- },

-- Гараж вайнвуд хилз

	-- Garage_Lake = {
	-- 	Pos = {x = -73.165504455566,y = 908.08734130859,z = 235.62712097168 },
	-- 	Marker = {t=1, w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
	-- 	Name = 'Гараж',
	-- 	HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы открыть гараж",
	-- 	SpawnPoint = {
	-- 		Pos = {x = -72.099822998047,y = 902.85479736328,z = 235.63186645508 },
	-- 		Heading = 134.409,
	-- 		Marker = {t=1, w= 1.5, h= 1.0,r=0,g=255,b=0},
	-- 		HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы выгнать транспорт",
	-- 	},
	-- 	DeletePoint = {
	-- 		Pos = {x = -66.987632751465,y = 891.65881347656,z = 235.55270385742 },
	-- 		Marker = {t=1, w= 1.5, h= 1.0,r=255,g=0,b=0},
	-- 		HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы припарковать транспорт",
	-- 	},
	-- },

-- Гараж возле ПД

	-- Garage_Occaz = {
	-- 	Pos = {x = 472.00717163086,y = -1113.5531005859,z = 29.198709487915 },
	-- 	Marker = {t=1, w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
	-- 	Name = 'Гараж',
	-- 	HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы открыть гараж",
	-- 	SpawnPoint = {
	-- 		Pos = {x = 465.24938964844,y = -1122.1062011719,z = 29.306407928467 },
	-- 		Heading = 179.84,
	-- 		Marker = {t=1, w= 1.5, h= 1.0,r=0,g=255,b=0},
	-- 		HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы выгнать транспорт",
	-- 	},
	-- 	DeletePoint = {
	-- 		Pos = {x = 480.43997192383,y = -1123.5560302734,z = 29.329828262329 },
	-- 		Marker = {t=1, w= 1.5, h= 1.0,r=255,g=0,b=0},
	-- 		HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы припарковать транспорт",
	-- 	},
	-- },

-- Грув стрит

	-- Garage_Groove = {
	-- 	Pos = {x = -69.514305114746,y = -1822.9477539063,z = 26.941974639893 },
	-- 	Marker = {t=1, w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
	-- 	Name = 'Гараж',
	-- 	HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы открыть гараж",
	-- 	SpawnPoint = {
	-- 		Pos = {x = -67.72095489502,y = -1835.7784423828,z = 26.883722305298 },
	-- 		Heading = 225.887,
	-- 		Marker = {t=1, w= 1.5, h= 1.0,r=0,g=255,b=0},
	-- 		HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы выгнать транспорт",
	-- 	},
	-- 	DeletePoint = {
	-- 		Pos = {x = -60.4020652771,y = -1829.5288085938,z = 26.836933135986 },
	-- 		Marker = {t=1, w= 1.5, h= 1.0,r=255,g=0,b=0},
	-- 		HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы припарковать транспорт",
	-- 	},
	-- },

-- Гараж Веспучи

	-- Garage_venise = {
	-- 	Pos = {x = -1081.974609375,y = -1254.1881103516,z = 5.4244246482849 },
	-- 	Marker = {t=1, w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
	-- 	Name = 'Гараж',
	-- 	HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы открыть гараж",
	-- 	SpawnPoint = {
	-- 		Pos = {x = -1077.2590332031,y = -1239.3200683594,z = 5.161093711853 },
	-- 		Heading = 144.887,
	-- 		Marker = {t=1, w= 1.5, h= 1.0,r=0,g=255,b=0},
	-- 		HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы выгнать транспорт",
	-- 	},
	-- 	DeletePoint = {
	-- 		Pos = {x = -1097.2971191406,y = -1253.8725585938,z = 5.2441983222961 },
	-- 		Marker = {t=1, w= 1.5, h= 1.0,r=255,g=0,b=0},
	-- 		HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы припарковать транспорт",
	-- 	},
	-- },

-- Гараж Текилла

	-- Garage_tequila = {
	-- 	Pos = {x = -570.92272949219,y = 313.41049194336,z = 84.493560791016 },
	-- 	Marker = {t=1, w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
	-- 	Name = 'Гараж',
	-- 	HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы открыть гараж",
	-- 	SpawnPoint = {
	-- 		Pos = {x = -569.47564697266,y = 323.53549194336,z = 84.474433898926 },
	-- 		Heading = 22.52,
	-- 		Marker = {t=1, w= 1.5, h= 1.0,r=0,g=255,b=0},
	-- 		HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы выгнать транспорт",
	-- 	},
	-- 	DeletePoint = {
	-- 		Pos = {x = -560.84375,y = 322.41586303711,z = 84.402587890625 },
	-- 		Marker = {t=1, w= 1.5, h= 1.0,r=255,g=0,b=0},
	-- 		HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы припарковать транспорт",
	-- 	},
	-- },

--  Гараж сзади банка

	-- Garage_banque = {
	-- 	Pos = {x = 363.48370361328,y = 296.83682250977,z = 103.50011444092 },
	-- 	Marker = {t=1, w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
	-- 	Name = 'Гараж',
	-- 	HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы открыть гараж",
	-- 	SpawnPoint = {
	-- 		Pos = {x = 378.00622558594,y = 288.13024902344,z = 103.1661529541 },
	-- 		Heading = 62.22,
	-- 		Marker = {t=1, w= 1.5, h= 1.0,r=0,g=255,b=0},
	-- 		HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы выгнать транспорт",
	-- 	},
	-- 	DeletePoint = {
	-- 		Pos = {x = 364.76132202148,y = 285.18911743164,z = 103.37410736084 },
	-- 		Marker = {t=1, w= 1.5, h= 1.0,r=255,g=0,b=0},
	-- 		HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы припарковать транспорт",
	-- 	},
	-- },

	-- Гарраж Миррор Парк

	-- Garage_mirrorpark = {
	-- 	Pos = {x = 1033.9229736328,y = -767.10662841797,z = 58.003326416016 },
	-- 	Marker = {t=1, w= 1.5, h= 1.0,r = 204, g = 204, b = 0},
	-- 	Name = 'Гараж',
	-- 	HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы открыть гараж",
	-- 	SpawnPoint = {
	-- 		Pos = {x = 1040.6834716797,y = -778.18170166016,z = 58.022853851318 },
	-- 		Heading = 359.92,
	-- 		Marker = {t=1, w= 1.5, h= 1.0,r=0,g=255,b=0},
	-- 		HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы выгнать транспорт",
	-- 	},
	-- 	DeletePoint = {
	-- 		Pos = {x = 1022.7816772461,y = -763.78955078125,z = 57.961227416992 },
	-- 		Marker = {t=1, w= 1.5, h= 1.0,r=255,g=0,b=0},
	-- 		HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы припарковать транспорт",
	-- 	}
	-- }
}

Config.GaragesMecano = {
--[[
	Bennys = {
		Name = 'Штрафстоянка',
		SpawnPoint = {
			Pos = {x = 477.729,y = -1888.856,z = 26.094},
			Heading = 303.0,
			Marker = {t=1, w= 1.5, h= 1.0,r=0,g=255,b=0},
			HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы вернуть транспорт",
		},
		DeletePoint = {
			Pos = {x = 459.733,y = -1890.335,z = 25.776},
			Marker = {t=1, w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы конфисковать транспорт",
		},
	},
]]--
	police = {
		Name = 'Штрафстоянка',
		SpawnPoint = {
			Pos = {x = 449.253,y = -1024.322,z = 28.60},
			Distance = 2.5,
			Heading = 100.0,
			Marker = {t=36, w= 1.0, h= 1.0,r=255,g=60,b=0},
			HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы вернуть транспорт",
		},
		DeletePoint = {
			Pos = {x = 459.733,y = -1890.335,z = 25.776},
			Distance = 2.5,
			Marker = {t=0, w= 1.5, h= 1.0,r=255,g=0,b=0},
			HelpPrompt = "Нажмите ~INPUT_PICKUP~ чтобы конфисковать транспорт",
		},
	}
}
