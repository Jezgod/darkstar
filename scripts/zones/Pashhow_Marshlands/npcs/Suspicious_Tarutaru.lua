-----------------------------------
-- Area: Port Windurst
--  NPC: Suspicious Tarutaru
-- Working 100%
-----------------------------------
local ID = require("scripts/zones/Port_Windurst/IDs")
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
	local pCP = player:getCP()
	local staff = 0

	if (trade:hasItemQty(1261,1) and trade:hasItemQty(1262,1)) then
		player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED);
	
	elseif (pCP >= 250000 and trade:hasItemQty(1261,1)) then
              	staff = 17557
		player:tradeComplete();
    		player:addItem(staff);
       		player:delCP(250000);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,staff);

	elseif (pCP >= 250000 and trade:hasItemQty(1262,1)) then
		staff = 17559
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