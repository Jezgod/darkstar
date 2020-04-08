-----------------------------------
--
-- Zone: Xarcabard (112)
--
-----------------------------------
local ID = require("scripts/zones/Xarcabard/IDs")
require("scripts/globals/icanheararainbow")
require("scripts/globals/conquest")
require("scripts/globals/keyitems")
require("scripts/globals/zone")
-----------------------------------

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

    local UnbridledPassionCS = player:getCharVar("unbridledPassion")

    if prevZone == dsp.zone.DYNAMIS_XARCABARD then -- warp player to a correct position after dynamis
        player:setPos(569.312, -0.098, -270.158, 90)
    end

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-136.287, -23.268, 137.302, 91)
    end

    if not player:hasKeyItem(dsp.ki.VIAL_OF_SHROUDED_SAND) and player:getRank() >= 6 and player:getMainLvl() >= 65 and bit.band(player:getCharVar("Dynamis_Status"), 1) == 0 then
        player:setCharVar("Dynamis_Status", 1)
        cs = 13
    elseif triggerLightCutscene(player) then -- Quest: I Can Hear A Rainbow
        cs = 9
    elseif UnbridledPassionCS == 3 then
        cs = 4
    elseif player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.VAIN and player:getCharVar("MissionStatus") == 1 then
        cs = 11
    end

    return cs
end

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end

function onRegionEnter(player, region)
end

function onEventUpdate(player, csid, option)
    if csid == 9 then
        lightCutsceneUpdate(player) -- Quest: I Can Hear A Rainbow
    elseif csid == 11 then
        if player:getPreviousZone() == dsp.zone.BEAUCEDINE_GLACIER then
            player:updateEvent(0, 0, 0, 0, 0, 2)
        else
            player:updateEvent(0, 0, 0, 0, 0, 3)
        end
    end
end

function onEventFinish(player, csid, option)
    if csid == 9 then
        lightCutsceneFinish(player) -- Quest: I Can Hear A Rainbow
    elseif csid == 4 then
        player:setCharVar("unbridledPassion", 4)
    end
end