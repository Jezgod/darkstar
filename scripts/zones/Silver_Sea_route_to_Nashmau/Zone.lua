-----------------------------------
--
-- Zone: Silver_Sea_route_to_Nashmau
--
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_route_to_Nashmau/IDs")
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

    return cs;
end;

function onTransportEvent(player,transport)
    player:startEvent(1025);
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 1025) then
        player:setPos(0,0,0,0,53);
    end
end;
