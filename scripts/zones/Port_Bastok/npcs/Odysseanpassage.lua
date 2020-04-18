-----------------------------------
-- Area: Port Bastok
--  NPC: Odyssean Passage
-- Working 100%
-----------------------------------
local ID = require("scripts/zones/Port_Bastok/IDs")
require("scripts/globals/settings");
require("scripts/globals/npc_util")
-----------------------------------

local skill_map =
{
	[18270] = {augment = 258, min = 0, max = 31}, --Mandau / Dagger
	[18282] = {augment = 260, min = 0, max = 31}, --Ragnarok / Great Sword
	[18288] = {augment = 261, min = 0, max = 31}, --Guttler / Axe
	[18300] = {augment = 264, min = 0, max = 31}, --Gungnir / Polearm
	[18318] = {augment = 266, min = 0, max = 31}, --Amanomurakumo / Great Katana
	[18330] = {augment = 268, min = 0, max = 31}, --Claustrum / Staff
	[18336] = {augment = 282, min = 0, max = 31}, --Annihilator / Marksmanship
	[15070] = {augment = 286, min = 0, max = 31}, --Aegis / Shield
}

local testimony_map =
{
	[1426] = {augment =  45, min = 0, max = 31}, 	--warriors_testimony / DMG:+1
	[1427] = {augment = 145, min = 0, max = 31},	--monks_testimony / Counter+1
	[1428] = {augment = 329, min = 0, max = 31}, 	--white_mages_testimony / Cure potency +1%
	[1429] = {augment = 133, min = 0, max = 31}, 	--black_mages_testimony / Mag.Atk.Bns.+1
	[1430] = {augment = 335, min = 0, max = 31}, 	--red_mages_testimony / Mag. crit. hit dmg. +1%
	[1431] = {augment = 144, min = 0, max = 31}, 	--thiefs_testimony / Triple Atk.+1
	[1432] = {augment =  41, min = 0, max = 31}, 	--paladins_testimony / Crit.hit rate+1
	[1433] = {augment =  25, min = 0, max = 31}, 	--dark_knights_testimony / Attack+1
	[1434] = {augment = 327, min = 0, max = 31}, 	--beastmasters_testimony / Weapon skill damage +1%
	[1435] = {augment = 137, min = 0, max = 31}, 	--bards_testimony / Regen+1
	[1436] = {augment =  29, min = 0, max = 31}, 	--rangers_testimony / Rng.Atk.+1
	[1437] = {augment = 142, min = 0, max = 31}, 	--samurais_testimony / Store TP+1
	[1438] = {augment =  49, min = 0, max = 31}, 	--ninjas_testimony / Haste+1
	[1439] = {augment =  23, min = 0, max = 31}, 	--dragoons_testimony / Accuracy+1
	[1440] = {augment = 138, min = 0, max = 31}, 	--summoners_testimony / Refresh+1
	[2331] = {augment =  57, min = 0, max = 31}, 	--blue_mages_testimony / Magic crit. hit rate +1
	[2332] = {augment =  27, min = 0, max = 31}, 	--corsairs_testimony / Rng.Acc.+1
	[2333] = {augment =  48, min = 0, max = 31}, 	--puppetmasters_testimony / Delay:-1%
	[2556] = {augment = 146, min = 0, max = 31}, 	--dancers_testimony / Dual Wield+1
	[2557] = {augment =  35, min = 0, max = 31}, 	--scholars_testimony / Mag.Acc.+1
}

function onTrade(player,npc,trade)
	local pCP = player:getCP()
	local rCP = 250000
        local weapon = trade:getItemId(0)
        local weaponMap = skill_map[weapon]
	local testimony = trade:getItemId(1)
        local testimonyMap = testimony_map[testimony]
        local aug1 = 0
        local aug2 = 0
	local aug1t = 0
	local aug2t = 0

        if (trade:getItemCount() ~= 2 or trade:getGil() ~= 0) then
		player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED);

	elseif (weaponMap == nil or testimonyMap == nil) then
 		player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED);
	
	elseif (trade:getItemCount() == 2 and trade:getGil() == 0 and pCP >= rCP) then		
		aug1 = weaponMap.augment
 		aug2 = testimonyMap.augment
		math.randomseed (os.time())
		--aug1t = math.random(weaponMap.min, weaponMap.max)
		--aug2t = math.random(testimonyMap.min, testimonyMap.max)
                aug1t = math.floor(math.abs(math.random() - math.random()) * (1 + weaponMap.max - weaponMap.min) + weaponMap.min)
		aug2t = math.floor(math.abs(math.random() - math.random()) * (1 + testimonyMap.max - testimonyMap.min) + testimonyMap.min)

		player:tradeComplete();
    		player:addItem(weapon, 1, aug1, aug1t, aug2, aug2t);
       		player:delCP(rCP);
    		player:messageSpecial(ID.text.ITEM_OBTAINED,weapon);
        else
		player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED);
	end	
   
        --player:PrintToPlayer( string.format("Weapon Augment1: %u Weapon Augment2: %u",aug1, aug2) );
	printf("random1: %u", aug1t)
	printf("random2: %u", aug2t)
end;

function onTrigger(player,npc)
	player:PrintToPlayer( string.format("Increase the Strength of Relic Weapons Here...") )
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;