-----------------------------------
-- Area: Port Windurst
--  NPC: Odyssean Passage
-- Working 100%
-----------------------------------
local ID = require("scripts/zones/Port_Windurst/IDs")
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
	local pCP = player:getCP()
	local staff = 0

	if (trade:hasItemQty(1261,2) and trade:hasItemQty(1262,2)) then
		player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED);
	
	elseif (pCP >= 250000 and trade:hasItemQty(1261,2) and trade:hasItemQty(17557,1) and
		trade:getItemCount() == 3) then

              	staff = 17558
		player:tradeComplete();
    		player:addItem(staff);
       		player:delCP(250000);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,staff);

	elseif (pCP >= 250000 and trade:hasItemQty(1262,2) and trade:hasItemQty(17559,1) and
		trade:getItemCount() == 3) then

		staff = 17560
		player:tradeComplete();
    		player:addItem(staff);
       		player:delCP(250000);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,staff);

        else
		player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED);
	end	
end;

function onTrigger(player,npc)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;