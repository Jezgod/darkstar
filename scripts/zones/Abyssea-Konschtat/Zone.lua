-----------------------------------
--
-- Zone: Abyssea - Konschtat
--
-----------------------------------
-- Research
-- EventID 1024-1029 aura of boundless rage
-- EventID 2048-2179 The treasure chest will disappear is 180 seconds menu.
-- EventID 2180 Teleport?
-- EventID 2181 DEBUG Menu
-----------------------------------
local ID = require("scripts/zones/Abyssea-Konschtat/IDs")
require("scripts/globals/quests")
-----------------------------------

function onInitialize(zone)
end

function onZoneIn(player,prevZone)
    local cs = -1
    local nation = 0
    local nationByNum = {
	[0] = "None",
        [1] = "Player",
        [2] = "San d'Oria",
        [3] = "Bastok",
        [4] = "Windurst"
    }
	
    -- turn on stylelock
    player:lockstyleOn()

    -- get nation
    nation = player:getNation()
    allegiance = nation + 2

    -- set nation  
    player:setAllegiance( allegiance );
    player:PrintToPlayer( string.format("Allegiance set to %s", nationByNum[allegiance]));

    -- Note: in retail even tractor lands you back at searing ward, will handle later.
    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(153,-72,-840,140)
    end

    if player:getQuestStatus(ABYSSEA, dsp.quest.id.abyssea.THE_TRUTH_BECKONS) == QUEST_ACCEPTED and player:getCharVar("1stTimeAbyssea") == 0 then
        player:setCharVar("1stTimeAbyssea",1)
    end

    return cs
end

function onRegionEnter(player,region)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end