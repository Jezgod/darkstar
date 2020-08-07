-----------------------------------
-- Area: Valkurm Dunes
--   NM: Metal Shears
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/hunts")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1);
end;

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.POISON, {power = 15, duration = math.random(10, 25)})
end

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 207)
end;

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(3600,4200)); -- 60-70min repop
end;
