-----------------------------------
--
-- Zone: Uleguerand_Range (5)
--
-----------------------------------
local ID = require("scripts/zones/Uleguerand_Range/IDs");
require("scripts/globals/conquest");
require("scripts/globals/missions");
require("scripts/globals/weather");
require("scripts/globals/status");
require("scripts/globals/zone");
-----------------------------------

function onInitialize(zone)
    UpdateNMSpawnPoint(ID.mob.JORMUNGAND);
    GetMobByID(ID.mob.JORMUNGAND):setRespawnTime(math.random(86400, 259200));

    -- ffxiclopedia's pages for Black Coney and White Coney say 7 and 5 Earth seconds respectively, in game it is very fast
    -- https://ffxiclopedia.fandom.com/wiki/Black_Coney
    -- https://ffxiclopedia.fandom.com/wiki/White_Coney
    -- BG Wiki has no info. For now, triggers every 3 vana minutes
    GetNPCByID(ID.npc.RABBIT_FOOTPRINT):addPeriodicTrigger(0,3,0)
end

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
        player:setPos(363.025,16,-60,12);
    end
    if (player:getCurrentMission(COP) == dsp.mission.id.cop.DAWN and player:getCharVar("COP_louverance_story")== 1 ) then
        cs=17;
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 17) then
        player:setCharVar("COP_louverance_story",2);
    end
end;

function onZoneWeatherChange(weather)
    local waterfall = GetNPCByID(ID.npc.WATERFALL);
    if (weather == dsp.weather.SNOW or weather == dsp.weather.BLIZZARDS) then
        if (waterfall:getAnimation() ~= dsp.anim.CLOSE_DOOR) then
            waterfall:setAnimation(dsp.anim.CLOSE_DOOR);
        end
    else
        if (waterfall:getAnimation() ~= dsp.anim.OPEN_DOOR) then
            waterfall:setAnimation(dsp.anim.OPEN_DOOR);
        end
    end
end;
