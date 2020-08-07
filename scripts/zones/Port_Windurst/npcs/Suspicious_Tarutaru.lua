-----------------------------------
-- Area: Port Windurst
--  NPC: Suspicious Tarutaru
-- Working 100%
-----------------------------------
local ID = require("scripts/zones/Port_Windurst/IDs")
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
	local staff = 0

	if (trade:hasItemQty(1261,1) and trade:hasItemQty(1262,1)) then
		player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED);
	
	elseif (trade:getGil() == 250000 and trade:hasItemQty(1261,1) and
		trade:getItemCount() == 2) then

              	staff = 17557
		player:tradeComplete();
    		player:addItem(staff);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,staff);

	elseif (trade:getGil() == 250000 and trade:hasItemQty(1262,1) and
	  	trade:getItemCount() == 2) then

		staff = 17559
		player:tradeComplete();
    		player:addItem(staff);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,staff);

        else
		player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED);
	end
end;

function onTrigger(player,npc)
	player:PrintToPlayer( string.format("I can show you the power of light and dark..."),29 )
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;