-----------------------------------
-- Area: Toraimarai Canal
--   NM: Canal Moocher
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/hunts")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.PLAGUE)
end

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 284)
end
