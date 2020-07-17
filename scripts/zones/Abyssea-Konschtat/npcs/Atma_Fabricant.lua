-----------------------------------
-- Zone: Abyssea - Konschtat
--  NPC: Atma Fabricant
-----------------------------------
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Abyssea-Konschtat/IDs");
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
local AtmaData = 
{
	{ choice = "the.Voracious.Violet", id = 1289 },
	{ choice = "Cloak.and.Dagger",     id = 1290 },
	{ choice = "the.Stormbird",        id = 1291 },
	{ choice = "the.Noxious.Fang",	   id = 1292 },
	{ choice = "Vicissitude", 	   id = 1293 },
	{ choice = "the.Beyond",           id = 1294 },
	{ choice = "Stormbreath",          id = 1295 },
	{ choice = "Gales", 		   id = 1296 },
	{ choice = "Thrashing.Tendrils",   id = 1297 },
	{ choice = "the.Drifter",          id = 1298 }
}

local vp = player:getCurrency("valor_point")
local cost = 25000

        for _, v in pairs(AtmaData) do
		if v.choice == Choice then
			if (player:hasKeyItem(v.id)) then
				player:PrintToPlayer(string.format("Atma.of.%s already obtained.", v.choice), 29);
				return;
			elseif (vp < cost) then
				player:PrintToPlayer(string.format("Not enough Valor Points to obtain the atma."), 29);
				player:PrintToPlayer(string.format("Required: %i, Player Amount: %i", cost, vp), 29);
				return;
			else
				player:addKeyItem(v.id);
				player:delCurrency("valor_point", cost);
    				player:messageSpecial(ID.text.KEYITEM_OBTAINED, v.id);
			end
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