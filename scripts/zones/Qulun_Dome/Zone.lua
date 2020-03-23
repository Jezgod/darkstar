-----------------------------------
--
-- Zone: Qulun_Dome (148)
--
-----------------------------------
local ID = require("scripts/zones/Qulun_Dome/IDs")
require("scripts/globals/conquest")
-----------------------------------

function onInitialize(zone)
    UpdateNMSpawnPoint(ID.mob.DIAMOND_QUADAV)
    GetMobByID(ID.mob.DIAMOND_QUADAV):setRespawnTime(math.random(900, 10800))
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
	
    -- get nation
    nation = player:getNation()
    allegiance = nation + 2

    -- set nation  
    player:setAllegiance( allegiance );
    player:PrintToPlayer( string.format("Allegiance set to %s", nationByNum[allegiance]));

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(337.901,38.091,20.087,129)
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