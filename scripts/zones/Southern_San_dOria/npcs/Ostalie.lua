-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Ostalie
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/conquest")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/shop")

local crystal = {4096, 4099, 4101, 4098, 4097, 4100, 4102, 4103}

function onTrade(player,npc,trade)
    if player:getQuestStatus(SANDORIA, dsp.quest.id.sandoria.FLYERS_FOR_REGINE) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 532) then
        player:messageSpecial(ID.text.FLYER_REFUSED)
    end
end

function onTrigger(player,npc)
    local stock =
    {
        4128,  4445, 1,    -- Ether
        4112,   837, 1,    -- Potion
        4151,   736, 2,    -- Echo Drops
        4148,   290, 3,    -- Antidote
        12472,  144, 3,    -- Circlet
        12728,  118, 3,    -- Cuffs
        4150,  2387, 3,    -- Eye Drops
        1021,   450, 3,    -- Hatchet
        13192,  382, 3,    -- Leather Belt
        13193, 2430, 3,    -- Lizard Belt
        605,    180, 3,    -- Pickaxe
        12600,  216, 3,    -- Robe
        12856,  172, 3,    -- Slops
        17343,   14, 3,    -- Bronze Bullet
         5493, 6320, 3,    -- Corsair Die
    }

    local rank = getNationRank(dsp.nation.SANDORIA)
    local pRank = player:getRank()

    if rank ~= 1 then
        table.insert(stock,1022)    -- Thief's Tools
        table.insert(stock,3643)
        table.insert(stock,3)

    elseif rank == 3 then
        table.insert(stock,1023)    -- Living Key
        table.insert(stock,5520)
        table.insert(stock,3)
    end

     if (rank == 1 and pRank >=5) then
   	local daily_crystal = 0
	daily_crystal = crystal[VanadielDayElement() + 1]
        table.insert(stock, daily_crystal)    --Crystal of the Day
        table.insert(stock, 5000)
        table.insert(stock, 1)
    end

    player:showText(npc, ID.text.OSTALIE_SHOP_DIALOG)
    dsp.shop.nation(player, stock, dsp.nation.SANDORIA)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
