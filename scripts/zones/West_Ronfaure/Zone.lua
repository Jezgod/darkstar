-----------------------------------
--
-- Zone: West_Ronfaure (100)
--
-----------------------------------
local ID = require("scripts/zones/West_Ronfaure/IDs")
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
	
    -- turn on stylelock
    player:lockstyleOn()

    -- get nation
    nation = player:getNation()
    allegiance = nation + 2

    -- set nation  
    player:setAllegiance( allegiance );
    player:PrintToPlayer( string.format("Allegiance set to %s", nationByNum[allegiance]));

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-24.427, -53.107, 140, 127)
    end

    if triggerLightCutscene(player) then -- Quest: I Can Hear A Rainbow
        cs = 51
    elseif player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.VAIN and player:getCharVar("MissionStatus") == 1 then
        cs = 53
    end

    return cs
end

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end

function onRegionEnter(player, region)
end

function onEventUpdate(player, csid, option)
    if csid == 51 then
        lightCutsceneUpdate(player) -- Quest: I Can Hear A Rainbow
    elseif csid == 53 then
        player:updateEvent(0, 0, 0, 0, 0, 5)
    end
end

function onEventFinish(player, csid, option)
    if csid == 51 then
        lightCutsceneFinish(player) -- Quest: I Can Hear A Rainbow
    end
end