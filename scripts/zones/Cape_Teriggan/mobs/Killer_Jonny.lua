-----------------------------------
-- Area: Cape Teriggan
--   NM: Killer Jonny
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/hunts")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
    mob:setMod(dsp.mod.DOUBLE_ATTACK, 100)
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.POISON, {power = 120})
end

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 407)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(28800, 86400)) -- 8 to 24 hours
end
