-----------------------------------
-- Area: Lower Delkfutt's Tower
--   NM: Tyrant
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/hunts")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.MAGIC_COOL, 14)
end

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 343)
end