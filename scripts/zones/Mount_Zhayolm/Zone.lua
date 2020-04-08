-----------------------------------
--
-- Zone: Mount_Zhayolm (61)
--
-----------------------------------
local ID = require("scripts/zones/Mount_Zhayolm/IDs")
require("scripts/globals/helm")
require("scripts/globals/zone")
-----------------------------------

function onInitialize(zone)
    GetMobByID(ID.mob.CERBERUS):setRespawnTime(math.random(12, 36) * 3600)

    dsp.helm.initZone(zone, dsp.helm.type.MINING)
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
	
    -- turn on stylelock
    player:lockstyleOn()

    -- get nation
    nation = player:getNation()
    allegiance = nation + 2

    -- set nation  
    player:setAllegiance( allegiance );
    player:PrintToPlayer( string.format("Allegiance set to %s", nationByNum[allegiance]));

    if prevZone == dsp.zone.LEBROS_CAVERN then
        player:setPos(681.950, -24.00, 369.936, 40)
    elseif player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-521.016, -6.191, 60.013, 126)
    end
    return cs
end

function afterZoneIn(player)
    player:entityVisualPacket("1pb1")
    player:entityVisualPacket("2pb1")
end

function onRegionEnter(player, region)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 208 then
        player:setPos(0, 0, 0, 0, 63)
    end
end
