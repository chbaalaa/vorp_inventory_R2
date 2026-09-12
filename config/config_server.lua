CONFIG                     = CONFIG or {}

CONFIG.USE_GOLD_CURRENCY   = false -- ถ้าคุณไม่ได้ใช้ระบบเงิน gold ให้ปล่อยเป็น false ไว้ ตั้งเป็น false จะบล็อกการพยายามใช้ gold ทั้งหมด

-- ถ้าต้องการใช้ปุ่ม OPEN SADDLE ให้ใส่ logic เกี่ยวกับคอกม้า (stable) ของคุณตรงนี้
-- ฟังก์ชันนี้ทำงานฝั่ง server
-- ค่าเริ่มต้นใช้ระบบ VORP STABLES
CONFIG.OPEN_SADDLE         = function(charid, model, entity, netid)
    local id = ("%s_%s"):format(model, charid)
    return id -- ให้ return เป็น inventory id ตรงนี้
end

CONFIG.NEW_PLAYER          = {
    ALLOW_ACTIONS = {
        ENABLE = false, -- ถ้าเป็น true ผู้เล่นใหม่จะสามารถให้เงินหรือไอเทมกับผู้เล่นคนอื่นได้
        COOLDOWN = 300, -- หน่วยเป็นวินาที ค่าเริ่มต้นคือ 5 นาที
    },
    START_ITEMS = {
        Traveler = 1, -- ชื่อไอเทมต้องตรงกับในฐานข้อมูล
    },
    START_WEAPONS = {
        "WEAPON_MELEE_KNIFE" -- ชื่ออาวุธ
    }
}

CONFIG.DELETE_ITEM_EXPIRED = false -- ถ้าเป็น true ไอเทมที่หมดอายุแล้วจะถูกลบเมื่อใช้งาน (ใช้ได้เฉพาะไอเทมที่มีระบบ degradation เท่านั้น)

CONFIG.PICKUPS             = {

    USE_TIMER = false,      -- ถ้าเป็น true จะเพิ่มตัวจับเวลาเพื่อลบของที่ดรอปพื้น (pickups)
    TIMER = 5,             -- หลังจากเวลานี้ผ่านไป pickup จะถูกลบ หน่วยเป็นนาที
    DELETE_ON_DROP = true, -- ถ้าเป็น true การดรอปไอเทมจะแค่ลบออกจาก inventory เท่านั้น จะไม่มีการสร้างกล่องของบนพื้น
}

-- จำนวนอาวุธสูงสุดที่ผู้เล่นแต่ละคนถืออยู่ได้ ส่วนจำนวนไอเทมให้ไปตั้งค่าใน VORP CORE CONFIG
CONFIG.MAX_WEAPONS         = {
    PLAYERS   = 10,
    JOBS      = { -- ถ้าปล่อยว่างไว้จะใช้จำนวนตามค่าของผู้เล่นทั่วไป
        police = 10,
    },
    -- ไอเทมที่ไม่ถูกนับรวมในจำนวนอาวุธสูงสุด หมายความว่าสามารถพกได้ไม่จำกัดจำนวน
    WHITELIST = {
        WEAPON_KIT_BINOCULARS_IMPROVED = true,
        WEAPON_KIT_BINOCULARS = true,
        WEAPON_FISHINGROD = true,
        WEAPON_KIT_CAMERA = true,
        WEAPON_KIT_CAMERA_ADVANCED = true,
        WEAPON_MELEE_LANTERN = true,
        WEAPON_MELEE_DAVY_LANTERN = true,
        WEAPON_MELEE_LANTERN_HALLOWEEN = true,
        WEAPON_KIT_METAL_DETECTOR = true,
        WEAPON_MELEE_HAMMER = true,
        WEAPON_MELEE_KNIFE = true,
    }
}


CONFIG.PLAYER_RESPAWN = {
    --- เงิน (VORP CURRENCY) ---
    MONEY = {
        ENABLE     = false, -- ถ้าเป็น true เงินของผู้เล่นจะถูกล้างเมื่อ respawn
        JOB_LOCK   = {      -- อาชีพเหล่านี้จะไม่ถูกล้างเงิน
            police = true,
            doctor = true
        },
        PERCENTAGE = 1.0, -- 0.1 = ล้าง 10% ของเงิน, 1.0 = ล้าง 100% ของเงิน
    },
    GOLD = {
        ENABLE     = false,
        JOB_LOCK   = {
            police = true,
            doctor = true
        },
        PERCENTAGE = 1.0,
    },
    ROLL = {
        ENABLE     = false,
        JOB_LOCK   = {
            police = true,
            doctor = true
        },
        PERCENTAGE = 1.0,
    },
    ---
    ITEMS = {
        ENABLE    = false,
        JOB_LOCK  = {
            police = true,
            doctor = true
        },
        ALL       = true, -- ลบไอเทมทั้งหมดแทนที่จะลบเฉพาะที่อยู่ใน whitelist
        WHITELIST = {
            consumable_raspberrywater = true,
            ammorevolvernormal = true
        },
    },

    WEAPONS = {
        ENABLE    = false,
        JOB_LOCK  = {
            police = true,
            doctor = true
        },
        ALL       = true, -- ลบอาวุธทั้งหมดแทนที่จะลบเฉพาะที่อยู่ใน whitelist
        WHITELIST = {
            WEAPON_MELEE_KNIFE = true,
            WEAPON_BOW = true
        },

    },

    AMMO = {
        ENABLE   = false, -- ถ้าเป็น true กระสุนจะถูกล้างเมื่อ respawn
        JOB_LOCK = {
            police = true,
            doctor = true
        },
    },
}

CONFIG.LOGS           = {

    -- LOG หลักของ INVENTORY
    webhookname             = "INVENTORY LOGS", -- ชื่อ webhook
    webhook                 = "https://discord.com/api/webhooks/1516518666001322105/9eWspHiZIClfCJQwbCKD562ScbA57OB5LaRbeD5MhdTNFw-gAqX6FpQkWztJQcUrdpU6",               -- URL webhook

    -- สีของ log เกี่ยวกับ Gold
    colorpickedgold         = 65280,
    colorgiveGold           = 4286945,
    colorDropGold           = 16711680,

    -- สีของ log เกี่ยวกับเงิน
    colorgiveMoney          = 4286945,
    colormoneypickup        = 65280,
    colorDropMoney          = 16711680,

    -- สีของ log เกี่ยวกับไอเทม
    coloritemDrop           = 16711680,
    coloritempickup         = 65280,
    colorgiveitem           = 4286945,

    -- สีของ log เกี่ยวกับอาวุธ
    colorweppickupd         = 65280,
    colorgiveWep            = 4286945,
    colordropedwep          = 16711680,

    -- LOG INVENTORY แบบกำหนดเอง (CUSTOM)

    cuscolor                = 16711680,
    custitle                = "CUSTOM INV LOGS",
    cusavatar               = "https://img1.pic.in.th/images/roj6dbfed42a6554e19.png",
    cuslogo                 = "https://img1.pic.in.th/images/roj6dbfed42a6554e19.png",
    cusfooterlogo           = "https://img1.pic.in.th/images/roj6dbfed42a6554e19.png",
    cuswebhookname          = "CUSTOM INV LOGS",
    CustomInventoryTakeFrom = "https://discord.com/api/webhooks/1516519129576636417/jOAohH5yvd-ltQyi0zv6dVmUtg9k-d9Pl39LjUHBRzF5dfXOeSa4xwr2nmoZVL7nzgkI", -- URL webhook
    CustomInventoryMoveTo   = "https://discord.com/api/webhooks/1516519221830488194/1VVYXmId7IgOBfp_E9ueU0g33T231_7eWOfdzbbF1xB9qcMOcdclYLh6USbYfFeeDbqe", -- URL webhook


    NetDupWebHook = {
        -- กรณีมีคนพยายามใช้ dev tools เพื่อโกง
        Active = true,
        color = 16711680,
        webhook = "https://discord.com/api/webhooks/1527691860779204681/GfvcreokQknyLNfrNaABJiqeHCw-_53TtvVZ6LyfYqDoIoPSXpbKACZCAD0hEMSQ9KRv", -- URL webhook
        Language = {
            title = "ตรวจพบผู้ต้องสงสัยว่าโกง (Possible Cheater Detected)",
            descriptionstart = "มีการเรียกใช้ NUI Callback ที่ไม่ถูกต้องโดย...\n **ชื่อผู้เล่น** `",
            descriptionend = "`\n"
        }
    },

}