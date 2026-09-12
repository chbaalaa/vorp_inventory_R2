---@class vorp_inventory_config
CONFIG                     = CONFIG or {}

CONFIG.LANGUAGE            = "English"

CONFIG.DEV_MODE            = false   -- ถ้าเซิร์ฟเวอร์ของคุณเปิดใช้งานจริงแล้ว ให้ตั้งค่าเป็น false

CONFIG.PUSH_TO_TALK        = true    -- เปิดใช้งาน PTT ขณะที่ inventory เปิดอยู่

CONFIG.INV_ORDER           = "items" -- "items" หรือ "weapons" สิ่งที่จะแสดงที่ด้านบนของ inventory

CONFIG.WALK_WHILE_INV_OPEN = true    -- ถ้าเป็น true ผู้เล่นสามารถเดินได้ขณะ inventory เปิดอยู่ ตราบที่กดปุ่ม W ค้างไว้

CONFIG.SHOW_PLAYER_NAME    = false   -- เมื่อให้ไอเทม จะแสดงชื่อตัวละครของผู้เล่นที่อยู่ใกล้เคียงแทน Player ID

CONFIG.GIVE_ITEMS_CONFIRMATION_ENABLED = true -- ถ้าเป็น true ผู้รับต้องกด Accept/Deny ยืนยันก่อนรับของ (ค่าเริ่มต้น) ถ้าเป็น false จะรับของทันทีโดยไม่ต้องยืนยัน


-- การตั้งค่าอาวุธ
CONFIG.REMOVE_LASSO                      = true -- ถ้าเป็น true ลาสโซ่จะถูกลบออกเมื่อผู้เล่นมัด NPC ใช้งานได้เฉพาะเมื่อ MANUAL_WEAPON_RELOAD เป็น true เท่านั้น

CONFIG.DISABLE_HIP_FIRE                  = false -- ถ้าเป็น true จะปิดการยิงจากสะโพก ผู้เล่นต้องเล็งก่อนถึงจะยิงได้

CONFIG.RELOAD_WAIT                       = 2000 -- หลังจากเติมกระสุนแล้วต้องรอเวลานี้ (มิลลิวินาที)

CONFIG.USE_RELOAD_SPEEDS                 = true -- ถ้าเป็น true ความเร็วในการเติมกระสุนจะถูกเพิ่มให้อาวุธและสามารถเปลี่ยนได้ใน SHARED_DATA.WEAPONS

-- ถ้าปิดการตั้งค่านี้จะทำให้ฟีเจอร์จำนวนมากถูกปิดด้วย ควรเก็บไว้เป็น true
CONFIG.MANUAL_WEAPON_RELOAD              = false  -- ถ้าเป็น true ผู้เล่นต้องเติมกระสุนเอง และจะเพิ่มฟีเจอร์อื่นๆ เช่น การถอดกระสุนออกจากอาวุธ เป็นต้น

CONFIG.USE_LANTERN_ON_BELT               = true  -- ถ้าเป็น true โคมไฟจะถูกติดที่เข็มขัด

CONFIG.DUAL_WIELD                        = true  -- ถ้าเป็น true จะอนุญาตให้ถืออาวุธสองมือ

CONFIG.DUAL_WIELD_HOLSTER_NEEDED         = true  -- ถ้าเป็น true ผู้เล่นต้องมีซองปืนด้านซ้ายเพื่อถืออาวุธสองมือ มิฉะนั้นจะไม่สามารถพกปืนสองกระบอกได้ (ร้านเสื้อผ้าทุกแห่งจะขายซองปืนนี้)

CONFIG.AUTO_EQUIP_USED_WEAPONS           = true  -- จะเพิ่มอาวุธไปยัง weapon wheel ถ้าผู้เล่นออกจากเกมโดยยังสวมใส่อยู่ ใช้งานได้เฉพาะเมื่อ MANUAL_WEAPON_RELOAD เป็น true

CONFIG.GIVE_ITEMS_CONFIRMATION_ENABLED 	 = false	-- เปิดปิดยืนยันแลกไอเทม

CONFIG.REMOVE_THROWABLE_WEAPONS          = true  -- ถ้าเป็น true อาวุธที่ขว้างได้จะถูกลบออกเมื่อยิง/ขว้าง และถ้าเก็บขึ้นมาได้จะได้อาวุธนั้นคืน

CONFIG.ENABLE_PETROL_CAN                 = false -- ถ้าเป็น true กระป๋องน้ำมันจะเปิดใช้งานและสามารถใช้ได้ โดยปริมาณน้ำมันจะถูกบันทึกด้วย

CONFIG.DISABLE_WEAPON_WHELL_ITEMS        = false -- วงล้อนี้มีไม้ตกปลา ฯลฯ ถ้าตั้งค่าเป็น true จะซ่อนวงล้อนั้น และต้องใช้ไอเทมเหล่านั้นจาก hot bar แทน

CONFIG.DISABLE_WEAPON_WHEEL_WEAPONS      = false -- ถ้าเป็น true วงล้ออาวุธจะไม่แสดงอาวุธ มีแต่ไอเทมเท่านั้น และต้องใช้จาก hot bar รวมถึงตั้งค่ากระสุนผ่าน inventory actions dropdown

-- กำหนดว่าผู้เล่นสามารถพกอาวุธประเภทเดียวกันมากกว่าหนึ่งชิ้นได้หรือไม่ เช่น พกอาวุธยาวสองชิ้น หรืออาวุธสั้นสองชิ้น
-- ถ้าต้องการปิดใช้งาน ให้ลบตัวแปร LongWeapon และ ShortWeapon ออกจากไฟล์ WEAPONS.LUA
CONFIG.EQUIP_WEAPONS                     = {
	LONG_WEAPONS = 2, -- จำนวนอาวุธยาวที่พกได้พร้อมกัน ถ้าเป็น 1 จะพกได้แค่หนึ่งกระบอก
	SHORT_WEAPONS = 2, -- จำนวนอาวุธสั้นที่พกได้พร้อมกัน ถ้าเป็น 1 จะพกได้แค่หนึ่งกระบอก
}
-------------------------
----- ถ้ามีสคริปต์อาวุธอื่น อาจต้องปรับแต่งให้ทำงานร่วมกับ vorp_inventory หรือปิดฟีเจอร์นี้
----- โดยค่าเริ่มต้นจะทำงานร่วมกับ vorp weapons ได้ดี
CONFIG.USE_WEAPON_COMPONENTS             = false                  -- ถ้าเป็น true inventory จะอนุญาตให้ใช้อุปกรณ์เสริมอาวุธและโหลดอุปกรณ์เสริมที่บันทึกไว้ในฐานข้อมูล

CONFIG.USE_WEAPON_DEGRADATION            = true                   -- ถ้าเป็น true จะใช้ระบบเสื่อมสภาพของอาวุธ ซึ่งหมายความว่าสามารถตรวจสอบและทำความสะอาดได้ และสถานะอาวุธจะถูกบันทึกไว้หลังรีสตาร์ท

CONFIG.DISABLE_WEAPON_FIRE_WHEN_DEGRADED = false                  -- ถ้าเป็น true อาวุธจะถูกปิดการใช้งานเมื่อเสื่อมสภาพและเสียหาย

CONFIG.RESTORE_WEAPON_DEGRADATION        = false                  -- ถ้าเป็น true การเสื่อมสภาพจะถูกคืนค่าเมื่อทำความสะอาด ถ้าเป็น false หมายความว่าอาวุธไม่คงทนตลอดไป

CONFIG.CLEAN_WEAPON_ITEM                 = "gun_oil"              -- ไอเทมที่ใช้ทำความสะอาดอาวุธ ไอเทมนี้ไม่สามารถใช้งานได้โดยตรง

CONFIG.TIME_BETWEEN_ITEM_USE             = 2000                   -- เวลาระหว่างการใช้ไอเทม (มิลลิวินาที)

CONFIG.OPEN_INVENTORY_KEY                = `INPUT_QUICK_USE_ITEM` -- ปุ่มเปิด inventory: I


CONFIG.INVENTORY_UI = {

	WEIGHT_MEASURE = "kg", -- หน่วยวัดน้ำหนัก (kg, lbs ฯลฯ) เป็นแค่ป้ายกำกับ

	BACKGROUND_FILTER = {
		ENABLE = false,     -- ถ้าเป็น true ฟิลเตอร์พื้นหลังจะแสดงใน inventory
		FILTER = "OJDominoBlur", -- ฟิลเตอร์ที่จะใช้สำหรับพื้นหลัง
		STRENGTH = 0.5,    -- ความแรงของฟิลเตอร์
	},

	SEARCH_BAR = {
		ENABLE = true, -- ถ้าเป็น true แถบค้นหาจะแสดงใน inventory
		FOCUS = false, -- ถ้าเป็น true แถบค้นหาจะโฟกัสอัตโนมัติเมื่อเปิด inventory
	},

	-- "border" กรอบมีสี / "background" พื้นหลังมีสี / "background-img" ใช้รูปภาพสล็อตพร้อมสีและกรอบ / "none" ไม่มีสี (ป้ายกำกับจะยังมีสีบน tooltip)
	ITEM_RARITY_SLOT_STYLE = "background-img",
	-- tooltip "hover" = ใต้สล็อตที่ชี้ (ค่าเริ่มต้น) / "dock" = ติดอยู่ทางขวาของกริดหลักเมื่อเปิดช่องเก็บของรอง
	TOOLTIP_PLACEMENT = "hover",

	MAIN_INVENTORY_FIXED_SLOT_COUNT = 104, -- จำนวนสล็อตที่ผู้เล่นมีได้ ในอนาคตจะเพิ่มทีละตัวละคร เพื่อให้ใช้ทักษะเพิ่มสล็อตได้

	ADD_GOLD_ITEM = true,             -- ถ้าเป็น true จะเพิ่มไอเทมทองคำใน inventory เพื่อแสดง/ให้/ทิ้งทองคำ

	ADD_ROLL_ITEM = false,             -- ถ้าเป็น true จะเพิ่มไอเทม roll ใน inventory เพื่อแสดง/ให้/ทิ้ง roll

	HAND_CRAFT_BUTTON = false,          -- เปิดใช้งานปุ่ม Hand Crafting ใน inventory

	SADDLE_BUTTON = true,              -- เปิดใช้งานปุ่ม Saddle inventory

	SORT_BUTTON = true,                -- เปิดใช้งานปุ่มเรียงลำดับ inventory

	ADVANCED_DROP = false,             -- เปิด/ปิดเมนูทิ้งแบบ Advanced (true = เปิด, false = ปิด)

	ENABLE_DRAG_DROP_DISCARD = false, -- เปิด/ปิดการลากไอเทมไปทิ้งใน UI (true = เปิด, false = ปิด)

}

-- สามารถใช้ Hotbar ได้เฉพาะเมื่อกด ALT ค้างไว้ เพื่อให้สามารถใช้ปุ่ม 1 2 3 4 5 ตามปกติได้เมื่อไม่กด ALT
CONFIG.HOTBAR       = {
	ENABLE = true,
	SHOW_WHEN_HOLD = true,                           -- จะแสดง hotbar เมื่อกด ALT ค้างไว้
	EDIT_COMMAND = "hotbarpos",                      -- คำสั่งสำหรับแก้ไขตำแหน่ง hotbar
	TOGGLE_KEY = `INPUT_EMOTE_GREET`,                -- X -- Hotbar: แสดง/ซ่อน
	ALLOW = "items",                                   -- "all" คือไอเทมและอาวุธ / "weapons" คืออาวุธอย่างเดียว / "items" คือไอเทมอย่างเดียว
	HOLD_KEY = `INPUT_SELECT_RADAR_MODE`,            -- ปุ่มที่ต้องกดค้างเพื่อแสดง hotbar (ALT) และใช้งาน hotbar จะใช้ไม่ได้ถ้าไม่กดปุ่มนี้ค้างไว้
	-- ใช้ Raw Key (Virtual-Key Code) แทน control action เดิม เพื่อให้ปุ่ม 1-5 ของ hotbar
	-- อ้างอิงตามปุ่มคีย์บอร์ดจริงเสมอ ไม่ผูกกับ keybind ที่ผู้เล่นไปสลับ/remap ไว้ในเมนูตั้งค่าเกม
	SLOT_KEYS_RAW = {
		[1] = 0x31, -- ปุ่ม '1'
		[2] = 0x32, -- ปุ่ม '2'
		[3] = 0x33, -- ปุ่ม '3'
		[4] = 0x34, -- ปุ่ม '4'
		[5] = 0x35, -- ปุ่ม '5'
	},
	-- control ทั้งหมดในกลุ่ม "เลือกอาวุธด่วน" (quickselect) ปุ่ม 1-8 ของเกม
	-- จะถูก disable พร้อมกันทั้งหมดตอนกด ALT ค้าง เพื่อไม่ให้อาวุธออกมาซ้อนกับการใช้ hotbar
	-- ไม่ต้องสนใจว่าตอนนี้ control ไหนถูกผู้เล่น remap ไปอยู่ปุ่มไหน เพราะ disable ทั้งชุดพร้อมกัน
	BLOCK_WEAPON_CONTROLS = {
		0xE6F612E4, -- Slot1 (ค่าเริ่มต้น: Sidearm ซ้าย)
		0x1CE6D9EB, -- Slot2 (ค่าเริ่มต้น: ถืออาวุธสองมือ)
		0x4F49CC4C, -- Slot3 (ค่าเริ่มต้น: Sidearm ขวา)
		0x8F9F9E58, -- Slot4 (ค่าเริ่มต้น: ไม่ถืออาวุธ)
		0xAB62E997, -- Slot5 (ค่าเริ่มต้น: อาวุธมีด/มีคม)
		0xA1FDE2A6, -- Slot6
		0xB03A913B, -- Slot7
		0x42385422, -- Slot8
	},
	HOSTER_WEAPONS_ON_UNEQUIP = true,                -- ถ้าเป็น true เมื่อใช้จาก hotbar อาวุธจะไม่ถูกถอดออก แต่จะซ่อนเข้าซอง ถ้าเป็น false จะถอดอาวุธออกตามปกติ
}

-- การตั้งค่าเสียง
CONFIG.SFX          = {
	OPEN_INVENTORY = {
		ENABLE = true,
		NAME = "SELECT",
		REF = "RDRO_Character_Creator_Sounds",
	},
	CLOSE_INVENTORY = {
		ENABLE = true,
		NAME = "SELECT",
		REF = "RDRO_Character_Creator_Sounds",
	},
	ITEM_HOVER = {
		ENABLE = true,
		NAME = "BACK",
		REF = "RDRO_Character_Creator_Sounds",
	},
	ITEM_DROP = {
		ENABLE = true,
		NAME = "show_info",
		REF = "Study_Sounds",
	},
	MONEY_DROP = {
		ENABLE = true,
		NAME = "show_info",
		REF = "Study_Sounds",
	},
	GOLD_DROP = {
		ENABLE = true,
		NAME = "show_info",
		REF = "Study_Sounds",
	},
	ROLL_DROP = {
		ENABLE = true,
		NAME = "show_info",
		REF = "Study_Sounds",
	},
	PICK_UP = {
		ENABLE = true,
		NAME = "CHECKPOINT_PERFECT",
		REF = "HUD_MINI_GAME_SOUNDSET",
	}
}

CONFIG.PICKUPS      = {
	USE_LIGHT = true,           -- ถ้าเป็น true ไอเทมที่ทิ้งจะมีเอฟเฟกต์แสง
	KEY = `INPUT_RELOAD`, -- ปุ่ม R สำหรับ PROMPT เก็บของ

	USE_WEAPON_MODELS = true,   -- ถ้าเป็น true อาวุธจะทิ้งพร้อมโมเดล มิฉะนั้นจะใช้ prop กล่องเริ่มต้น

	DROP_MODELS = {
		default_box = "p_cottonbox01x", -- ค่าเริ่มต้นเมื่อไม่พบวัตถุ จะสร้างวัตถุนี้เสมอสำหรับอาวุธหรือไอเทม
		money_bag = "p_moneybag02x", -- prop สำหรับไอเทมเงิน
		gold_bag = "s_pickup_goldbar01x", -- prop สำหรับไอเทมทองคำ
		rol_bag = "s_pickup_goldbar01x", -- prop สำหรับไอเทม roll/สกุลเงิน (ใช้ร่วมหรือเปลี่ยนได้)
		-- เพิ่มเติมได้ที่นี่
	},

	ANIMATIONS = {
		DROP = {
			Item = {
				ENABLE = true,
				AnimDict = "amb_player@world_player_chore@bucket_put_down@male_a@base",
				AnimName = "base",
				Speed = 1.0,
				SpeedMultiplier = 8.0,
				Duration = -1,
				Flag = 1,
				ClearTaskTime = 1000
			},
			Weapon = {
				ENABLE = true,
				AnimDict = "amb_player@world_player_chore@box_put_down@male_a@base",
				AnimName = "base",
				Speed = 1.0,
				SpeedMultiplier = 8.0,
				Duration = -1,
				Flag = 1,
				ClearTaskTime = 1200
			},
			Money = {
				ENABLE = true,
				AnimDict = "mech_pickup@money@coins@table",
				AnimName = "2h_long_enter",
				Speed = 1.0,
				SpeedMultiplier = 8.0,
				Duration = -1,
				Flag = 1,
				ClearTaskTime = 500
			},
			Gold = {
				ENABLE = true,
				AnimDict = "mech_pickup@plant@gold_currant",
				AnimName = "enter_rf",
				Speed = 1.0,
				SpeedMultiplier = 8.0,
				Duration = -1,
				Flag = 1,
				ClearTaskTime = 1000
			},
			Roll = {
				ENABLE = true,
				AnimDict = "mech_pickup@plant@gold_currant",
				AnimName = "enter_rf",
				Speed = 1.0,
				SpeedMultiplier = 8.0,
				Duration = -1,
				Flag = 1,
				ClearTaskTime = 1000
			},
		},
		PICKUP = {
			ENABLE = true,
			AnimDict = "amb_work@world_human_box_pickup@1@male_a@stand_exit_withprop",
			AnimName = "exit_front",
			Speed = 1.0,
			SpeedMultiplier = 8.0,
			Duration = -1,
			Flag = 1,
			ClearTaskTime = 1200
		},
	},

	-- สำหรับอาวุธที่ทิ้งลงพื้น บางชิ้นจะสร้างในแนวตั้ง จึงต้องปรับการหมุน
	WEAPON_ADJUSTMENTS = {
		WEAPON_MELEE_KNIFE = 90.0,
		WEAPON_BOW = 90.0,
		WEAPON_BOW_IMPROVED = 90.0,
		WEAPON_MELEE_KNIFE_RUSTIC = 90.0,
		WEAPON_MELEE_KNIFE_HORROR = 90.0,
		WEAPON_MELEE_KNIFE_CIVIL_WAR = 90.0,
		WEAPON_MELEE_KNIFE_JAWBONE = 90.0,
		WEAPON_MELEE_KNIFE_MINER = 90.0,
		WEAPON_MELEE_KNIFE_VAMPIRE = 90.0,
		WEAPON_MELEE_HATCHET = 90.0,
		WEAPON_MELEE_HATCHET_HUNTER = 90.0,
		WEAPON_MELEE_HATCHET_DOUBLE_BIT = 90.0,
		WEAPON_MELEE_MACHETE_COLLECTOR = 90.0,
		WEAPON_MELEE_MACHETE = 90.0,
		WEAPON_MELEE_CLEAVER = 90.0,
		WEAPON_MELEE_HAMMER = 90.0,
		WEAPON_FISHINGROD = 90.0,
		-- เพิ่มที่นี่ถ้ามีอาวุธอื่นที่ต้องปรับการหมุน
	}
}