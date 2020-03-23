-----------------------------------
--
-- Zone: Ranguemont Pass (166)
--
-----------------------------------
local ID = require("scripts/zones/Ranguemont_Pass/IDs")
require("scripts/globals/conquest");
-----------------------------------

function onInitialize(zone)
    -- pick a random Taisaijin PH and set its do not disturb time
    local phIndex = math.random(1,3);
    local ph = GetMobByID(ID.mob.TAISAIJIN_PH[phIndex]);
    ph:setLocalVar("timeToGrow", os.time() + math.random(86400,259200)); -- 1 to 3 days
    ph:setLocalVar("phIndex",phIndex);
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
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
        player:setPos(302.778,-68.131,257.759,137);
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
