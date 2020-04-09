-----------------------------------
--
-- Zone: Meriphataud_Mountains_[S] (97)
--
-----------------------------------
local ID = require("scripts/zones/Meriphataud_Mountains_[S]/IDs")
require("scripts/globals/chocobo")
require("scripts/globals/status")
-----------------------------------

function onInitialize(zone)
    dsp.chocobo.initZone(zone)
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
        player:setPos(-454.135, 28.409, 657.79, 49)
    end
    return cs
end

function onRegionEnter(player, region)
end

function onGameHour(zone)
    local npc = GetNPCByID(ID.npc.INDESCRIPT_MARKINGS)
    local hour = VanadielHour()

    if npc then
        if hour == 17 then
            npc:setStatus(dsp.status.DISAPPEAR)
        elseif hour == 7 then
            npc:setStatus(dsp.status.NORMAL)
        end
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
