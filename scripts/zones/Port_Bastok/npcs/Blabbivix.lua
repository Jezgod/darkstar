-----------------------------------
-- Area: Port Bastok
--  NPC: Blabbivix
-- Standard merchant, though he acts like a guild merchant
-- !pos -110.209 4.898 22.957 236
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
local ID = require("scripts/zones/Port_Bastok/IDs");
-----------------------------------

function onTrade(player,npc,trade)
    local pLevel = player:getMainLvl()
    local cost = 500000
    local pCP = player:getCP()
    local rCP = 250000
    local item = 1474
    local FreeSlots = player:getFreeSlotsCount();

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
    if (player:sendGuild(60418,11,22,3)) then
        player:showText(npc,ID.text.BLABBIVIX_SHOP_DIALOG);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
