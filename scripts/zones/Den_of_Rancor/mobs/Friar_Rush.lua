------------------------------
-- Area: Den of Rancor
--   NM: Friar Rush
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 394)
end