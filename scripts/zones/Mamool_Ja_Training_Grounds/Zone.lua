-----------------------------------
--
-- Zone: Mamool_Ja_Training_Grounds
--
-----------------------------------
local ID = require("scripts/zones/Mamool_Ja_Training_Grounds/IDs")
-----------------------------------

function onInitialize(zone)
end;

function onInstanceZoneIn(player,instance)
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

    local pos = player:getPos();
    if (pos.x == 0 and pos.y == 0 and pos.z == 0) then
        local entrypos = instance:getEntryPos();
        player:setPos(entrypos.x, entrypos.y, entrypos.z, entrypos.rot);
    end

    player:addTempItem(5344);
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if csid == 102 then
        player:setPos(0,0,0,0,52);
    end
end;

function onInstanceLoadFailed()
    return 79;
end;