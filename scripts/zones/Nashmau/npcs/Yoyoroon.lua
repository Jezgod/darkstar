-----------------------------------
-- Area: Nashmau
--  NPC: Yoyoroon
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Nashmau/IDs")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
        2239,  49400,    -- Tension Spring
        2243,  49400,    -- Loudspeaker
        2246,  49400,    -- Accelerator
        2251,  49400,    -- Armor Plate
        2254,  49400,    -- Stabilizer
        2258,  49400,    -- Mana Jammer
        2262,  49400,    -- Auto-Repair Kit
        2265,  98800,    -- Auto-Repair Kit II
        2266,  49400,    -- Mana Tank
        2240,  99250,    -- Inhibitor
        9229,  99250,    -- Speedloader
        2242,  99250,    -- Mana Booster
        2247,  99250,    -- Scope
        2250,  99250,    -- Shock Absorber
        2255,  99250,    -- Volt Gun
        2260,  99250,    -- Stealth Screen
        2264,  99250,    -- Damage Gauge
        2268,  99250,    -- Mana Conserver
        2238, 198900,    -- Strobe
        2409, 198900,    -- Flame Holder
        2410, 198900,    -- Ice Maker
        2248, 198900,    -- Pattern Reader
        2411, 198900,    -- Replicator
        2252, 198900,    -- Analyzer
        2256, 198900,    -- Heat Seeker
        2259, 198900,    -- Heatsink
        2263, 198900,    -- Flashbulb
        2267, 198900,    -- Mana Converter
         718,  50000,	 -- Rosewood Lumber
        2288,  50000,	 -- Karakul Cloth
         879,  50000,	 -- Karakul Leather
         823, 100000,	 -- Gold Thread
         828, 100000,	 -- Velvet Cloth
        2289, 100000,	 -- Wamoura Cloth
       13465, 100000,	 -- Brass Ring
         661, 200000,    -- Brass Sheet
        2173, 200000,	 -- Wamoura Cocoon
        2290, 200000,	 -- Imperial Cermet  
    }

    player:showText(npc, ID.text.YOYOROON_SHOP_DIALOG)
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
