-----------------------------------
-- Area: Uleguerand Range
--   NM: Frost Flambeau
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.MAGIC_COOL, 15)
    mob:setMod(dsp.mod.UFASTCAST, 50)
end

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 320)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(7200,9000)) -- 2 to 2.5 hours
end
