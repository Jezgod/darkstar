-----------------------------------
--
-- Zone: Navukgo_Execution_Chamber (64)
--
-----------------------------------
local ID = require("scripts/zones/Navukgo_Execution_Chamber/IDs")
require("scripts/globals/missions")
-----------------------------------

function onInitialize(zone)
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
        player:setPos(-660.185,-12.079,-199.532,192);
    end

    if (player:getCurrentMission(TOAU) == dsp.mission.id.toau.SHIELD_OF_DIPLOMACY and player:getCharVar("AhtUrganStatus") == 0) then
        cs = 1;
    end

    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 1) then
        player:setCharVar("AhtUrganStatus",1);
    end
end;
