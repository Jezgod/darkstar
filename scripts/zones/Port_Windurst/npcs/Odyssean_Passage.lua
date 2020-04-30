-----------------------------------
-- Area: Port Windurst
--  NPC: Odyssean Passage
-- Working 100%
-----------------------------------
local ID = require("scripts/zones/Port_Windurst/IDs")
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
	local staff = 0

	if (trade:hasItemQty(1261,5) and trade:hasItemQty(1262,5)) then
		player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED);
	
	elseif (trade:getGil() == 250000 and trade:hasItemQty(1261,10) and trade:hasItemQty(17557,1) and
		trade:getItemCount() == 12) then

              	staff = 17558
		player:tradeComplete();
    		player:addItem(staff);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,staff);

	elseif (trade:getGil() == 250000 and trade:hasItemQty(1262,10) and trade:hasItemQty(17559,1) and
		trade:getItemCount() == 12) then

		staff = 17560
		player:tradeComplete();
    		player:addItem(staff);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,staff);

        else
		player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED);
	end	
end;

function onTrigger(player,npc)
	player:PrintToPlayer( string.format("Increase the power of the light and dark...") )
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;