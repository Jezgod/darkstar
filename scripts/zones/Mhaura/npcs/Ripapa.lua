-----------------------------------
-- Area: Mhaura
--  NPC: Ripapa
-- Starts and Finishes Quest: Trial by Lightning
-- !pos 29 -15 55 249
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
local ID = require("scripts/zones/Mhaura/IDs");
-----------------------------------

function onTrade(player,npc,trade)
    local ki = dsp.ki.WHISPER_OF_STORMS
    local whisper = player:hasKeyItem(ki);
    local name = "Whisper of Storms"
    local ore = 1259
    local oretype = "Lightning"
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
	staff = 17553
    printf("Chance : %u",chance)
    else
	staff = 17554
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

    local TrialByLightning = player:getQuestStatus(OTHER_AREAS_LOG,dsp.quest.id.otherAreas.TRIAL_BY_LIGHTNING);
    local WhisperOfStorms = player:hasKeyItem(dsp.ki.WHISPER_OF_STORMS);
    local realday = tonumber(os.date("%j")); -- %M for next minute, %j for next day
    local CarbuncleDebacle = player:getQuestStatus(WINDURST,dsp.quest.id.windurst.CARBUNCLE_DEBACLE);
    local CarbuncleDebacleProgress = player:getCharVar("CarbuncleDebacleProgress");

    ---------------------------------------------------------------------
    -- Carbunlce Debacle
    if (CarbuncleDebacle == QUEST_ACCEPTED and CarbuncleDebacleProgress == 2) then
        player:startEvent(10022); -- get the lighning pendulum lets go to Cloister of Storms
    elseif (CarbuncleDebacle == QUEST_ACCEPTED and CarbuncleDebacleProgress == 3 and player:hasItem(1172) == false) then
        player:startEvent(10023,0,1172,0,0,0,0,0,0); -- "lost the pendulum?"
    ---------------------------------------------------------------------
    -- Trial by Lightning
    elseif ((TrialByLightning == QUEST_AVAILABLE and player:getFameLevel(WINDURST) >= 6) or (TrialByLightning == QUEST_COMPLETED and realday ~= player:getCharVar("TrialByLightning_date"))) then
        player:startEvent(10016,0,dsp.ki.TUNING_FORK_OF_LIGHTNING); -- Start and restart quest "Trial by Lightning"
    elseif (TrialByLightning == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.TUNING_FORK_OF_LIGHTNING) == false and WhisperOfStorms == false) then
        player:startEvent(10024,0,dsp.ki.TUNING_FORK_OF_LIGHTNING); -- Defeat against Ramuh : Need new Fork
    elseif (TrialByLightning == QUEST_ACCEPTED and WhisperOfStorms == false) then
        player:startEvent(10017,0,dsp.ki.TUNING_FORK_OF_LIGHTNING,5);
    elseif (TrialByLightning == QUEST_ACCEPTED and WhisperOfStorms) then
        numitem = 0;

        if (player:hasItem(17531)) then numitem = numitem + 1; end  -- Ramuh's Staff
        if (player:hasItem(13245)) then numitem = numitem + 2; end  -- Lightning Belt
        if (player:hasItem(13564)) then numitem = numitem + 4; end  -- Lightning Ring
        if (player:hasItem(1206)) then numitem = numitem + 8; end   -- Elder Branch
        if (player:hasSpell(303)) then numitem = numitem + 32; end  -- Ability to summon Ramuh

        player:startEvent(10019,0,dsp.ki.TUNING_FORK_OF_LIGHTNING,5,0,numitem);
    else
        player:startEvent(10020); -- Standard dialog
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 10016 and option == 1) then
        if (player:getQuestStatus(OTHER_AREAS_LOG,dsp.quest.id.otherAreas.TRIAL_BY_LIGHTNING) == QUEST_COMPLETED) then
            player:delQuest(OTHER_AREAS_LOG,dsp.quest.id.otherAreas.TRIAL_BY_LIGHTNING);
        end
        player:addQuest(OTHER_AREAS_LOG,dsp.quest.id.otherAreas.TRIAL_BY_LIGHTNING);
        player:setCharVar("TrialByLightning_date", 0);
        player:addKeyItem(dsp.ki.TUNING_FORK_OF_LIGHTNING);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.TUNING_FORK_OF_LIGHTNING);
    elseif (csid == 10024) then
        player:addKeyItem(dsp.ki.TUNING_FORK_OF_LIGHTNING);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.TUNING_FORK_OF_LIGHTNING);
    elseif (csid == 10019) then
        item = 0;
        if (option == 1) then item = 17531;         -- Ramuh's Staff
        elseif (option == 2) then item = 13245;  -- Lightning Belt
        elseif (option == 3) then item = 13564;  -- Lightning Ring
        elseif (option == 4) then item = 1206;     -- Elder Branch
        end

        if (player:getFreeSlotsCount() == 0 and (option ~= 5 or option ~= 6)) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,item);
        else
            if (option == 5) then
                player:addGil(GIL_RATE*10000);
                player:messageSpecial(ID.text.GIL_OBTAINED,GIL_RATE*10000); -- Gil
            elseif (option == 6) then
                player:addSpell(303); -- Ramuh Spell
                player:messageSpecial(ID.text.RAMUH_UNLOCKED,0,0,5);
            else
                player:addItem(item);
                player:messageSpecial(ID.text.ITEM_OBTAINED,item); -- Item
            end
            player:addTitle(dsp.title.HEIR_OF_THE_GREAT_LIGHTNING);
            player:delKeyItem(dsp.ki.WHISPER_OF_STORMS); --Whisper of Storms, as a trade for the above rewards
            player:setCharVar("TrialByLightning_date", os.date("%j")); -- %M for next minute, %j for next day
            player:addFame(MHAURA,30);
            player:completeQuest(OTHER_AREAS_LOG,dsp.quest.id.otherAreas.TRIAL_BY_LIGHTNING);
        end
    elseif (csid == 10022 or csid == 10023) then
        if (player:getFreeSlotsCount() ~= 0) then
            player:addItem(1172);
            player:messageSpecial(ID.text.ITEM_OBTAINED,1172);
            player:setCharVar("CarbuncleDebacleProgress",3);
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,1172);
        end;
    end

end;
