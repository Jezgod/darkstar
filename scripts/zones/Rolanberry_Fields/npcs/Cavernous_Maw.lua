-----------------------------------
-- Area: Rolanberry Fields
--  NPC: Cavernous Maw
-- !pos -198 8 361 110
-- Teleports Players to Rolanberry Fields [S]
-----------------------------------
local ID = require("scripts/zones/Rolanberry_Fields/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/maws")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    --local hasFeather = player:hasKeyItem(dsp.ki.PURE_WHITE_FEATHER)
    --if not hasFeather then
	--player:messageSpecial(ID.text.NOTHING_HAPPENS)
    --else
        dsp.maws.onTrigger(player, npc)
    --end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    dsp.maws.onEventFinish(player, csid, option)
end