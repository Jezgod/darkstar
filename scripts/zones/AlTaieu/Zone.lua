-----------------------------------
--
-- Zone: AlTaieu (33)
--
-----------------------------------
require("scripts/globals/settings");
local ID = require("scripts/zones/AlTaieu/IDs");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
-----------------------------------

function onInitialize(zone)
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
        player:setPos(-25,-1 ,-620 ,33);
    end
    if (player:getCurrentMission(COP) == dsp.mission.id.cop.GARDEN_OF_ANTIQUITY and player:getCharVar("PromathiaStatus") == 0) then
        cs=1;
    elseif (player:getCurrentMission(COP) == dsp.mission.id.cop.DAWN and player:getCharVar("PromathiaStatus") == 0) then
        cs=167;
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 1) then
        player:setCharVar("PromathiaStatus",1);
        player:addKeyItem(dsp.ki.LIGHT_OF_ALTAIEU);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.LIGHT_OF_ALTAIEU);
        player:addTitle(dsp.title.SEEKER_OF_THE_LIGHT);
    elseif (csid == 167) then
        player:setCharVar("PromathiaStatus",1);
    end
end;
