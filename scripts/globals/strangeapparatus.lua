-----------------------------------
--
--     Strange Apparatus
--
-- https://www.bg-wiki.com/bg/Strange_Apparatus
-- TODO: adjust drops rates per zone
-- TODO: add Rune Kris, Rune Algol, Rune Scythe
-----------------------------------
require("scripts/globals/npc_util")
require("scripts/globals/zone")
------------------------------------

dsp = dsp or {}

local RED_CHIP          = 474
local BLUE_CHIP         = 475
local YELLOW_CHIP       = 476
local GREEN_CHIP        = 477
local CLEAR_CHIP        = 478
local PURPLE_CHIP       = 479
local WHITE_CHIP        = 480
local BLACK_CHIP        = 481
local INFINITY_CORE     = 1474
local FIRE_CLUSTER      = 4104
local ICE_CLUSTER       = 4105
local WIND_CLUSTER      = 4106
local EARTH_CLUSTER     = 4107
local LIGHTNING_CLUSTER = 4108
local WATER_CLUSTER     = 4109
local LIGHT_CLUSTER     = 4110
local DARK_CLUSTER      = 4111
local FIRE_ORE		    = 1255
local EARTH_ORE		    = 1258
local WATER_ORE		    = 1260
local WIND_ORE		    = 1257
local ICE_ORE		    = 1256
local LIGHTNING_ORE	    = 1259
local LIGHT_ORE		    = 1261
local DARK_ORE		    = 1262

------------------------------------
-- Strange Apparatus data
-- [zone] =
-- {
--     suffix  = player variable suffix,
--     uid     = unique identifier from the 0x60 packet
--     chip    = correct colored chip to trade to avoid spawning elemental
--     cluster = elemental cluster that can possibly be rewarded
--     drop    = {itemid, cumulative drop rate, drop quantity, itemid, cumulative drop rate, drop quantity, ...} in ascending order by drop rate
-- }
------------------------------------

local strAppData =
{
    [dsp.zone.DANGRUF_WADI] =
    {
        suffix  = 'DW',
        uid     = 0,
        chip    = RED_CHIP,
        cluster = FIRE_CLUSTER,
        ore = FIRE_ORE,
        drop    =
        {
            17093, 0.0400, 1, -- rune_staff
            17461, 0.0800, 1, -- rune_rod
            18084, 0.1200, 1, -- rune_halberd
            17158, 0.1600, 1, -- rune_bow
            16563, 0.2000, 1, -- rune_blade
            12742, 0.2400, 1, -- rune_bangles
            16647, 0.2800, 1, -- rune_axe
            18206, 0.3200, 1, -- rune_chopper
            16408, 0.3600, 1, -- rune_baghnakhs
              221, 0.4000, 1, -- arcane_flowerpot
            17333, 0.5200, 6, -- rune_arrow
             1229, 0.7000, 2, -- adaman_nugget
              931, 1.0000, 8, -- cermet_chunk
        },
	    af_drop =
	    {
	       head = 1,	
	    },
    },
    [dsp.zone.ORDELLES_CAVES] =
    {
        suffix  = 'OC',
        uid     = 3,
        chip    = GREEN_CHIP,
        cluster = WIND_CLUSTER,
        ore = WIND_ORE,
        drop    =
        {
            17093, 0.0400, 1, -- rune_staff
            17461, 0.0800, 1, -- rune_rod
            18084, 0.1200, 1, -- rune_halberd
            17158, 0.1600, 1, -- rune_bow
            16563, 0.2000, 1, -- rune_blade
            12742, 0.2400, 1, -- rune_bangles
            16647, 0.2800, 1, -- rune_axe
            18206, 0.3200, 1, -- rune_chopper
            16408, 0.3600, 1, -- rune_baghnakhs
              221, 0.4000, 1, -- arcane_flowerpot
            17333, 0.5200, 6, -- rune_arrow
             1229, 0.7000, 2, -- adaman_nugget
              931, 1.0000, 8, -- cermet_chunk
        },
        af_drop =
	    {
	       legs = 1,	
	    },
    },
    [dsp.zone.OUTER_HORUTOTO_RUINS] =
    {
        suffix  = 'HR',
        uid     = 5,
        chip    = PURPLE_CHIP,
        cluster = LIGHTNING_CLUSTER,
	ore = LIGHTNING_ORE,
        drop    =
        {
            17093, 0.0400, 1, -- rune_staff
            17461, 0.0800, 1, -- rune_rod
            18084, 0.1200, 1, -- rune_halberd
            17158, 0.1600, 1, -- rune_bow
            16563, 0.2000, 1, -- rune_blade
            12742, 0.2400, 1, -- rune_bangles
            16647, 0.2800, 1, -- rune_axe
            18206, 0.3200, 1, -- rune_chopper
            16408, 0.3600, 1, -- rune_baghnakhs
              221, 0.4000, 1, -- arcane_flowerpot
            17333, 0.5200, 6, -- rune_arrow
             1229, 0.7000, 2, -- adaman_nugget
              931, 1.0000, 8, -- cermet_chunk
        },
        af_drop =
	    {
	       back = 1,	
	    },
    },
    [dsp.zone.THE_ELDIEME_NECROPOLIS] =
    {
        suffix  = 'EN',
        uid     = 4,
        chip    = CLEAR_CHIP,
        cluster = ICE_CLUSTER,
        ore = ICE_ORE,
        drop    =
        {
            17093, 0.0400, 1, -- rune_staff
            17461, 0.0800, 1, -- rune_rod
            18084, 0.1200, 1, -- rune_halberd
            17158, 0.1600, 1, -- rune_bow
            16563, 0.2000, 1, -- rune_blade
            12742, 0.2400, 1, -- rune_bangles
            16647, 0.2800, 1, -- rune_axe
            18206, 0.3200, 1, -- rune_chopper
            16408, 0.3600, 1, -- rune_baghnakhs
              221, 0.4000, 1, -- arcane_flowerpot
            17333, 0.5200, 6, -- rune_arrow
             1229, 0.7000, 2, -- adaman_nugget
              931, 1.0000, 8, -- cermet_chunk
        },
        af_drop =
	    {
	       feet = 1,	
	    },
    },
    [dsp.zone.GUSGEN_MINES] =
    {
        suffix  = 'GM',
        uid     = 1,
        chip    = YELLOW_CHIP,
        cluster = EARTH_CLUSTER,
        ore = EARTH_ORE,
        drop    =
        {
            17093, 0.0400, 1, -- rune_staff
            17461, 0.0800, 1, -- rune_rod
            18084, 0.1200, 1, -- rune_halberd
            17158, 0.1600, 1, -- rune_bow
            16563, 0.2000, 1, -- rune_blade
            12742, 0.2400, 1, -- rune_bangles
            16647, 0.2800, 1, -- rune_axe
            18206, 0.3200, 1, -- rune_chopper
            16408, 0.3600, 1, -- rune_baghnakhs
              221, 0.4000, 1, -- arcane_flowerpot
            17333, 0.5200, 6, -- rune_arrow
             1229, 0.7000, 2, -- adaman_nugget
              931, 1.0000, 8, -- cermet_chunk
        },
        af_drop =
	    {
	       body = 1,	
	    },
    },
    [dsp.zone.CRAWLERS_NEST] =
    {
        suffix  = 'CN',
        uid     = 2,
        chip    = BLUE_CHIP,
        cluster = WATER_CLUSTER,
        ore = WATER_ORE,
        drop    =
        {
            17093, 0.0400, 1, -- rune_staff
            17461, 0.0800, 1, -- rune_rod
            18084, 0.1200, 1, -- rune_halberd
            17158, 0.1600, 1, -- rune_bow
            16563, 0.2000, 1, -- rune_blade
            12742, 0.2400, 1, -- rune_bangles
            16647, 0.2800, 1, -- rune_axe
            18206, 0.3200, 1, -- rune_chopper
            16408, 0.3600, 1, -- rune_baghnakhs
              221, 0.4000, 1, -- arcane_flowerpot
            17333, 0.5200, 6, -- rune_arrow
             1229, 0.7000, 2, -- adaman_nugget
              931, 1.0000, 8, -- cermet_chunk
        },
        af_drop =
	    {
	       hands = 1,	
	    },
    },
    [dsp.zone.MAZE_OF_SHAKHRAMI] =
    {
        suffix  = 'MS',
        uid     = 7,
        chip    = BLACK_CHIP,
        cluster = DARK_CLUSTER,
        drop    =
        {
            17093, 0.0400, 1, -- rune_staff
            17461, 0.0800, 1, -- rune_rod
            18084, 0.1200, 1, -- rune_halberd
            17158, 0.1600, 1, -- rune_bow
            16563, 0.2000, 1, -- rune_blade
            12742, 0.2400, 1, -- rune_bangles
            16647, 0.2800, 1, -- rune_axe
            18206, 0.3200, 1, -- rune_chopper
            16408, 0.3600, 1, -- rune_baghnakhs
              221, 0.4000, 1, -- arcane_flowerpot
            17333, 0.5200, 6, -- rune_arrow
             1229, 0.7000, 2, -- adaman_nugget
              931, 1.0000, 8, -- cermet_chunk
        },
    },
    [dsp.zone.GARLAIGE_CITADEL] =
    {
        suffix  = 'GC',
        uid     = 6,
        chip    = WHITE_CHIP,
        cluster = LIGHT_CLUSTER,
        ore = LIGHT_ORE,
        drop    =
        {
            17093, 0.0400, 1, -- rune_staff
            17461, 0.0800, 1, -- rune_rod
            18084, 0.1200, 1, -- rune_halberd
            17158, 0.1600, 1, -- rune_bow
            16563, 0.2000, 1, -- rune_blade
            12742, 0.2400, 1, -- rune_bangles
            16647, 0.2800, 1, -- rune_axe
            18206, 0.3200, 1, -- rune_chopper
            16408, 0.3600, 1, -- rune_baghnakhs
              221, 0.4000, 1, -- arcane_flowerpot
            17333, 0.5200, 6, -- rune_arrow
             1229, 0.7000, 2, -- adaman_nugget
              931, 1.0000, 8, -- cermet_chunk
        },
	    af_drop =
	    {
	       waist = 1,	
	    },
    },
}

local af_map =
{
	[dsp.job.WAR] = {items = {head = 15072, body = 15087, hands = 15102, legs = 15117, feet = 15132, back = 0, waist = 15871}},
	[dsp.job.MNK] = {items = {head = 15073, body = 15088, hands = 15103, legs = 15118, feet = 15133, back = 15478, waist = 0}},
	[dsp.job.WHM] = {items = {head = 15074, body = 15089, hands = 15104, legs = 15119, feet = 15134, back = 0, waist = 15872}},
	[dsp.job.BLM] = {items = {head = 15075, body = 15090, hands = 15105, legs = 15120, feet = 15135, back = 0, waist = 15874}},
	[dsp.job.RDM] = {items = {head = 15076, body = 15091, hands = 15106, legs = 15121, feet = 15136, back = 0, waist = 15873}},
	[dsp.job.THF] = {items = {head = 15077, body = 15092, hands = 15107, legs = 15122, feet = 15137, back = 15480, waist = 0}},
	[dsp.job.PLD] = {items = {head = 15078, body = 15093, hands = 15108, legs = 15123, feet = 15138, back = 15481, waist = 0}},
	[dsp.job.DRK] = {items = {head = 15079, body = 15094, hands = 15109, legs = 15124, feet = 15139, back = 15479, waist = 0}},
	[dsp.job.BST] = {items = {head = 15080, body = 15095, hands = 15110, legs = 15125, feet = 15140, back = 0, waist = 15875}},
	[dsp.job.BRD] = {items = {head = 15081, body = 15096, hands = 15111, legs = 15126, feet = 15141, back = 15482, waist = 0}},
	[dsp.job.RNG] = {items = {head = 15082, body = 15097, hands = 15112, legs = 15127, feet = 15142, back = 0, waist = 15876}},
	[dsp.job.SAM] = {items = {head = 15083, body = 15098, hands = 15113, legs = 15128, feet = 15143, back = 0, waist = 15879}},
	[dsp.job.NIN] = {items = {head = 15084, body = 15099, hands = 15114, legs = 15129, feet = 15144, back = 0, waist = 15877}},
	[dsp.job.DRG] = {items = {head = 15085, body = 15100, hands = 15115, legs = 15130, feet = 15145, back = 0, waist = 15878}},
	[dsp.job.SMN] = {items = {head = 15086, body = 15101, hands = 15116, legs = 15131, feet = 15146, back = 15484, waist = 0}},
	[dsp.job.BLU] = {items = {head = 11465, body = 11292, hands = 15025, legs = 16346, feet = 11382, back = 16244, waist = 0}},
	[dsp.job.COR] = {items = {head = 11468, body = 11295, hands = 15028, legs = 16349, feet = 11385, back = 0, waist = 15920}},
	[dsp.job.PUP] = {items = {head = 11471, body = 11298, hands = 15031, legs = 16352, feet = 11388, back = 16245, waist = 0}},
	[dsp.job.DNC] = {items = {head = 11478, body = 11305, hands = 15038, legs = 16360, feet = 11396, back = 16248, waist = 0}},
	[dsp.job.SCH] = {items = {head = 11480, body = 11307, hands = 15040, legs = 16362, feet = 11398, back = 0, waist = 15925}},
}

------------------------------------
-- Doctor status functions
------------------------------------

local function addDoctorStatus(player)
    local data = strAppData[player:getZoneID()]
    player:setCharVar("StrangeApparatusDoctorStatus" .. data.suffix, os.time() + 172800) -- 2 days
end

local function delDoctorStatus(player)
    local data = strAppData[player:getZoneID()]
    player:setCharVar("StrangeApparatusDoctorStatus" .. data.suffix, 0)
end

local function hasDoctorStatus(player)
    local data = strAppData[player:getZoneID()]
    local docStatusExpires = player:getCharVar("StrangeApparatusDoctorStatus" .. data.suffix)

    if docStatusExpires ~= 0 then
        if os.time() <= docStatusExpires then
            return true
        else
            player:setCharVar("StrangeApparatusDoctorStatus" .. data.suffix, 0)
        end
    end

    return false
end

------------------------------------
-- Password functions
------------------------------------

local function ltrVal(letter)
    for x = 1, 26 do
        if letter == string.sub("abcdefghijklmnopqrstuvwxyz", x, x) then
            return x - 1
        end
    end
end

local function generatePassword(player)
    local data = strAppData[player:getZoneID()]
    local name = string.lower(player:getName())
    return string.format(
        "%02d%02d%02d%02d",
        ltrVal(string.sub(name, 1, 1)) + data.uid,
        ltrVal(string.sub(name, 2, 2)) + data.uid,
        ltrVal(string.sub(name, 3, 3)) + data.uid,
        string.sub(ltrVal(string.sub(name, 1, 1)) + ltrVal(string.sub(name, 2, 2)) + ltrVal(string.sub(name, 3, 3)) + data.uid * 4, -2, -1)
    )
end

------------------------------------
-- strangeApparatus object
------------------------------------

dsp.strangeApparatus =
{
    onTrade = function(player, trade, eventId)
        local zone = player:getZoneID()
        local ID = zones[zone]
        local data = strAppData[zone]
        local drops = data.drop
        local foundChip = false
        local foundOre = false
        local mjob = player:getMainJob()
        local pJobMap = af_map[mjob]
        local afdrop = data.af_drop

        for chipTraded = RED_CHIP, BLACK_CHIP do
            if npcUtil.tradeHasExactly(trade, {INFINITY_CORE, chipTraded}) then
                player:confirmTrade()
                foundChip = true

                -- player traded a chip that matches this zone
                if chipTraded == data.chip then
		        printf("X")

                    -- determine drop
                    local rate = math.random()
                    local item = nil
                    local qty  = nil

                    for drop = 1, #drops, 3 do
                        if rate <= drops[drop + 1] then
                            item = drops[drop]
                            qty  = drops[drop + 2]
                            break
                        end
                    end

                    if not hasDoctorStatus(player) and math.random() < 0.5 then
                        item = data.cluster -- give clusters instead of reward
                        qty  = 2
                    end

                    player:setLocalVar("strAppDrop", item)
                    player:setLocalVar("strAppDropQty", qty)

                    -- start event
                    local doctorStatus = hasDoctorStatus(player) and 1 or 0
                    player:startEvent(eventId, item, qty, INFINITY_CORE, 0, 0, 0, doctorStatus, 0)

                -- player traded a chip that does not match this zone. spawn elemental that matches apparatus.
                else
                    player:addItem(INFINITY_CORE, 1)
                    player:messageSpecial(ID.text.SYS_OVERLOAD)
                    player:messageSpecial(ID.text.YOU_LOST_THE, chipTraded)
                    delDoctorStatus(player)
                    SpawnMob(ID.mob.APPARATUS_ELEMENTAL):updateEnmity(player)
                    player:setHP(1)
                end

                break
            end

            for oreTraded = FIRE_ORE, DARK_ORE do
            	if npcUtil.tradeHasExactly(trade, {INFINITY_CORE, chipTraded, oreTraded}) then
                	player:confirmTrade()
                	foundChip = true
                	foundOre = true
                	printf("Y")

                	-- player traded a chip and ore that matches this zone
                	if chipTraded == data.chip and oreTraded == data.ore then

	                    -- determine drop
        	            if (afdrop.head == 1) then
				            item = pJobMap.items.head
				            qty = 1
			            elseif (afdrop.body == 1) then
				            item = pJobMap.items.body
				            qty = 1
		                elseif (afdrop.hands == 1) then
				            item = pJobMap.items.hands
				            qty = 1
			            elseif (afdrop.legs == 1) then
				            item = pJobMap.items.legs
				            qty = 1
			            elseif (afdrop.feet == 1) then
				            item = pJobMap.items.feet
				            qty = 1
			            elseif (afdrop.back == 1) then
				            item = pJobMap.items.back
				            qty = 1
			            elseif (afdrop.waist == 1) then
				            item = pJobMap.items.waist
				            qty = 1
                    	end

                    	player:setLocalVar("strAppDrop", item)
                    	player:setLocalVar("strAppDropQty", qty)

	                    -- start event
        	            local doctorStatus = hasDoctorStatus(player) and 1 or 0
                	    player:startEvent(eventId, item, qty, INFINITY_CORE, 0, 0, 0, doctorStatus, 0)

                	-- player traded a chip that does not match this zone. spawn elemental that matches apparatus.
                	else
                    	player:addItem(INFINITY_CORE, 1)
                        player:messageSpecial(ID.text.SYS_OVERLOAD)
                       	player:messageSpecial(ID.text.YOU_LOST_THE, chipTraded)
                    	delDoctorStatus(player)
                    	SpawnMob(ID.mob.APPARATUS_ELEMENTAL):updateEnmity(player)
                        player:setHP(1)
                	end
                end
	        end
        end

        -- player traded something other than a chip. message and delete doctor status.
        if not foundChip then
            delDoctorStatus(player)
            player:messageSpecial(ID.text.DEVICE_NOT_WORKING)
            printf("Z")
        end
    end,

    ------------------------------------

    onTrigger = function(player, eventId)
        local doctorStatus = 0
        if hasDoctorStatus(player) then
            doctorStatus = 1
        else
            player:setLocalVar("strAppPass", 1)
        end

        player:startEvent(eventId, doctorStatus, 0, INFINITY_CORE, 0, 0, 0, 0, player:getZoneID())
    end,

    ------------------------------------

    onEventUpdate = function(player, option)
        if not hasDoctorStatus(player) then
            local doctorStatus = 1
            if option == generatePassword(player) then -- good password
                doctorStatus = 0
                addDoctorStatus(player)
            end
            player:updateEvent(doctorStatus, 0, INFINITY_CORE, 0, 0, 0, 0, 0)
        end
    end,

    ------------------------------------

    onEventFinish = function(player)
        local item = player:getLocalVar("strAppDrop")
        local qty = player:getLocalVar("strAppDropQty")
        local zone = player:getZoneID()
        local ID = zones[zone]

        if item ~= 0 then
            if qty == 0 then
                qty = 1
            end

            if npcUtil.giveItem(player, {{item, qty}}) then
                player:setLocalVar("strAppDrop", 0)
                player:setLocalVar("strAppDropQty", 0)
            end
        else
             SpawnMob(ID.mob.APPARATUS_ELEMENTAL):updateEnmity(player)
             player:setHP(1)
             printf("A")
        end
    end,
}
