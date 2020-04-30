-----------------------------------
-- Area: Port Bastok
--  NPC: Juroro
-- Starts and Finishes Quest: Trial by Earth
-- !pos 32 7 -41 236
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/npc_util");
local ID = require("scripts/zones/Port_Bastok/IDs");
-----------------------------------

function onTrade(player,npc,trade)
    local ki = dsp.ki.WHISPER_OF_TREMORS
    local whisper = player:hasKeyItem(ki);
    local name = "Whisper of Tremors"
    local ore = 1258
    local oretype = "Earth"
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
	staff = 17551
    printf("Chance : %u",chance)
    else
	staff = 17552
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

    local TrialByEarth = player:getQuestStatus(BASTOK,dsp.quest.id.bastok.TRIAL_BY_EARTH);
    local WhisperOfTremors = player:hasKeyItem(dsp.ki.WHISPER_OF_TREMORS);
    local realday = tonumber(os.date("%j")); -- %M for next minute, %j for next day
    local ThePuppetMaster = player:getQuestStatus(WINDURST,dsp.quest.id.windurst.THE_PUPPET_MASTER);
    local ThePuppetMasterProgress = player:getCharVar("ThePuppetMasterProgress");

    if (ThePuppetMaster == QUEST_ACCEPTED and ThePuppetMasterProgress == 1) then
        player:startEvent(256,0,329,0,1169,0,0,0,0);
    elseif (ThePuppetMaster == QUEST_ACCEPTED and ThePuppetMasterProgress == 2 and player:hasItem(1169) == false) then -- you've lost/tossed away the earth pendulum
        player:startEvent(257,0,1169,0,0,0,0,0,0);
    elseif (ThePuppetMaster == QUEST_ACCEPTED and ThePuppetMasterProgress == 3) then
        player:startEvent(258);
    elseif ((TrialByEarth == QUEST_AVAILABLE and player:getFameLevel(BASTOK) >= 6) or (TrialByEarth == QUEST_COMPLETED and realday ~= player:getCharVar("TrialByEarth_date"))) then
        player:startEvent(249,0,dsp.ki.TUNING_FORK_OF_EARTH); -- Start and restart quest "Trial by Earth"
    elseif (TrialByEarth == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.TUNING_FORK_OF_EARTH) == false and WhisperOfTremors == false) then
        player:startEvent(284,0,dsp.ki.TUNING_FORK_OF_EARTH); -- Defeat against Titan : Need new Fork
    elseif (TrialByEarth == QUEST_ACCEPTED and WhisperOfTremors == false) then
        player:startEvent(250,0,dsp.ki.TUNING_FORK_OF_EARTH,1);
    elseif (TrialByEarth == QUEST_ACCEPTED and WhisperOfTremors) then
        numitem = 0;

        if (player:hasItem(17438)) then numitem = numitem + 1; end  -- Titan's Cudgel
        if (player:hasItem(13244)) then numitem = numitem + 2; end  -- Earth Belt
        if (player:hasItem(13563)) then numitem = numitem + 4; end  -- Earth Ring
        if (player:hasItem(1205)) then numitem = numitem + 8; end   -- Desert Light
        if (player:hasSpell(299)) then numitem = numitem + 32; end  -- Ability to summon Titan

        player:startEvent(252,0,dsp.ki.TUNING_FORK_OF_EARTH,1,0,numitem);
    else
        player:startEvent(253); -- Standard dialog
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 256) then
        if (player:getFreeSlotsCount() ~= 0) then
                player:addItem(1169);
                player:messageSpecial(ID.text.ITEM_OBTAINED,1169);
                player:setCharVar("ThePuppetMasterProgress",2);
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,1169);
        end;
    elseif (csid == 257) then
        if (player:getFreeSlotsCount() ~= 0) then
            player:addItem(1169);
            player:messageSpecial(ID.text.ITEM_OBTAINED,1169);
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,1169);
        end;
    elseif (csid == 258) then
        player:setCharVar("ThePuppetMasterProgress",4);
    elseif (csid == 249 and option == 1) then
        if (player:getQuestStatus(BASTOK,dsp.quest.id.bastok.TRIAL_BY_EARTH) == QUEST_COMPLETED) then
            player:delQuest(BASTOK,dsp.quest.id.bastok.TRIAL_BY_EARTH);
        end
        player:addQuest(BASTOK,dsp.quest.id.bastok.TRIAL_BY_EARTH);
        player:setCharVar("TrialByEarth_date", 0);
        player:addKeyItem(dsp.ki.TUNING_FORK_OF_EARTH);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.TUNING_FORK_OF_EARTH);
    elseif (csid == 284) then
        player:addKeyItem(dsp.ki.TUNING_FORK_OF_EARTH);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.TUNING_FORK_OF_EARTH);
    elseif (csid == 252) then
        local item = 0;
        if (option == 1) then item = 17438;         -- Titan's Cudgel
        elseif (option == 2) then item = 13244;  -- Earth Belt
        elseif (option == 3) then item = 13563;  -- Earth Ring
        elseif (option == 4) then item = 1205;     -- Desert Light
        end

        if (player:getFreeSlotsCount() == 0 and (option ~= 5 or option ~= 6)) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,item);
        else
            if (option == 5) then
                player:addGil(GIL_RATE*10000);
                player:messageSpecial(ID.text.GIL_OBTAINED,GIL_RATE*10000); -- Gils
            elseif (option == 6) then
                player:addSpell(299); -- Avatar Titan Spell
                player:messageSpecial(ID.text.TITAN_UNLOCKED,0,0,1);
            else
                player:addItem(item);
                player:messageSpecial(ID.text.ITEM_OBTAINED,item); -- Item
            end
            player:addTitle(dsp.title.HEIR_OF_THE_GREAT_EARTH);
            player:delKeyItem(dsp.ki.WHISPER_OF_TREMORS); --Whisper of Tremors, as a trade for the above rewards
            player:setCharVar("TrialByEarth_date", os.date("%j")); -- %M for next minute, %j for next day
            player:addFame(BASTOK,30);
            player:completeQuest(BASTOK,dsp.quest.id.bastok.TRIAL_BY_EARTH);
        end
    end

end;