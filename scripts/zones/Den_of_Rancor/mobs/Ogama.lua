------------------------------
-- Area: Den of Rancor
--   NM: Ogama
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 398)
end