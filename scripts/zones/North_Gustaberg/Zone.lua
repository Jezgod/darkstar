-----------------------------------
--
-- Zone: North_Gustaberg (106)
--
-----------------------------------
local ID = require("scripts/zones/North_Gustaberg/IDs")
require("scripts/globals/icanheararainbow")
require("scripts/globals/chocobo_digging")
require("scripts/globals/conquest")
require("scripts/globals/missions")
-----------------------------------

function onChocoboDig(player, precheck)
    return dsp.chocoboDig.start(player, precheck)
end

function onInitialize(zone)
    dsp.conq.setRegionalConquestOverseers(zone:getRegionID())
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
	
    -- get nation
    nation = player:getNation()
    allegiance = nation + 2

    -- set nation  
    player:setAllegiance( allegiance );
    player:PrintToPlayer( string.format("Allegiance set to %s", nationByNum[allegiance]));

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-518.867, 35.538, 588.64, 50)
    end

    if triggerLightCutscene(player) then -- Quest: I Can Hear A Rainbow
        cs = 244
    elseif player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.VAIN and player:getCharVar("MissionStatus") == 1 then
        cs = 246
    end

    return cs
end

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end

function onRegionEnter(player, region)
end

function onEventUpdate(player, csid, option)
    if csid == 244 then
        lightCutsceneUpdate(player) -- Quest: I Can Hear A Rainbow
    elseif csid == 246 then
        if player:getZPos() > 461 then
            player:updateEvent(0, 0, 0, 0, 0, 6)
        elseif player:getXPos() > -240 then
            player:updateEvent(0, 0, 0, 0, 0, 7)
        end
    end
end

function onEventFinish(player, csid, option)
    if csid == 244 then
        lightCutsceneFinish(player) -- Quest: I Can Hear A Rainbow
    end
end