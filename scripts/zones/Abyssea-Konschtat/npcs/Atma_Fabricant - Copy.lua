-----------------------------------
-- Zone: Abyssea - Konschtat
--  NPC: Atma Fabricant
-----------------------------------

local opt1  = "the.Voracious.Violet"
local opt2  = "Cloak.and.Dagger"
local opt3  = "the.Stormbird"
local opt4  = "the.Noxious.Fang"    
local opt5  = "Vicissitude"    
local opt6  = "the.Beyond"
local opt7  = "Stormbreath"   
local opt8  = "Gales"   
local opt9  = "Thrashing.Tendrils"   
local opt10 = "the.Drifter"   

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    --player:startEvent(2182)
    player:SetEventNPC(npc:getID());

    player:PrintToPlayer(string.format("Atma.of? %s %s %s %s %s %s %s Next>",opt1, opt2, opt3, opt4, opt5, opt6, opt7), 12);
end

function onMenuSelection(player, npc, Choice)
local Options = {"the.Voracious.Violet", "Cloak.and.Dagger", "the.Stormbird", "the.Noxious.Fang", "Vicissitude", "the.Beyond", "Stormbreath", "Gales", "Thrashing.Tendrils", "the.Drifter"}

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
end

function onEventFinish(player,csid,option)
end