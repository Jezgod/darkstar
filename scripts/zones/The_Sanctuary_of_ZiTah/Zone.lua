-----------------------------------
--
-- Zone: The_Sanctuary_of_ZiTah (121)
--
-----------------------------------
local ID = require("scripts/zones/The_Sanctuary_of_ZiTah/IDs")
require("scripts/globals/icanheararainbow")
require("scripts/globals/chocobo_digging")
require("scripts/globals/conquest")
require("scripts/globals/missions")
require("scripts/globals/zone")
-----------------------------------

function onChocoboDig(player, precheck)
    return dsp.chocoboDig.start(player, precheck)
end

function onInitialize(zone)
    GetMobByID(ID.mob.NOBLE_MOLD):setLocalVar("pop", os.time() + math.random(43200, 57600)) -- 12 to 16 hr

    dsp.conq.setRegionalConquestOverseers(zone:getRegionID())
end

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
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
        player:setPos(539.901, 3.379, -580.218, 126)
    end

    if triggerLightCutscene(player) then -- Quest: I Can Hear A Rainbow
        cs = 2
    elseif player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.VAIN and player:getCharVar("MissionStatus") == 1 then
        cs = 4
    end

    return cs
end

function onRegionEnter(player, region)
end

function onEventUpdate(player, csid, option)
    if csid == 2 then
        lightCutsceneUpdate(player) -- Quest: I Can Hear A Rainbow
    elseif csid == 4 then
        if player:getPreviousZone() == dsp.zone.THE_BOYAHDA_TREE then
            player:updateEvent(0, 0, 0, 0, 0, 7)
        elseif player:getPreviousZone() == dsp.zone.MERIPHATAUD_MOUNTAINS then
            player:updateEvent(0, 0, 0, 0, 0, 1)
        end
    end
end

function onEventFinish(player, csid, option)
    if csid == 2 then
        lightCutsceneFinish(player) -- Quest: I Can Hear A Rainbow
    end
end
