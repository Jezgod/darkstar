-----------------------------------
--
-- Zone: Nyzul_Isle
--
-----------------------------------
local ID = require("scripts/zones/Nyzul_Isle/IDs")
require("scripts/globals/missions")
-----------------------------------

function onInitialize(zone)
end

function onInstanceZoneIn(player,instance)
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

    local pos = player:getPos()
    if (pos.x == 0 and pos.y == 0 and pos.z == 0) then
        player:setPos(player:getInstance():getEntryPos());
    end
    if (player:getCurrentMission(TOAU) == dsp.mission.id.toau.PATH_OF_DARKNESS) then
        cs = 51
    end
    
    player:addTempItem(5348)

    return cs
end

function onRegionEnter(player,region)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

    if csid == 1 then
        player:setPos(0,0,0,0,72)
    end
end

function onInstanceLoadFailed()
    return 72
end