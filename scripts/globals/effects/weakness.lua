-----------------------------------
--
-- Weakness
--
-----------------------------------
require("scripts/globals/status")

local zone_list =
{
	230, -- Southern San d'Oria
    	231, -- Northern San d'Oria
    	232, -- Port San d'Oria
    	233, -- Chateau d'Oraguille
	234, -- Bastok Mines
	235, -- Bastok Markets
	236, -- Port Bastok
	237, -- Metalworks
	238, -- Windurst Waters
    	239, -- Windurst Walls
    	240, -- Port Windurst
    	241, -- Windurst Woods
    	242, -- Heavens Tower
    	243, -- Ru'Lude Gardens
    	244, -- Upper Jeuno
    	245, -- Lower Jeuno
    	246, -- Port Jeuno
    	247, -- Rabao
    	248, -- Selbina
    	249, -- Mhaura
    	250, -- Kazham
    	251, -- Hall of the Gods
    	252  -- Norg
}

local function validZone(zone_list, id)
	for k,v in pairs(zone_list) do
		if v == id then
		return true
 		end
 	end
end

function onEffectGain(target, effect)

     zone = target:getZoneID()
     local nationByNum = {
	[0] = "None",
        [1] = "Player",
        [2] = "San d'Oria",
        [3] = "Bastok",
        [4] = "Windurst"
     }

    -- set player status
    nation = target:getNation()
    allegiance = 1

    if validZone(zone_list, zone) == true then
	target:setAllegiance(allegiance)
	target:PrintToPlayer( string.format("Allegiance set to %s", nationByNum[allegiance]) )
    else
	allegiance = nation + 2
    	target:setAllegiance(allegiance)
	target:PrintToPlayer( string.format("Allegiance set to %s", nationByNum[allegiance]) )
    end;  

    --reduce HP and MP by the power amount. Add 100% slow
    --NOTE: The power amount dictates the amount to REDUCE MAX VALUES BY. E.g. Power=75 means 'reduce max hp/mp by 75%'
    target:addMod(dsp.mod.HPP, -75)
    target:addMod(dsp.mod.MPP, -75)

    -- 100% Slow -- FIXME: Weakness should probably be its own source of slow
    target:addMod(dsp.mod.HASTE_MAGIC, -10000)

    if effect:getPower() == 2 then
        -- handle double weakness
        target:addMod(dsp.mod.RACC, -999)
        target:addMod(dsp.mod.MATT, -999)
    end
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    --restore HP and MP to its former state. Remove 100% slow
    target:delMod(dsp.mod.HPP,-75)
    target:delMod(dsp.mod.MPP,-75)
    target:delMod(dsp.mod.HASTE_MAGIC, -10000)

    if (effect:getPower() == 2) then
        -- handle double weakness
        target:delMod(dsp.mod.RACC, -999)
        target:delMod(dsp.mod.MATT,-999)
    end
end
