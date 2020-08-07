-----------------------------------
-- Area: Kuftal Tunnel
--   NM: Cancer
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/hunts")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.ENWATER)
end

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 416)
end
