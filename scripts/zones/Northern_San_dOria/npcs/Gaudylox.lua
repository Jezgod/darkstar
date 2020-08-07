-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Gaudylox
-- Standard merchant, though he acts like a guild merchant
-- !pos -147.593 11.999 222.550 231
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    local FlyerForRegine = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.FLYERS_FOR_REGINE);
    local pLevel = player:getMainLvl()
    local cost = 500000
    local pCP = player:getCP()
    local rCP = 250000
    local item = 1474
    local FreeSlots = player:getFreeSlotsCount();

    if (FlyerForRegine == 1) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(ID.text.FLYER_REFUSED);
        end
    end

    if (trade:getGil() == cost and pLevel >= 70 and pCP >= rCP and
        trade:getItemCount() == 1) then
        if (FreeSlots >= 1) then
	    player:tradeComplete();
    	    player:addItem(item);
            player:delCP(rCP);
            player:messageSpecial(ID.text.ITEM_OBTAINED,item);
        else
	    player:messageSpecial(ID.text.FULL_INVENTORY_AFTER_TRADE,1474);
        end
    else
	player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,item);
    end
end;

function onTrigger(player,npc)
    if (player:sendGuild(60418,11,22,0)) then
        player:showText(npc,ID.text.GAUDYLOX_SHOP_DIALOG);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
