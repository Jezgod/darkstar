-----------------------------------
--
-- Zone: Kazham-Jeuno_Airship
--
-----------------------------------
local ID = require("scripts/zones/Kazham-Jeuno_Airship/IDs")
require("scripts/globals/zone")
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

    if (player:getXPos() == 0 or player:getYPos() == 0 or player:getZPos() == 0) then
        player:setPos(math.random(-4, 4),1,math.random(-23,-12));
    end

    return cs;
end;

function onTransportEvent(player,transport)
    player:startEvent(10);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 10) then
        local prevzone = player:getPreviousZone();
        if (prevzone == dsp.zone.KAZHAM) then
            player:setPos(0,0,0,0,246);
        elseif (prevzone == dsp.zone.PORT_JEUNO) then
            player:setPos(0,0,0,0,250);
        end
    end
end;