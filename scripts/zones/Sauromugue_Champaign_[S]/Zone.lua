-----------------------------------
--
-- Zone: Sauromugue_Champaign_[S] (98)
--
-----------------------------------
local ID = require("scripts/zones/Sauromugue_Champaign_[S]/IDs")
require("scripts/globals/quests")
require("scripts/globals/zone")
-----------------------------------

function onInitialize(zone)
    UpdateNMSpawnPoint(ID.mob.COQUECIGRUE)
    GetMobByID(ID.mob.COQUECIGRUE):setRespawnTime(math.random(7200, 7800))
end;

function onZoneIn(player,prevZone)
    local cs = -1;
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

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-104,-25.36,-410,195);
    end
    if (prevZone == dsp.zone.ROLANBERRY_FIELDS_S and player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.DOWNWARD_HELIX) == QUEST_ACCEPTED and player:getCharVar("DownwardHelix") == 2) then
        cs = 3;
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 3) then
        player:setCharVar("DownwardHelix",3);
    end
end;