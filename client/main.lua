local PSRCore = exports["psr-core"]:GetCoreObject()
local PlayerData = PSRCore.Functions.GetPlayerData()
local currentShop, currentData
local pedSpawned = false
local listen = false
local ShopPed = {}
local NewZones = {}

-- Functions

local function SetupItems(shop, checkLicense)
    local products = Config.Locations[shop].products
    local curJob
    local curGang
    local items = {}
    for i = 1, #products do
        curJob = products[i].requiredJob
        curGang = products[i].requiredGang

        if curJob then goto jobCheck end
        if curGang then goto gangCheck end
        if checkLicense then goto licenseCheck end

        items[#items + 1] = products[i]

        goto nextIteration

        :: jobCheck ::
        for i2 = 1, #curJob do
            if PlayerData.job.name == curJob[i2] then
                items[#items + 1] = products[i]
            end
        end

        goto nextIteration

        :: gangCheck ::
        for i2 = 1, #curGang do
            if PlayerData.gang.name == curGang[i2] then
                items[#items + 1] = products[i]
            end
        end

        goto nextIteration

        :: licenseCheck ::
        if not products[i].requiresLicense then
            items[#items + 1] = products[i]
        end

        :: nextIteration ::
    end
    return items
end

local function createBlips()
    if pedSpawned then return end

    for store in pairs(Config.Locations) do
        if Config.Locations[store]["showblip"] then
            local StoreBlip = N_0x554d9d53f696d002(1664425300, Config.Locations[store]["coords"]["x"], Config.Locations[store]["coords"]["y"], Config.Locations[store]["coords"]["z"])
            SetBlipSprite(StoreBlip, Config.Locations[store]["blipsprite"], 1)
            SetBlipScale(StoreBlip, Config.Locations[store]["blipscale"])
        end
    end
end

local function openShop(shop, data)
    local ShopItems = {}
    ShopItems.items = {}
    ShopItems.label = data["label"]

    if data.type == "weapon" and Config.FirearmsLicenseCheck then
        if PlayerData.metadata['licenses'] and PlayerData.metadata["licences"].weapon and PSRCore.Functions.HasItem("weaponlicense") then
            ShopItems.items = SetupItems(shop)
            PSRCore.Functions.Notify(Lang:t("success.dealer_verify"), "success")
            Wait(500)
        else
            ShopItems.items = SetupItems(shop, true)
            PSRCore.Functions.Notify(Lang:t("error.dealer_decline"), "error")
            Wait(500)
            PSRCore.Functions.Notify(Lang:t("error.talk_cop"), "error")
            Wait(1000)
        end
    else
        ShopItems.items = SetupItems(shop)
    end

    for k in pairs(ShopItems.items) do
        ShopItems.items[k].slot = k
    end

    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Itemshop_" .. shop, ShopItems)
end

local function listenForControl()
    if listen then return end

    CreateThread(function()
        listen = true
        while listen do
            if IsControlJustPressed(0, PSRCore.Shared.Keybinds['J']) then
				exports["psr-core"]:KeyPressed()
				openShop(currentShop, currentData)
                listen = false
                break
            end
            Wait(0)
        end
    end)
end

local function createPeds()
    if pedSpawned then return end

    for k, v in pairs(Config.Locations) do

        RequestModel(v["ped"])
        while not HasModelLoaded(v["ped"]) do
            Wait(0)
        end

        local npc = CreatePed(GetHashKey(v["ped"]), v["coords"].x+0.1, v["coords"].y, v["coords"].z-1, v["coords"].w, false, false, 0, 0)
        while not DoesEntityExist(npc) do
            Wait(300)
        end
        Citizen.InvokeNative(0x283978A15512B2FE, npc, true)
        FreezeEntityPosition(npc, false)
        SetEntityInvincible(npc, true)
        TaskStandStill(npc, -1)
        Wait(100)
        SetPedRelationshipGroupHash(npc, GetHashKey(v["ped"]))
        SetEntityCanBeDamagedByRelationshipGroup(npc, false, `PLAYER`)
        SetEntityAsMissionEntity(npc, true, true)
		Citizen.InvokeNative(0x524B54361229154F, npc, GetHashKey(v["scenariotype"]), 0, 1, GetHashKey(v["scenarioanim"]), -1.0, 0)
        SetModelAsNoLongerNeeded(GetHashKey(v["ped"]))
		
        if Config.UseTarget then
            exports['psr-target']:AddTargetEntity(ShopPed[k], {
                options = {
                    {
                        label = v["targetLabel"],
                        icon = v["targetIcon"],
                        item = v["item"],
                        action = function()
                            openShop(k, Config.Locations[k])
                        end,
                        job = v.requiredJob,
                        gang = v.requiredGang
                    }
                },
                distance = 2.0
            })
        end
    end	
    pedSpawned = true
end

local function deletePeds()
    if not pedSpawned then return end

    for _, v in pairs(ShopPed) do
        DeletePed(v)
    end
end

-- Events
RegisterNetEvent("psr-shops:client:UpdateShop", function(shop, itemData, amount)
    TriggerServerEvent("psr-shops:server:UpdateShopItems", shop, itemData, amount)
end)

RegisterNetEvent("psr-shops:client:SetShopItems", function(shop, shopProducts)
    Config.Locations[shop]["products"] = shopProducts
end)

RegisterNetEvent("psr-shops:client:RestockShopItems", function(shop, amount)
    if not Config.Locations[shop]["products"] then return end

    for k in pairs(Config.Locations[shop]["products"]) do
        Config.Locations[shop]["products"][k].amount = Config.Locations[shop]["products"][k].amount + amount
    end
end)

RegisterNetEvent('PSRCore:Client:OnPlayerLoaded', function()
    PlayerData = PSRCore.Functions.GetPlayerData()
    createBlips()
    createPeds()
end)

RegisterNetEvent('PSRCore:Client:OnPlayerUnload', function()
    deletePeds()
    table.wipe(PlayerData)
end)

RegisterNetEvent('PSRCore:Player:SetPlayerData', function(val)
    PlayerData = val
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end

    createBlips()
    createPeds()
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end

    deletePeds()
end)

-- Threads

if not Config.UseTarget then
    CreateThread(function()
        for shop in pairs(Config.Locations) do
            NewZones[#NewZones+1] = CircleZone:Create(vector3(Config.Locations[shop]["coords"]["x"], Config.Locations[shop]["coords"]["y"], Config.Locations[shop]["coords"]["z"]), Config.Locations[shop]["radius"], {
                useZ = true,
                debugPoly = false,
                name = shop,
            })
        end

        local combo = ComboZone:Create(NewZones, {name = "RandomZOneName", debugPoly = false})
        combo:onPlayerInOut(function(isPointInside, _, zone)
            if isPointInside then
                currentShop = zone.name
                currentData = Config.Locations[zone.name]
                exports["psr-core"]:DrawText(Lang:t("info.open_shop"))
                listenForControl()
            else
                exports["psr-core"]:HideText()
                listen = false
            end
        end)
    end)
end

CreateThread(function()
    for k1, v in pairs(Config.Locations) do
        if v.requiredJob and type(v.requiredJob) == "table" and table.type(v.requiredJob) == "array" then
            for k in pairs(v.requiredJob) do
                Config.Locations[k1].requiredJob[k] = 0
            end
        end

        if v.requiredGang and type(v.requiredGang) == "table" and table.type(v.requiredGang) == "array" then
            for k in pairs(v.requiredGang) do
                Config.Locations[k1].requiredGang[k] = 0
            end
        end
    end
end)