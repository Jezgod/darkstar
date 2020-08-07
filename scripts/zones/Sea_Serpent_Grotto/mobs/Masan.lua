-----------------------------------
-- Area: Sea Serpent Grotto
--   NM: Masan
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/hunts")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.GIL_MIN, 1500)
    mob:setMobMod(dsp.mobMod.GIL_MAX, 1800)
end

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 371)
end
