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
}