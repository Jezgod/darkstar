-----------------------------------
--  Area: Port Bastok
--  NPC: Suspicious Galka
--  Working 100%
-----------------------------------
local ID = require("scripts/zones/Port_Bastok/IDs")
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
	local mjob = player:getMainJob()
        local pLevel = player:getMainLvl()
	local pCP = player:getCP()
	local item = 0

	if (trade:getItemCount() ~= 24 or trade:getGil() ~= 0) then
		player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED);
	
	--RDM/THF/BRD RELIC: MANDAU (DARK/EARTH)
	elseif ((mjob == dsp.job.RDM or mjob == dsp.job.THF or mjob == dsp.job.BRD) and pLevel == 75 and pCP >= 1000000 and 
                trade:hasItemQty(1262,12) and 
	   	trade:hasItemQty(1258,12) and 
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then

              	item = 18270
		player:tradeComplete();
    		player:addItem(item);
       		player:delCP(1000000);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,item);

	--WAR/PLD/DRK RELIC: RAGNAROK (LIGHT/FIRE)
	elseif ((mjob == dsp.job.WAR or mjob == dsp.job.PLD or mjob == dsp.job.DRK) and pLevel == 75 and pCP >= 1000000 and 
                trade:hasItemQty(1261,12) and 
		trade:hasItemQty(1255,12) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then
              	
		item = 18282
		player:tradeComplete();
    		player:addItem(item);
       		player:delCP(1000000);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,item);

        --BST RELIC: GUTTLER (DARK/EARTH)
	elseif (mjob == dsp.job.BST and pLevel == 75 and pCP >= 1000000 and 
		trade:hasItemQty(1262,12) and 
		trade:hasItemQty(1258,12) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then

              	item = 18288
		player:tradeComplete();
    		player:addItem(item);
       		player:delCP(1000000);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,item);

        --DRG RELIC: GUNGNIR (ICE/WATER)
	elseif (mjob == dsp.job.DRG and pLevel == 75 and pCP >= 1000000 and 
		trade:hasItemQty(1260,12) and 
		trade:hasItemQty(1256,12) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then
              	
		item = 18300
		player:tradeComplete();
    		player:addItem(item);
       		player:delCP(1000000);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,item);

        --SAM RELIC: AMANOMURAKUMO (THUNDER/WIND)
	elseif (mjob == dsp.job.SAM and pLevel == 75 and pCP >= 1000000 and 
		trade:hasItemQty(1259,12) and 
		trade:hasItemQty(1257,12) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then
              	
		item = 18318
		player:tradeComplete();
    		player:addItem(item);
       		player:delCP(1000000);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,item);

        --BLM/SMN RELIC: CLAUSTRUM (ICE/WATER)
	elseif ((mjob == dsp.job.BLM or mjob == dsp.job.SMN) and pLevel == 75 and pCP >= 1000000 and 
		trade:hasItemQty(1256,12) and 
		trade:hasItemQty(1260,12) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then
              				
		item = 18330
		player:tradeComplete();
    		player:addItem(item);
       		player:delCP(1000000);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,item);

        --RNG RELIC: ANNIHILATOR (THUNDER/WIND)
	elseif (mjob == dsp.job.RNG and pLevel == 75 and pCP >= 1000000 and 
		trade:hasItemQty(1259,12) and 
		trade:hasItemQty(1257,12) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then
              	
		item = 18336
		player:tradeComplete();
    		player:addItem(item);
       		player:delCP(1000000);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,item);

        --PLD RELIC: AEGIS (LIGHT/DARK)
	elseif (mjob == dsp.job.PLD and pLevel == 75 and pCP >= 1000000 and 
		trade:hasItemQty(1261,12) and 
		trade:hasItemQty(1262,12) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then
              	
		item = 15070
		player:tradeComplete();
    		player:addItem(item);
       		player:delCP(1000000);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,item);

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