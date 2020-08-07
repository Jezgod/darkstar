-----------------------------------
-- Area: Xarcabard
--   NM: Shadow Eye
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 315)
end