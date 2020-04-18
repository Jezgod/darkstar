-----------------------------------
-- Area: Bastok Mines
--  NPC: Boytz
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Bastok_Mines/IDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")

local crystal = {4096, 4099, 4101, 4098, 4097, 4100, 4102, 4103}

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
        4128,  4445, 1,    --Ether
        4151,   736, 2,    --Echo Drops
        4112,   837, 2,    --Potion
        17318,    3, 2,    --Wooden Arrow
        217,    900, 3,    --Brass Flowerpot
        605,    180, 3,    --Pickaxe
        4150,  2387, 3,    --Eye Drops
        4148,   290, 3,    --Antidote
        17320,    7, 3,    --Iron Arrow
        17336,    5, 3,    --Crossbow Bolt
        17343,   14, 3,    --Bronze Bullet
         5493, 6320, 3,    --Corsair Die 
    }

    local rank = getNationRank(dsp.nation.BASTOK)
    local pRank = player:getRank()

    if (rank ~= 1) then
        table.insert(stock, 1022)    --Thief's Tools
        table.insert(stock, 3643)
        table.insert(stock, 3)
    end
    if (rank == 3) then
        table.insert(stock, 1023)    --Living Key
        table.insert(stock, 5520)
        table.insert(stock, 3)
    end

    if (rank == 1 and pRank >= 5) then
   	local daily_crystal = 0
	daily_crystal = crystal[VanadielDayElement() + 1]
        table.insert(stock, daily_crystal)    --Crystal of the Day
        table.insert(stock, 5000)
        table.insert(stock, 1)
    end

    player:showText(npc, ID.text.BOYTZ_SHOP_DIALOG)
    dsp.shop.nation(player, stock, dsp.nation.BASTOK)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
