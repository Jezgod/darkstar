-----------------------------------
--
-- Zone: Empyreal_Paradox
--
-----------------------------------
local ID = require("scripts/zones/Empyreal_Paradox/IDs")
require("scripts/globals/conquest")
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1, 538, -2, -501,  542, 0, -497); -- to The Garden of Ru'hmet
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
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
        --player:setPos(502,0,500,222); -- BC Area
        player:setPos(539,-1,-500,69);
    end
    return cs;
end;

function onRegionEnter(player,region)

    switch (region:GetRegionID()): caseof
    {
        [1] = function (x) player:startEvent(100); end,
    }

end;

function onRegionLeave(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 100 and option == 1) then
        player:setPos(-420,-1,379.900,62,35);
    end

end;