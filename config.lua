Config = {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)
Config.FirearmsLicenseCheck = false -- Whether a arms dealer checks for a firearms license

Config.Products = {
    ["normal"] = {
        [1] = {
            name = "bread",
            price = 1,
            amount = 500,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "water",
            price = 1,
            amount = 500,
            info = {},
            type = "item",
            slot = 2,
        },
    },
    ["weapons"] = {
        [1] = {
            name = "weapon_revolver_cattleman",
            price = 250,
            amount = 250,
            info = {},
            type = "weapon",
            slot = 1,
			requiresLicense = true
        },
        [2] = {
            name = "ammo_revolver",
            price = 3,
            amount = 250,
            info = {},
            type = "item",
            slot = 2,
            requiresLicense = true
        },
    },
}

Config.Locations = {
    -- general stores
    ["valentineGS"] = {
        ["label"] = "Valentine General Store",
        ["coords"] = vector4(-324.1304, 803.4945, 117.88161, 281.30722),
        ["ped"] = 'U_M_M_ValGenStoreOwner_01',
		["scenariotype"] = "WORLD_HUMAN_SHOPKEEPER",
        ["scenarioanim"] = "WORLD_HUMAN_SHOPKEEPER_MALE_A",
        ["radius"] = 3.0,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 1475879922,
        ["blipscale"] = 0.6
    },
    ["rhodesGS"] = {
        ["label"] = "Rhodes General Store",
        ["coords"] = vector4(1329.8425, -1294.281, 77.021736, 70.938911),
        ["ped"] = 'U_M_M_ValGenStoreOwner_01',
		["scenariotype"] = "WORLD_HUMAN_SHOPKEEPER",
        ["scenarioanim"] = "WORLD_HUMAN_SHOPKEEPER_MALE_A",
        ["radius"] = 3.0,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 1475879922,
        ["blipscale"] = 0.6
    },
    ["stdenisGS"] = {
        ["label"] = "Saint Denis General Store",
        ["coords"] = vector4(2859.3151, -1202.211, 49.590873, 8.7729024),
        ["ped"] = 'U_M_M_ValGenStoreOwner_01',
		["scenariotype"] = "WORLD_HUMAN_SHOPKEEPER",
        ["scenarioanim"] = "WORLD_HUMAN_SHOPKEEPER_MALE_A",
        ["radius"] = 3.0,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 1475879922,
        ["blipscale"] = 0.6
    },
    ["tumbleweedGS"] = {
        ["label"] = "Tumbleweed General Store",
        ["coords"] = vector4(-5485.968, -2937.992, -0.399478, 129.88659),
        ["ped"] = 'U_M_M_ValGenStoreOwner_01',
		["scenariotype"] = "WORLD_HUMAN_SHOPKEEPER",
        ["scenarioanim"] = "WORLD_HUMAN_SHOPKEEPER_MALE_A",
        ["radius"] = 3.0,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 1475879922,
        ["blipscale"] = 0.6
    },
    ["armadilloGS"] = {
        ["label"] = "Armadillo General Store",
        ["coords"] = vector4(-3687.349, -2623.505, -13.43116, 272.12231),
        ["ped"] = 'U_M_M_ValGenStoreOwner_01',
		["scenariotype"] = "WORLD_HUMAN_SHOPKEEPER",
        ["scenarioanim"] = "WORLD_HUMAN_SHOPKEEPER_MALE_A",
        ["radius"] = 3.0,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 1475879922,
        ["blipscale"] = 0.6
    },
    ["blackwaterGS"] = {
        ["label"] = "Blackwater General Store",
        ["coords"] = vector4(-3687.349, -2623.505, -13.43116, 272.12231),
        ["ped"] = 'U_M_M_ValGenStoreOwner_01',
		["scenariotype"] = "WORLD_HUMAN_SHOPKEEPER",
        ["scenarioanim"] = "WORLD_HUMAN_SHOPKEEPER_MALE_A",
        ["radius"] = 3.0,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 1475879922,
        ["blipscale"] = 0.6
    },
    ["vanhornGS"] = {
        ["label"] = "Van Horn General Store",
        ["coords"] = vector4(3025.5554, 562.24865, 44.722095, 260.9851),
        ["ped"] = 'U_M_M_ValGenStoreOwner_01',
		["scenariotype"] = "WORLD_HUMAN_SHOPKEEPER",
        ["scenarioanim"] = "WORLD_HUMAN_SHOPKEEPER_MALE_A",
        ["radius"] = 3.0,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 1475879922,
        ["blipscale"] = 0.6
    },
    ["strawberryGS"] = {
        ["label"] = "Strawberry General Store",
        ["coords"] = vector4(-1789.736, -388.1326, 160.32861, 54.258308),
        ["ped"] = 'U_M_M_ValGenStoreOwner_01',
		["scenariotype"] = "WORLD_HUMAN_SHOPKEEPER",
        ["scenarioanim"] = "WORLD_HUMAN_SHOPKEEPER_MALE_A",
        ["radius"] = 3.0,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 1475879922,
        ["blipscale"] = 0.6
    },
	-- weapon stores
    ["valentineWS"] = {
        ["label"] = "Valentine Gunsmith",
        ["coords"] = vector4(-281.1489, 778.89373, 119.50402, 351.36734),
        ["ped"] = 'U_M_M_ValGunsmith_01',
		["scenariotype"] = "WORLD_HUMAN_SHOPKEEPER",
        ["scenarioanim"] = "WORLD_HUMAN_SHOPKEEPER_MALE_B",
        ["radius"] = 3.0,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
        ["blipsprite"] = 4149098929,
        ["blipscale"] = 0.6
    },
    ["rhodesWS"] = {
        ["label"] = "Rhodes Gunsmith",
        ["coords"] = vector4(1322.492, -1323.108, 77.8889, 349.6582),
        ["ped"] = 'U_M_M_RhdGunsmith_01',
		["scenariotype"] = "WORLD_HUMAN_SHOPKEEPER",
        ["scenarioanim"] = "WORLD_HUMAN_SHOPKEEPER_MALE_B",
        ["radius"] = 3.0,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
        ["blipsprite"] = 4149098929,
        ["blipscale"] = 0.6
    },
    ["stdenisWS"] = {
        ["label"] = "Saint Denis Gunsmith",
        ["coords"] = vector4(2717.288, -1286.779, 49.636463, 25.519334),
        ["ped"] = 'U_M_M_NbxGunsmith_01',
		["scenariotype"] = "WORLD_HUMAN_SHOPKEEPER",
        ["scenarioanim"] = "WORLD_HUMAN_SHOPKEEPER_MALE_B",
        ["radius"] = 3.0,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
        ["blipsprite"] = 4149098929,
        ["blipscale"] = 0.6
    },
    ["tumbleweedWS"] = {
        ["label"] = "Tumbleweed Denis Gunsmith",
        ["coords"] = vector4(-5506.536, -2963.823, -0.636236, 101.39876),
        ["ped"] = 'U_M_M_TumGunsmith_01',
		["scenariotype"] = "WORLD_HUMAN_SHOPKEEPER",
        ["scenarioanim"] = "WORLD_HUMAN_SHOPKEEPER_MALE_B",
        ["radius"] = 3.0,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
        ["blipsprite"] = 4149098929,
        ["blipscale"] = 0.6
    },
    ["annesburgWS"] = {
        ["label"] = "Annesburg Gunsmith",
        ["coords"] = vector4(2948.4804, 1319.5371, 44.820251, 76.641601),
        ["ped"] = 'U_M_M_AsbGunsmith_01',
		["scenariotype"] = "WORLD_HUMAN_SHOPKEEPER",
        ["scenarioanim"] = "WORLD_HUMAN_SHOPKEEPER_MALE_B",
        ["radius"] = 3.0,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
        ["blipsprite"] = 4149098929,
        ["blipscale"] = 0.6
    },
}