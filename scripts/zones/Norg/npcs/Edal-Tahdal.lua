-----------------------------------
-- Area: Norg
--  NPC: Edal-Tahdal
-- Starts and Finishes Quest: Trial by Water
-- !pos -13 1 -20 252
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
local ID = require("scripts/zones/Norg/IDs");
-----------------------------------

function onTrade(player,npc,trade)
    local ki = dsp.ki.WHISPER_OF_TIDES
    local whisper = player:hasKeyItem(ki);
    local name = "Whisper of Tides"
    local ore = 1260
    local oretype = "Water"
    local tradeCount = trade:getItemCount();
    local staff = 0
    local chance = 90
    
    printf("whisper? : %s",whisper)

    if (whisper == false) then
      player:PrintToPlayer( string.format("Please obtain the %s...", name ) )
      return 1
    end

    if (trade:getGil() ~= 250000) then
      player:PrintToPlayer( string.format("The cost is 250,000 G to produce the staff...") )
      return 1
    elseif (trade:getGil() == 250000 and tradeCount == 1) then
      player:PrintToPlayer( string.format("This action requires between 1 to 10 %s ores...", oretype) )
      return 1
    elseif (tradeCount > 11 or trade:confirmItem(ore) ~= true ) then
      player:PrintToPlayer( string.format("This action requires between 1 to 10 %s ores...", oretype) )
      return 1  
    end

    if npcUtil.tradeHas(trade, {{ore,10}}) then 
        chance = 0
    elseif npcUtil.tradeHas(trade, {{ore,9}}) then 
        chance = 10 
    elseif npcUtil.tradeHas(trade, {{ore,8}}) then 
        chance = 20
    elseif npcUtil.tradeHas(trade, {{ore,7}}) then 
        chance = 30
    elseif npcUtil.tradeHas(trade, {{ore,6}}) then 
        chance = 40
    elseif npcUtil.tradeHas(trade, {{ore,5}}) then 
        chance = 50
    elseif npcUtil.tradeHas(trade, {{ore,4}}) then 
        chance = 60
    elseif npcUtil.tradeHas(trade, {{ore,3}}) then 
        chance = 70
    elseif npcUtil.tradeHas(trade, {{ore,2}}) then 
        chance = 80 
    elseif npcUtil.tradeHas(trade, {{ore,1}}) then 
        chance = 90
    end

    if (math.random(100) < chance) then
	staff = 17555
    printf("Chance : %u",chance)
    else
	staff = 17556
    printf("Chance : %u",chance)
    end

    if (trade:getGil() == 250000 and 
        trade:hasItemQty(ore,10) or 
	trade:hasItemQty(ore,9) or 
	trade:hasItemQty(ore,8) or
	trade:hasItemQty(ore,7) or 
	trade:hasItemQty(ore,6) or 
	trade:hasItemQty(ore,5) or 
	trade:hasItemQty(ore,4) or 
	trade:hasItemQty(ore,3) or
	trade:hasItemQty(ore,2) or
	trade:hasItemQty(ore,1) and
        whisper == true) then

    	player:tradeComplete();
    	player:addItem(staff);
       	player:delKeyItem(ki);
    	player:messageSpecial(ID.text.ITEM_OBTAINED,staff);
        
	printf("item_count : %u",tradeCount)
        printf("whisper? : %s",whisper)
    else
	player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,staff);
    end
end;

function onTrigger(player,npc)

    local TrialByWater = player:getQuestStatus(OUTLANDS,dsp.quest.id.outlands.TRIAL_BY_WATER);
    local WhisperOfTides = player:hasKeyItem(dsp.ki.WHISPER_OF_TIDES);
    local realday = tonumber(os.date("%j")); -- %M for next minute, %j for next day

    if ((TrialByWater == QUEST_AVAILABLE and player:getFameLevel(NORG) >= 4) or (TrialByWater == QUEST_COMPLETED and realday ~= player:getCharVar("TrialByWater_date"))) then
        player:startEvent(109,0,dsp.ki.TUNING_FORK_OF_WATER); -- Start and restart quest "Trial by Water"
    elseif (TrialByWater == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.TUNING_FORK_OF_WATER) == false and WhisperOfTides == false) then
        player:startEvent(190,0,dsp.ki.TUNING_FORK_OF_WATER); -- Defeat against Avatar : Need new Fork
    elseif (TrialByWater == QUEST_ACCEPTED and WhisperOfTides == false) then
        player:startEvent(110,0,dsp.ki.TUNING_FORK_OF_WATER,2);
    elseif (TrialByWater == QUEST_ACCEPTED and WhisperOfTides) then
        numitem = 0;

        if (player:hasItem(17439)) then numitem = numitem + 1; end  -- Leviathan's Rod
        if (player:hasItem(13246)) then numitem = numitem + 2; end  -- Water Belt
        if (player:hasItem(13565)) then numitem = numitem + 4; end  -- Water Ring
        if (player:hasItem(1204)) then numitem = numitem + 8; end   -- Eye of Nept
        if (player:hasSpell(300)) then numitem = numitem + 32; end  -- Ability to summon Leviathan

        player:startEvent(112,0,dsp.ki.TUNING_FORK_OF_WATER,2,0,numitem);
    else
        player:startEvent(113); -- Standard dialog
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 109 and option == 1) then
        if (player:getQuestStatus(OUTLANDS,dsp.quest.id.outlands.TRIAL_BY_WATER) == QUEST_COMPLETED) then
            player:delQuest(OUTLANDS,dsp.quest.id.outlands.TRIAL_BY_WATER);
        end
        player:addQuest(OUTLANDS,dsp.quest.id.outlands.TRIAL_BY_WATER);
        player:setCharVar("TrialByWater_date", 0);
        player:addKeyItem(dsp.ki.TUNING_FORK_OF_WATER);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.TUNING_FORK_OF_WATER);
    elseif (csid == 190) then
        player:addKeyItem(dsp.ki.TUNING_FORK_OF_WATER);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.TUNING_FORK_OF_WATER);
    elseif (csid == 112) then
        local item = 0;
        if (option == 1) then item = 17439;         -- Leviathan's Rod
        elseif (option == 2) then item = 13246;  -- Water Belt
        elseif (option == 3) then item = 13565;  -- Water Ring
        elseif (option == 4) then item = 1204;     -- Eye of Nept
        end

        if (player:getFreeSlotsCount() == 0 and (option ~= 5 or option ~= 6)) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,item);
        else
            if (option == 5) then
                player:addGil(GIL_RATE*10000);
                player:messageSpecial(ID.text.GIL_OBTAINED,GIL_RATE*10000); -- Gil
            elseif (option == 6) then
                player:addSpell(300); -- Avatar
                player:messageSpecial(ID.text.AVATAR_UNLOCKED,0,0,2);
            else
                player:addItem(item);
                player:messageSpecial(ID.text.ITEM_OBTAINED,item); -- Item
            end
            player:addTitle(dsp.title.HEIR_OF_THE_GREAT_WATER);
            player:delKeyItem(dsp.ki.WHISPER_OF_TIDES); --Whisper of Tides, as a trade for the above rewards
            player:setCharVar("TrialByWater_date", os.date("%j")); -- %M for next minute, %j for next day
            player:addFame(NORG,30);
            player:completeQuest(OUTLANDS,dsp.quest.id.outlands.TRIAL_BY_WATER);
        end
    end

end;