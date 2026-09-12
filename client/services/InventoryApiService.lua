local function HawkNotify(title, message, icon, duration, notifyType)
    icon = icon or "icon"
    duration = duration or 3000
    notifyType = notifyType or "info"
    TriggerEvent("hawk_notify", title, message, icon, duration, "right-bottom", notifyType)
end

local AMMO_NOTIFY_ICONS = {
	AMMO_PISTOL = "ammopistolnormal",
	AMMO_PISTOL_EXPRESS = "ammopistolnormal",
	AMMO_PISTOL_EXPRESS_EXPLOSIVE = "ammopistolnormal",
	AMMO_PISTOL_HIGH_VELOCITY = "ammopistolnormal",
	AMMO_PISTOL_SPLIT_POINT = "ammopistolnormal",
	AMMO_REPEATER = "ammorepeaternormal",
	AMMO_REPEATER_EXPRESS = "ammorepeaternormal",
	AMMO_REPEATER_EXPRESS_EXPLOSIVE = "ammorepeaternormal",
	AMMO_REPEATER_HIGH_VELOCITY = "ammorepeaternormal",
	AMMO_REPEATER_SPLIT_POINT = "ammorepeaternormal",
	AMMO_REVOLVER = "ammorevolvernormal",
	AMMO_REVOLVER_EXPRESS = "ammorevolvernormal",
	AMMO_REVOLVER_EXPRESS_EXPLOSIVE = "ammorevolvernormal",
	AMMO_REVOLVER_HIGH_VELOCITY = "ammorevolvernormal",
	AMMO_REVOLVER_SPLIT_POINT = "ammorevolvernormal",
	AMMO_RIFLE = "ammoriflenormal",
	AMMO_RIFLE_ELEPHANT = "ammoriflenormal",
	AMMO_RIFLE_EXPRESS = "ammoriflenormal",
	AMMO_RIFLE_EXPRESS_EXPLOSIVE = "ammoriflenormal",
	AMMO_RIFLE_HIGH_VELOCITY = "ammoriflenormal",
	AMMO_RIFLE_SPLIT_POINT = "ammoriflenormal",
	AMMO_22 = "ammovarmint",
	AMMO_22_TRANQUILIZER = "ammovarmint",
	AMMO_SHOTGUN = "ammoshotgunnormal",
	AMMO_SHOTGUN_BUCKSHOT_INCENDIARY = "ammoshotgunnormal",
	AMMO_SHOTGUN_SLUG_EXPLOSIVE = "ammoshotgunnormal",
	AMMO_SHOTGUN_SLUG = "ammoshotgunnormal",
	AMMO_ARROW = "ammoarrownormal",
	AMMO_ARROW_DYNAMITE = "ammoarrownormal",
	AMMO_ARROW_FIRE = "ammoarrowfire",
	AMMO_ARROW_IMPROVED = "ammoarrownormal",
	AMMO_ARROW_SMALL_GAME = "ammoarrownormal",
	AMMO_ARROW_POISON = "ammoarrowpoison",
	AMMO_MOLOTOV = "ammo_fire_bottle_normal",
	AMMO_MOLOTOV_VOLATILE = "ammo_fire_bottle_normal",
}

local function GetAmmoNotifyIcon(ammoType)
	return AMMO_NOTIFY_ICONS[ammoType] or ammoType or "ammo"
end

local function NotifyAmmo(ammoType, ammoLabel, amount, isAdd)
    local title = isAdd and "ได้รับกระสุน!" or "เสียกระสุน!"
    local prefix = isAdd and "+" or "-"
    local notifyType = isAdd and "success" or "info"
    local displayName = ammoLabel or ammoType or "Ammo"
    local message = prefix .. " " .. tostring(amount or 0) .. " " .. tostring(displayName)
    local icon = GetAmmoNotifyIcon(ammoType)
    HawkNotify(title, message, icon, 3000, notifyType)
end

local InventoryApi = {
    ADD_ITEM = function(itemData)
        local itemId <const> = itemData.id
        local itemAmount <const> = itemData.count
        local item <const> = PLAYER_INVENTORY.ITEMS[itemId]

        if item then
            item:setCount(itemAmount)
        else
            local newItem <const> = ITEM:Register(itemData)
            PLAYER_INVENTORY.ITEMS[itemId] = newItem
        end
        NUI_SERVICE.INVENTORY.UPDATE_ITEM(itemId)
    end,

    SUB_ITEM = function(id, qty)
        local item <const> = PLAYER_INVENTORY.ITEMS[id]
        if not item then return end

        item:setCount(qty)
        if item:getCount() == 0 then
            PLAYER_INVENTORY.ITEMS[id] = nil
            NUI_SERVICE.SHARED.REMOVE(id, item.type)
        else
            NUI_SERVICE.INVENTORY.UPDATE_ITEM(id)
        end
    end,

    SET_ITEM_METADATA = function(id, metadata)
        local item <const> = PLAYER_INVENTORY.ITEMS[id]
        if not item then return end

        item:setMetadata(metadata)
        NUI_SERVICE.INVENTORY.UPDATE_ITEM(id)
    end,

    SET_ITEM_DURABILITY = function(id, durability)
        local item <const> = PLAYER_INVENTORY.ITEMS[id]
        if not item then return end
        item:setDurability(durability)
        NUI_SERVICE.INVENTORY.UPDATE_ITEM(id)
    end,

    SUB_WEAPON = function(weaponId)
        local weapon <const> = PLAYER_INVENTORY.WEAPONS[weaponId]
        if weapon then
            if weapon:getUsed() then
                weapon:UnequipWeapon(true)
            end
            PLAYER_INVENTORY.WEAPONS[weaponId] = nil
        end
        NUI_SERVICE.SHARED.REMOVE(weaponId, "item_weapon")
    end,

    SUB_WEAPON_BULLETS = function(weaponId, bulletType, qty)
        local weapon <const> = PLAYER_INVENTORY.WEAPONS[weaponId]
        if weapon then
            local previousAmmo <const> = weapon:getAmmo(bulletType) or 0
            weapon:subAmmo(bulletType, qty)
            local currentAmmo <const> = weapon:getAmmo(bulletType) or 0

            if weapon:getUsed() then
                SetPedAmmoByType(CACHE.Ped, joaat(bulletType), currentAmmo)
            end

            local usedAmount <const> = previousAmmo - currentAmmo
            if usedAmount > 0 then
                local ammoLabel <const> = SHARED_DATA.AMMO_LABEL[bulletType] or bulletType
                NotifyAmmo(bulletType, ammoLabel, usedAmount, false)
            end
        end
        NUI_SERVICE.INVENTORY.UPDATE_WEAPON(weaponId)
    end,

    ADD_COMPONENT = function(weaponId, component, category)
        local weapon <const> = PLAYER_INVENTORY.WEAPONS[weaponId]
        if not weapon then return end

        weapon:addComponent(component, category)
        NUI_SERVICE.INVENTORY.UPDATE_WEAPON(weaponId)
    end,
    ADD_COMPONENTS = function(weaponId, components)
        local weapon <const> = PLAYER_INVENTORY.WEAPONS[weaponId]
        if not weapon then return end
        for category, component in pairs(components) do
            weapon:addComponent(component, category)
        end
        NUI_SERVICE.INVENTORY.UPDATE_WEAPON(weaponId)
    end,

    SUB_COMPONENT = function(weaponId, component, category)
        local weapon <const> = PLAYER_INVENTORY.WEAPONS[weaponId]
        if not weapon then return end

        weapon:removeComponent(component, category)
        NUI_SERVICE.INVENTORY.UPDATE_WEAPON(weaponId)
    end,

    SUB_COMPONENTS = function(weaponId, components)
        local weapon <const> = PLAYER_INVENTORY.WEAPONS[weaponId]
        if not weapon then return end
        for category, component in pairs(components) do
            weapon:removeComponent(component, category)
        end
        NUI_SERVICE.INVENTORY.UPDATE_WEAPON(weaponId)
    end,
}

INVENTORY_API_SERVICE = InventoryApi
