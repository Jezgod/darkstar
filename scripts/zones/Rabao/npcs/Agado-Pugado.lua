-----------------------------------
-- Area: Rabao
--  NPC: Agado-Pugado
-- Starts and Finishes Quest: Trial by Wind
-- !pos -17 7 -10 247
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
local ID = require("scripts/zones/Rabao/IDs");
-----------------------------------

function onTrade(player,npc,trade)
    local ki = dsp.ki.WHISPER_OF_GALES
    local whisper = player:hasKeyItem(ki);
    local name = "Whisper of Gales"
    local ore = 1257
    local oretype = "Wind"
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
	staff = 17549
    printf("Chance : %u",chance)
    else
	staff = 17550
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

    local TrialByWind = player:getQuestStatus(OUTLANDS,dsp.quest.id.outlands.TRIAL_BY_WIND);
    local WhisperOfGales = player:hasKeyItem(dsp.ki.WHISPER_OF_GALES);
    local realday = tonumber(os.date("%j")); -- %M for next minute, %j for next day
    local CarbuncleDebacle = player:getQuestStatus(WINDURST,dsp.quest.id.windurst.CARBUNCLE_DEBACLE);
    local CarbuncleDebacleProgress = player:getCharVar("CarbuncleDebacleProgress");

    ---------------------------------------------------------------------
    -- Carbuncle Debacle
    if (CarbuncleDebacle == QUEST_ACCEPTED and CarbuncleDebacleProgress == 5 and player:hasKeyItem(dsp.ki.DAZEBREAKER_CHARM) == true) then
        player:startEvent(86); -- get the wind pendulum, lets go to Cloister of Gales
    elseif (CarbuncleDebacle == QUEST_ACCEPTED and CarbuncleDebacleProgress == 6) then
        if (player:hasItem(1174) == false) then
            player:startEvent(87,0,1174,0,0,0,0,0,0); -- "lost the pendulum?" This one too~???
        else
            player:startEvent(88); -- reminder to go to Cloister of Gales
        end;
    ---------------------------------------------------------------------
    -- Trial by Wind
    elseif ((TrialByWind == QUEST_AVAILABLE and player:getFameLevel(RABAO) >= 5) or (TrialByWind == QUEST_COMPLETED and realday ~= player:getCharVar("TrialByWind_date"))) then
        player:startEvent(66,0,331); -- Start and restart quest "Trial by Wind"
    elseif (TrialByWind == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.TUNING_FORK_OF_WIND) == false and WhisperOfGales == false) then
        player:startEvent(107,0,331); -- Defeat against Avatar : Need new Fork
    elseif (TrialByWind == QUEST_ACCEPTED and WhisperOfGales == false) then
        player:startEvent(67,0,331,3);
    elseif (TrialByWind == QUEST_ACCEPTED and WhisperOfGales) then
        numitem = 0;

        if (player:hasItem(17627)) then numitem = numitem + 1; end  -- Garuda's Dagger
        if (player:hasItem(13243)) then numitem = numitem + 2; end  -- Wind Belt
        if (player:hasItem(13562)) then numitem = numitem + 4; end  -- Wind Ring
        if (player:hasItem(1202)) then numitem = numitem + 8; end   -- Bubbly Water
        if (player:hasSpell(301)) then numitem = numitem + 32; end  -- Ability to summon Garuda

        player:startEvent(69,0,331,3,0,numitem);
    else
        player:startEvent(70); -- Standard dialog
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 66 and option == 1) then
        if (player:getQuestStatus(OUTLANDS,dsp.quest.id.outlands.TRIAL_BY_WIND) == QUEST_COMPLETED) then
            player:delQuest(OUTLANDS,dsp.quest.id.outlands.TRIAL_BY_WIND);
        end
        player:addQuest(OUTLANDS,dsp.quest.id.outlands.TRIAL_BY_WIND);
        player:setCharVar("TrialByWind_date", 0);
        player:addKeyItem(dsp.ki.TUNING_FORK_OF_WIND);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.TUNING_FORK_OF_WIND);
    elseif (csid == 107) then
        player:addKeyItem(dsp.ki.TUNING_FORK_OF_WIND);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.TUNING_FORK_OF_WIND);
    elseif (csid == 69) then
        item = 0;
        if (option == 1) then item = 17627;         -- Garuda's Dagger
        elseif (option == 2) then item = 13243;  -- Wind Belt
        elseif (option == 3) then item = 13562;  -- Wind Ring
        elseif (option == 4) then item = 1202;     -- Bubbly Water
        end

        if (player:getFreeSlotsCount() == 0 and (option ~= 5 or option ~= 6)) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,item);
        else
            if (option == 5) then
                player:addGil(GIL_RATE*10000);
                player:messageSpecial(ID.text.GIL_OBTAINED,GIL_RATE*10000); -- Gil
            elseif (option == 6) then
                player:addSpell(301); -- Garuda Spell
                player:messageSpecial(ID.text.GARUDA_UNLOCKED,0,0,3);
            else
                player:addItem(item);
                player:messageSpecial(ID.text.ITEM_OBTAINED,item); -- Item
            end
            player:addTitle(dsp.title.HEIR_OF_THE_GREAT_WIND);
            player:delKeyItem(dsp.ki.WHISPER_OF_GALES); --Whisper of Gales, as a trade for the above rewards
            player:setCharVar("TrialByWind_date", os.date("%j")); -- %M for next minute, %j for next day
            player:addFame(RABAO,30);
            player:completeQuest(OUTLANDS,dsp.quest.id.outlands.TRIAL_BY_WIND);
        end
    elseif (csid == 86 or csid == 87) then
        if (player:getFreeSlotsCount() ~= 0) then
            player:addItem(1174);
            player:messageSpecial(ID.text.ITEM_OBTAINED,1174);
            player:setCharVar("CarbuncleDebacleProgress",6);
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,1174);
        end;
    end
end;
