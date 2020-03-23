-----------------------------------
--
-- Zone: Bhaflau_Thickets (52)
--
-----------------------------------
local ID = require("scripts/zones/Bhaflau_Thickets/IDs");
require("scripts/globals/chocobo_digging");
require("scripts/globals/helm")
require("scripts/globals/zone");
-----------------------------------

function onChocoboDig(player, precheck)
    return dsp.chocoboDig.start(player, precheck)
end;

function onInitialize(zone)
    UpdateNMSpawnPoint(ID.mob.HARVESTMAN);
    GetMobByID(ID.mob.HARVESTMAN):setRespawnTime(math.random(900, 10800));

    dsp.helm.initZone(zone, dsp.helm.type.HARVESTING)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    local nation = 0;
    local nationByNum = {
	[0] = "None",
        [1] = "Player",
        [2] = "San d'Oria",
        [3] = "Bastok",
        [4] = "Windurst"
    }
	
    -- get nation
    nation = player:getNation()
    allegiance = nation + 2

    -- set nation  
    player:setAllegiance( allegiance )
    player:PrintToPlayer( string.format("Allegiance set to %s", nationByNum[allegiance]));

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-100,-13.5,-479.514,60);
    end
    if (prevZone == dsp.zone.MAMOOL_JA_TRAINING_GROUNDS) then
        player:setPos(-186,-10,-802,80);
    end
    return cs;
end;

function afterZoneIn(player)
    player:entityVisualPacket("1pb1");
    player:entityVisualPacket("2pb1");
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 108) then
        player:setPos(0,0,0,0,66);
    end
end;
