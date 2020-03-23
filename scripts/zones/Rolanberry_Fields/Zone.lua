-----------------------------------
--
-- Zone: Rolanberry_Fields (110)
--
-----------------------------------
local ID = require("scripts/zones/Rolanberry_Fields/IDs")
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
    UpdateNMSpawnPoint(ID.mob.SIMURGH)
    GetMobByID(ID.mob.SIMURGH):setRespawnTime(math.random(900, 7200))
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
        player:setPos(-381.747, -31.068, -788.092, 211)
    end

    if triggerLightCutscene(player) then -- Quest: I Can Hear A Rainbow
        cs = 2
    elseif player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.VAIN and player:getCharVar("MissionStatus") == 1 then
        cs = 4
    end

    return cs
end

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end

function onRegionEnter(player, region)
end

function onGameHour(zone)
    -- Silk Caterpillar should spawn every 6 hours from 03:00
    -- this is approximately when the Jeuno-Bastok airship is flying overhead towards Jeuno.
    if VanadielHour() % 6 == 3 and not GetMobByID(ID.mob.SILK_CATERPILLAR):isSpawned() then
        -- Despawn set to 210 seconds (3.5 minutes, approx when the Jeuno-Bastok airship is flying back over to Bastok).
        SpawnMob(ID.mob.SILK_CATERPILLAR, 210)
    end
end

function onEventUpdate(player, csid, option)
    if csid == 2 then
        lightCutsceneUpdate(player) -- Quest: I Can Hear A Rainbow
    elseif csid == 4 then
        if player:getZPos() <  75 then
            player:updateEvent(0, 0, 0, 0, 0, 1)
        else
            player:updateEvent(0, 0, 0, 0, 0, 2)
        end
    end
end

function onEventFinish(player, csid, option)
    if csid == 2 then
        lightCutsceneFinish(player) -- Quest: I Can Hear A Rainbow
    end
end
