-----------------------------------
--
-- Zone: Ordelles Caves (193)
--
-----------------------------------
local ID = require("scripts/zones/Ordelles_Caves/IDs")
require("scripts/globals/conquest")
require("scripts/globals/treasure")
require("scripts/globals/zone")
-----------------------------------

function onInitialize(zone)
    UpdateNMSpawnPoint(ID.mob.MORBOLGER)
    GetMobByID(ID.mob.MORBOLGER):setRespawnTime(math.random(900, 10800))

    dsp.treasure.initZone(zone)
end

function onZoneIn(player, prevZone)
    local cs = -1
    local nation = 0
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

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-76.839, -1.696, 659.969, 122)
    end
    if prevZone == dsp.zone.LA_THEINE_PLATEAU and player:getCharVar("darkPuppetCS") == 1 then
        cs = 10
    end
    return cs
end

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end

function onRegionEnter(player, region)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 10 then
        player:setCharVar("darkPuppetCS", 2)
    end
end
