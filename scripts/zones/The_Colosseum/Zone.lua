-----------------------------------
--
-- Zone: The_Colosseum
--
-----------------------------------
local ID = require("scripts/zones/The_Colosseum/IDs")
require("scripts/globals/status")
require("scripts/globals/ability")
require("scripts/globals/teleports")
-----------------------------------

local job_map =
{
	[dsp.job.WAR] = {effect = dsp.effect.MIGHTY_STRIKES},
	[dsp.job.MNK] = {effect = dsp.effect.HUNDRED_FISTS},
	[dsp.job.WHM] = {effect = 0},
	[dsp.job.BLM] = {effect = dsp.effect.MANAFONT},	
	[dsp.job.RDM] = {effect = dsp.effect.CHAINSPELL},
	[dsp.job.THF] = {effect = dsp.effect.PERFECT_DODGE},
	[dsp.job.PLD] = {effect = dsp.effect.INVINCIBLE},
	[dsp.job.DRK] = {effect = dsp.effect.BLOOD_WEAPON},
	[dsp.job.BST] = {effect = 0},
	[dsp.job.BRD] = {effect = dsp.effect.SOUL_VOICE},
	[dsp.job.RNG] = {effect = 0},
	[dsp.job.SAM] = {effect = dsp.effect.MEIKYO_SHISUI},
	[dsp.job.NIN] = {effect = 0},
	[dsp.job.DRG] = {effect = 0},
	[dsp.job.SMN] = {effect = dsp.effect.ASTRAL_FLOW},
	[dsp.job.BLU] = {effect = dsp.effect.AZURE_LORE},
	[dsp.job.COR] = {effect = 0},
	[dsp.job.PUP] = {effect = 0},
	[dsp.job.DNC] = {effect = dsp.effect.TRANCE},
	[dsp.job.SCH] = {effect = dsp.effect.TABULA_RASA},
}

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    local mjob = player:getMainJob()
    local jobmap = job_map[mjob]
    --local maxtime = player:getCharVar("invasion")
    --local time = os.time()
    local nation = 0
    local nationByNum = {
	[0] = "None",
        [1] = "Player",
        [2] = "San d'Oria",
        [3] = "Bastok",
        [4] = "Windurst",
    }

    --if (maxtime > time) then
	--player:addStatusEffectEx(dsp.effect.TELEPORT, 0, dsp.teleport.id.HOME_NATION, 0, 1)
    --end
	
    -- turn on stylelock
    player:lockstyleOn()

    -- get nation
    nation = player:getNation()
    allegiance = nation + 2

    -- set nation  
    player:setAllegiance( allegiance );
    player:PrintToPlayer( string.format("Allegiance set to %s", nationByNum[allegiance]));
    
    -- prepare for war
    player:delStatusEffect(jobmap.effect);
    player:dispelAllStatusEffect();
    player:eraseAllStatusEffect();
    player:addRecast(dsp.recast.ABILITY, 0, 300);
    player:addStatusEffect(dsp.effect.BIND,1,0,30);
    player:setHP(player:getMaxHP());
    player:setMP(player:getMaxMP());
    printf("Job : %i",mjob)
    printf("Ability : %i",jobmap.effect)

    if (player:hasStatusEffect(dsp.effect.SIGNET)) then
    	player:delStatusEffect(dsp.effect.SIGNET)
    	player:addStatusEffect(dsp.effect.SANCTION,0,0,300)
    elseif (player:hasStatusEffect(dsp.effect.SIGIL)) then
    	player:delStatusEffect(dsp.effect.SIGIL)
    	player:addStatusEffect(dsp.effect.SANCTION,0,0,300)
    else
	player:addStatusEffect(dsp.effect.SANCTION,0,0,300)
    end

    player:addStatusEffectEx(dsp.effect.TELEPORT, 0, dsp.teleport.id.HOME_NATION, 0, 300)
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
