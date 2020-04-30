-----------------------------------
-- Area: Kazham
--  NPC: Ronta-Onta
-- Starts and Finishes Quest: Trial by Fire
-- !pos 100 -15 -97 250
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/globals/npc_util");
local ID = require("scripts/zones/Kazham/IDs");
-----------------------------------

function onTrade(player,npc,trade)
    local ki = dsp.ki.WHISPER_OF_FLAMES
    local whisper = player:hasKeyItem(ki);
    local name = "Whisper of Flames"
    local ore = 1255
    local oretype = "Fire"
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
	staff = 17545
    printf("Chance : %u",chance)
    else
	staff = 17546
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

    TrialByFire = player:getQuestStatus(OUTLANDS,dsp.quest.id.outlands.TRIAL_BY_FIRE);
    WhisperOfFlames = player:hasKeyItem(dsp.ki.WHISPER_OF_FLAMES);
    realday = tonumber(os.date("%j")); -- %M for next minute, %j for next day

    if ((TrialByFire == QUEST_AVAILABLE and player:getFameLevel(KAZHAM) >= 6) or (TrialByFire == QUEST_COMPLETED and realday ~= player:getCharVar("TrialByFire_date"))) then
        player:startEvent(270,0,dsp.ki.TUNING_FORK_OF_FIRE); -- Start and restart quest "Trial by Fire"
    elseif (TrialByFire == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.TUNING_FORK_OF_FIRE) == false and WhisperOfFlames == false) then
        player:startEvent(285,0,dsp.ki.TUNING_FORK_OF_FIRE); -- Defeat against Ifrit : Need new Fork
    elseif (TrialByFire == QUEST_ACCEPTED and WhisperOfFlames == false) then
        player:startEvent(271,0,dsp.ki.TUNING_FORK_OF_FIRE,0);
    elseif (TrialByFire == QUEST_ACCEPTED and WhisperOfFlames) then
        numitem = 0;

        if (player:hasItem(17665)) then numitem = numitem + 1; end  -- Ifrits Blade
        if (player:hasItem(13241)) then numitem = numitem + 2; end  -- Fire Belt
        if (player:hasItem(13560)) then numitem = numitem + 4; end  -- Fire Ring
        if (player:hasItem(1203)) then numitem = numitem + 8; end   -- Egil's Torch
        if (player:hasSpell(298)) then numitem = numitem + 32; end  -- Ability to summon Ifrit

        player:startEvent(273,0,dsp.ki.TUNING_FORK_OF_FIRE,0,0,numitem);
    else
        player:startEvent(274); -- Standard dialog
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 270 and option == 1) then
        if (player:getQuestStatus(OUTLANDS,dsp.quest.id.outlands.TRIAL_BY_FIRE) == QUEST_COMPLETED) then
            player:delQuest(OUTLANDS,dsp.quest.id.outlands.TRIAL_BY_FIRE);
        end
        player:addQuest(OUTLANDS,dsp.quest.id.outlands.TRIAL_BY_FIRE);
        player:setCharVar("TrialByFire_date", 0);
        player:addKeyItem(dsp.ki.TUNING_FORK_OF_FIRE);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.TUNING_FORK_OF_FIRE);
    elseif (csid == 285) then
        player:addKeyItem(dsp.ki.TUNING_FORK_OF_FIRE);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.TUNING_FORK_OF_FIRE);
    elseif (csid == 273) then
        item = 0;
        if (option == 1) then item = 17665;         -- Ifrits Blade
        elseif (option == 2) then item = 13241;  -- Fire Belt
        elseif (option == 3) then item = 13560;  -- Fire Ring
        elseif (option == 4) then item = 1203;     -- Egil's Torch
        end

        if (player:getFreeSlotsCount() == 0 and (option ~= 5 or option ~= 6)) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,item);
        else
            if (option == 5) then
                player:addGil(GIL_RATE*10000);
                player:messageSpecial(ID.text.GIL_OBTAINED,GIL_RATE*10000); -- Gil
            elseif (option == 6) then
                player:addSpell(298); -- Ifrit Spell
                player:messageSpecial(ID.text.IFRIT_UNLOCKED,0,0,0);
            else
                player:addItem(item);
                player:messageSpecial(ID.text.ITEM_OBTAINED,item); -- Item
            end
            player:addTitle(dsp.title.HEIR_OF_THE_GREAT_FIRE);
            player:delKeyItem(dsp.ki.WHISPER_OF_FLAMES);
            player:setCharVar("TrialByFire_date", os.date("%j")); -- %M for next minute, %j for next day
            player:addFame(KAZHAM,30);
            player:completeQuest(OUTLANDS,dsp.quest.id.outlands.TRIAL_BY_FIRE);
        end
    end

end;