-----------------------------------
-- Area: Castle Zvahl Baileys (161)
--   NM: Marquis Naberius
-----------------------------------
require("scripts/globals/mobs")
require("scripts/globals/hunts")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.ENAERO)
end

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 350)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(3600, 7200)) -- 1 to 2 hours
end
