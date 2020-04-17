-----------------------------------
--  Area: Pashhow Marshlands
--  NPC: Suspicious Hume
--  Working 100%
-----------------------------------
local ID = require("scripts/zones/Pashhow_Marshlands/IDs")
require("scripts/globals/settings");
-----------------------------------

local mythic_map =
{
	[dsp.job.WAR] = {items = {weapon = 18991, ore1 = 1259, ore2 = 1257}},
	[dsp.job.MNK] = {items = {weapon = 18992, ore1 = 1261, ore2 = 1255}},
	[dsp.job.WHM] = {items = {weapon = 18993, ore1 = 1261, ore2 = 1262}},
	[dsp.job.BLM] = {items = {weapon = 18994, ore1 = 1259, ore2 = 1257}},
	[dsp.job.RDM] = {items = {weapon = 18995, ore1 = 1259, ore2 = 1257}},
	[dsp.job.THF] = {items = {weapon = 18996, ore1 = 1261, ore2 = 1255}},
	[dsp.job.PLD] = {items = {weapon = 18997, ore1 = 1261, ore2 = 1255}},
	[dsp.job.DRK] = {items = {weapon = 18998, ore1 = 1261, ore2 = 1255}},
	[dsp.job.BST] = {items = {weapon = 18999, ore1 = 1262, ore2 = 1258}},
	[dsp.job.BRD] = {items = {weapon = 19000, ore1 = 1259, ore2 = 1257}},
	[dsp.job.RNG] = {items = {weapon = 19001, ore1 = 1257, ore2 = 1259}},
	[dsp.job.SAM] = {items = {weapon = 19002, ore1 = 1262, ore2 = 1258}},
	[dsp.job.NIN] = {items = {weapon = 19003, ore1 = 1259, ore2 = 1257}},
	[dsp.job.DRG] = {items = {weapon = 19004, ore1 = 1261, ore2 = 1255}},
	[dsp.job.SMN] = {items = {weapon = 19005, ore1 = 1261, ore2 = 1255}},
	[dsp.job.BLU] = {items = {weapon = 19006, ore1 = 1256, ore2 = 1260}},
	[dsp.job.COR] = {items = {weapon = 19007, ore1 = 1262, ore2 = 1258}},
	[dsp.job.PUP] = {items = {weapon = 19008, ore1 = 1262, ore2 = 1258}},
	[dsp.job.DNC] = {items = {weapon = 18989, ore1 = 1256, ore2 = 1260}},
	[dsp.job.SCH] = {items = {weapon = 18990, ore1 = 1262, ore2 = 1258}},
}

function onTrade(player,npc,trade)
	local mjob = player:getMainJob()
        local pJobMap = mythic_map[mjob]
        local pLevel = player:getMainLvl()
        local currency = "imperial_standing"
	local pIS = player:getCurrency(currency)
        local rIS = 2000000
        local item1Count = 12
        local item2Count = 12

	if (trade:getItemCount() ~= 24 or trade:getGil() ~= 0) then
		player:messageSpecial(ID.text.NOTHING_HAPPENS);
	
	--WAR MYTHIC: CONQUEROR (THUNDER/WIND)
	elseif (mjob == dsp.job.WAR and pLevel == 75 and pIS >= rIS and 
                trade:hasItemQty(pJobMap.items.ore1,item1Count) and 
		trade:hasItemQty(pJobMap.items.ore2,item2Count) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then
              	
		player:tradeComplete();
    		player:addItem(pJobMap.items.weapon);
       		player:delCurrency(currency,rIS);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,pJobMap.items.weapon);

	--MNK MYTHIC: GLANZFAUST (LIGHT/FIRE)
	elseif (mjob == dsp.job.MNK and pLevel == 75 and pIS >= rIS and 
                trade:hasItemQty(pJobMap.items.ore1,item1Count) and 
		trade:hasItemQty(pJobMap.items.ore2,item2Count) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then
              	
		player:tradeComplete();
    		player:addItem(pJobMap.items.weapon);
       		player:delCurrency(currency,rIS);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,pJobMap.items.weapon);

        --WHM MYTHIC: YAGRUSH (LIGHT/DARK)
	elseif (mjob == dsp.job.WHM and pLevel == 75 and pIS >= rIS and 
		trade:hasItemQty(pJobMap.items.ore1,item1Count) and 
		trade:hasItemQty(pJobMap.items.ore2,item2Count) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then
              	
		player:tradeComplete();
    		player:addItem(pJobMap.items.weapon);
       		player:delCurrency(currency,rIS);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,pJobMap.items.weapon);

        --BLM MYTHIC: LAEVATEINN (THUNDER/WIND)
	elseif (mjob == dsp.job.BLM and pLevel == 75 and pIS >= rIS and 
		trade:hasItemQty(pJobMap.items.ore1,item1Count) and 
		trade:hasItemQty(pJobMap.items.ore2,item2Count) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then
              	
		player:tradeComplete();
    		player:addItem(pJobMap.items.weapon);
       		player:delCurrency(currency,rIS);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,pJobMap.items.weapon);

        --RDM MYTHIC: MURGLEIS (THUNDER/WIND)
	elseif (mjob == dsp.job.RDM and pLevel == 75 and pIS >= rIS and 
		trade:hasItemQty(pJobMap.items.ore1,item1Count) and 
		trade:hasItemQty(pJobMap.items.ore2,item2Count) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then
              	
		player:tradeComplete();
    		player:addItem(pJobMap.items.weapon);
       		player:delCurrency(currency,rIS);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,pJobMap.items.weapon);

        --THF MYTHIC: VAJRA (LIGHT/FIRE)
	elseif (mjob == dsp.job.THF and pLevel == 75 and pIS >= rIS and 
		trade:hasItemQty(pJobMap.items.ore1,item1Count) and 
		trade:hasItemQty(pJobMap.items.ore2,item2Count) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then
              	
		player:tradeComplete();
    		player:addItem(pJobMap.items.weapon);
       		player:delCurrency(currency,rIS);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,pJobMap.items.weapon);

        --PLD MYTHIC: BURTGANG (LIGHT/FIRE)
	elseif (mjob == dsp.job.PLD and pLevel == 75 and pIS >= rIS and 
		trade:hasItemQty(pJobMap.items.ore1,item1Count) and 
		trade:hasItemQty(pJobMap.items.ore2,item2Count) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then
              	
		player:tradeComplete();
    		player:addItem(pJobMap.items.weapon);
       		player:delCurrency(currency,rIS);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,pJobMap.items.weapon);

        --DRK MYTHIC: LIBERATOR (LIGHT/FIRE)
	elseif (mjob == dsp.job.DRK and pLevel == 75 and pIS >= rIS and 
		trade:hasItemQty(pJobMap.items.ore1,item1Count) and 
		trade:hasItemQty(pJobMap.items.ore2,item2Count) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then
              	
		player:tradeComplete();
    		player:addItem(pJobMap.items.weapon);
       		player:delCurrency(currency,rIS);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,pJobMap.items.weapon);

        --BST MYTHIC: AYMUR (DARK/EARTH)
	elseif (mjob == dsp.job.BST and pLevel == 75 and pIS >= rIS and 
		trade:hasItemQty(pJobMap.items.ore1,item1Count) and 
		trade:hasItemQty(pJobMap.items.ore2,item2Count) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then
              	
		player:tradeComplete();
    		player:addItem(pJobMap.items.weapon);
       		player:delCurrency(currency,rIS);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,pJobMap.items.weapon);

        --BRD MYTHIC: CARNWENHAN (THUNDER/WIND)
	elseif (mjob == dsp.job.BRD and pLevel == 75 and pIS >= rIS and 
		trade:hasItemQty(pJobMap.items.ore1,item1Count) and 
		trade:hasItemQty(pJobMap.items.ore2,item2Count) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then
              	
		player:tradeComplete();
    		player:addItem(pJobMap.items.weapon);
       		player:delCurrency(currency,rIS);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,pJobMap.items.weapon);

        --RNG MYTHIC: GASTRAPHETES (THUNDER/WIND)
	elseif (mjob == dsp.job.RNG and pLevel == 75 and pIS >= rIS and 
                trade:hasItemQty(pJobMap.items.ore1,item1Count) and 
		trade:hasItemQty(pJobMap.items.ore2,item2Count) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then
              	
		player:tradeComplete();
    		player:addItem(pJobMap.items.weapon);
       		player:delCurrency(currency,rIS);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,pJobMap.items.weapon);
 
        --SAM MYTHIC: KOGARASUMARU (DARK/EARTH)
	elseif (mjob == dsp.job.SAM and pLevel == 75 and pIS >= rIS and 
                trade:hasItemQty(pJobMap.items.ore1,item1Count) and 
		trade:hasItemQty(pJobMap.items.ore2,item2Count) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then
              	
		player:tradeComplete();
    		player:addItem(pJobMap.items.weapon);
       		player:delCurrency(currency,rIS);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,pJobMap.items.weapon);

        --NIN MYTHIC: NAGI (THUNDER/WIND)
	elseif (mjob == dsp.job.NIN and pLevel == 75 and pIS >= rIS and 
                trade:hasItemQty(pJobMap.items.ore1,item1Count) and 
		trade:hasItemQty(pJobMap.items.ore2,item2Count) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then
              	
		player:tradeComplete();
    		player:addItem(pJobMap.items.weapon);
       		player:delCurrency(currency,rIS);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,pJobMap.items.weapon);

        --DRG MYTHIC: RYUNOHIGE (LIGHT/FIRE)
	elseif (mjob == dsp.job.DRG and pLevel == 75 and pIS >= rIS and 
                trade:hasItemQty(pJobMap.items.ore1,item1Count) and 
		trade:hasItemQty(pJobMap.items.ore2,item2Count) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then
              	
		player:tradeComplete();
    		player:addItem(pJobMap.items.weapon);
       		player:delCurrency(currency,rIS);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,pJobMap.items.weapon);

        --SMN MYTHIC: NIRVANA (LIGHT/FIRE)
	elseif (mjob == dsp.job.SMN and pLevel == 75 and pIS >= rIS and 
                trade:hasItemQty(pJobMap.items.ore1,item1Count) and 
		trade:hasItemQty(pJobMap.items.ore2,item2Count) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then
              	
		player:tradeComplete();
    		player:addItem(pJobMap.items.weapon);
       		player:delCurrency(currency,rIS);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,pJobMap.items.weapon);

        --BLU MYTHIC: TIZONA (ICE/WATER)
	elseif (mjob == dsp.job.BLU and pLevel == 75 and pIS >= rIS and 
                trade:hasItemQty(pJobMap.items.ore1,item1Count) and 
		trade:hasItemQty(pJobMap.items.ore2,item2Count) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then
              	
		player:tradeComplete();
    		player:addItem(pJobMap.items.weapon);
       		player:delCurrency(currency,rIS);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,pJobMap.items.weapon);

        --COR MYTHIC: DEATH PENALTY (DARK/EARTH)
	elseif (mjob == dsp.job.COR and pLevel == 75 and pIS >= rIS and 
                trade:hasItemQty(pJobMap.items.ore1,item1Count) and 
		trade:hasItemQty(pJobMap.items.ore2,item2Count) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then
              	
		player:tradeComplete();
    		player:addItem(pJobMap.items.weapon);
       		player:delCurrency(currency,rIS);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,pJobMap.items.weapon);

        --PUP MYTHIC: KENKONKEN (DARK/EARTH)
	elseif (mjob == dsp.job.PUP and pLevel == 75 and pIS >= rIS and 
                trade:hasItemQty(pJobMap.items.ore1,item1Count) and 
		trade:hasItemQty(pJobMap.items.ore2,item2Count) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then
              	
		player:tradeComplete();
    		player:addItem(pJobMap.items.weapon);
       		player:delCurrency(currency,rIS);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,pJobMap.items.weapon);

        --DNC MYTHIC: TERPSICHORE (ICE/WATER)
	elseif (mjob == dsp.job.DNC and pLevel == 75 and pIS >= rIS and 
                trade:hasItemQty(pJobMap.items.ore1,item1Count) and 
		trade:hasItemQty(pJobMap.items.ore2,item2Count) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then
              	
		player:tradeComplete();
    		player:addItem(pJobMap.items.weapon);
       		player:delCurrency(currency,rIS);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,pJobMap.items.weapon);

        --SCH MYTHIC: TUPSIMATI (DARK/EARTH)
	elseif (mjob == dsp.job.SCH and pLevel == 75 and pIS >= rIS and 
                trade:hasItemQty(pJobMap.items.ore1,item1Count) and 
		trade:hasItemQty(pJobMap.items.ore2,item2Count) and
		trade:getItemCount() == 24 and
            	trade:getGil() == 0) then
              	
		player:tradeComplete();
    		player:addItem(pJobMap.items.weapon);
       		player:delCurrency(currency,rIS);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,pJobMap.items.weapon);
        
        else
		player:messageSpecial(ID.text.NOTHING_HAPPENS);
	end
end;

function onTrigger(player,npc)
	player:PrintToPlayer( string.format("Obtain Mythic Weapons Here...") )
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;