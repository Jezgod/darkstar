-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--   NM: Arioch
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/hunts")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.HP_DRAIN)
end

function onMobDeath(mob, player, isKiller)
     dsp.hunts.checkHunt(mob, player, 178)
end
