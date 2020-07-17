-----------------------------------
-- Area: Bastok Markets
-- NPC:A.M.A.N. Reclaimer
-- Standard Info NPC
-----------------------------------

local opt1 = "the.Lion"
local opt2 = "the.Stout.Arm"
local opt3 = "the.Twin.Claw"
local opt4 = "Allure"    
local opt5 = "Eternity"    
local opt6 = "the.Heavens"
local opt7 = "the.Baying.Moon"   
local opt8 = "the.Ebon.Hoof"   
local opt9 = "Tremors"   
local opt10 = "the.Savage.Tiger"   

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:SetEventNPC(npc:getID());

    player:PrintToPlayer(string.format("Atma.of? %s %s %s %s %s %s %s Next>",opt1, opt2, opt3, opt4, opt5, opt6, opt7), 12);
    --player:SendSelectionMenu("Test 1. 2. 3. 4. 5. 6. 7. 8.")
end;

function onMenuSelection(player, npc, Choice)
local Options = {"the.Lion", "the.Stout.Arm", "the.Twin.Claw", "Allure", "Eternity", "the.Heavens", "the.Baying.Moon", "the.Ebon.Hoof", "Tremors", "the.Savage.Tiger"}

        for Key, Option in pairs(Options) do

		if Option == Choice then
                player:PrintToPlayer(string.format("Atma.of.%s selected.", Option), 29);
		return
                end
        end

        if Choice == "Next>" then
                player:PrintToPlayer(string.format("Atma.of? %s %s %s <Back",opt8, opt9, opt10), 12);
	end

        if Choice == "<Back" then
		player:PrintToPlayer(string.format("Atma.of? %s %s %s %s %s %s %s Next>",opt1, opt2, opt3, opt4, opt5, opt6, opt7), 12);
	end

        if Choice == "Canceled." then
		player:PrintToPlayer(string.format("Selection cancelled."), 29);
	end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
