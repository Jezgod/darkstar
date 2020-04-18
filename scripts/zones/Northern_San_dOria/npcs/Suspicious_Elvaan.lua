-----------------------------------
--  Area: Northern San d'Oria
--  NPC: Suspicious Elvaan
--  Working 100%
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs")
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
	local mjob = player:getMainJob()
        local pLevel = player:getMainLvl()
	local pCP = player:getCP()
	local rCP = 1000000
	local item = 0

	if (trade:getItemCount() ~= 24 or trade:getGil() ~= 0) then
		player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED);
	
	--MNK RELIC: SPHARAI (LIGHT/FIRE)
	elseif (mjob == dsp.job.MNK and pLevel == 75 and pCP >= rCP and 
                trade:hasItemQty(1261,12) and 
                trade:hasItemQty(1255,12) and 
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then

              	item = 18264
		player:tradeComplete();
    		player:addItem(item);
       		player:delCP(rCP);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,item);

	--RDM/PLD RELIC: EXCALIBUR (LIGHT/FIRE)
	elseif ((mjob == dsp.job.RDM or mjob == dsp.job.PLD) and pLevel == 75 and pCP >= rCP and 
                trade:hasItemQty(1261,12) and 
                trade:hasItemQty(1255,12) and
                trade:getItemCount() == 24 and
            	trade:getGil() == 0) then

              	item = 18276
		player:tradeComplete();
    		player:addItem(item);
       		player:delCP(rCP);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,item);

        --WAR RELIC: BRAVURA (LIGHT/FIRE)
	elseif (mjob == dsp.job.WAR and pLevel == 75 and pCP >= rCP and 
                trade:hasItemQty(1261,12) and 
                trade:hasItemQty(1255,12) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then              	

		item = 18294
		player:tradeComplete();
    		player:addItem(item);
       		player:delCP(rCP);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,item);

        --DRK RELIC: APOCALYPSE (DARK/EARTH)
	elseif (mjob == dsp.job.DRK and pLevel == 75 and pCP >= rCP and 
                trade:hasItemQty(1262,12) and 
                trade:hasItemQty(1258,12) and
        	trade:getItemCount() == 24 and
            	trade:getGil() == 0) then      	
	
		item = 18306
		player:tradeComplete();
    		player:addItem(item);
       		player:delCP(rCP);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,item);

        --NIN RELIC: KIKOKU (THUNDER/WIND)
	elseif (mjob == dsp.job.NIN and pLevel == 75 and pCP >= rCP and 
	        trade:hasItemQty(1259,12) and 
                trade:hasItemQty(1257,12) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then              	

		item = 18312
		player:tradeComplete();
    		player:addItem(item);
       		player:delCP(rCP);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,item);

        --WHM RELIC: MJOLLNIR (THUNDER/WIND)
	elseif (mjob == dsp.job.WHM and pLevel == 75 and pCP >= rCP and 
                trade:hasItemQty(1259,12) and 
                trade:hasItemQty(1257,12) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then              	

		item = 18324
		player:tradeComplete();
    		player:addItem(item);
       		player:delCP(rCP);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,item);

        --RNG/SAM RELIC: YOICHINOYUMI (ICE/WATER)
	elseif ((mjob == dsp.job.RNG or mjob == dsp.job.SAM) and pLevel == 75 and pCP >= rCP and 
                trade:hasItemQty(1256,12) and 
                trade:hasItemQty(1260,12) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then              	

		item = 18348
		player:tradeComplete();
    		player:addItem(item);
       		player:delCP(rCP);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,item);

        --BRD RELIC: GJALLAHORN (LIGHT/DARK)
	elseif (mjob == dsp.job.BRD and pLevel == 75 and pCP >= rCP and 
                trade:hasItemQty(1261,12) and 
                trade:hasItemQty(1262,12) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then              	

		item = 18342
		player:tradeComplete();
    		player:addItem(item);
       		player:delCP(rCP);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,item);

        else
		player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED);
	end
end;

function onTrigger(player,npc)
	player:PrintToPlayer( string.format("Obtain Relic Weapons Here...") )
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;