-----------------------------------
--
-- Zone: Crawlers_Nest (197)
--
-----------------------------------
local ID = require("scripts/zones/Crawlers_Nest/IDs")
require("scripts/globals/conquest")
require("scripts/globals/treasure")
-----------------------------------

function onInitialize(zone)
    UpdateNMSpawnPoint(ID.mob.DYNAST_BEETLE)
    GetMobByID(ID.mob.DYNAST_BEETLE):setRespawnTime(math.random(5400, 7200))

    dsp.treasure.initZone(zone)
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

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(380.617,-34.61,4.581,59)
    end
    return cs
end

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end

function onRegionEnter(player,region)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end