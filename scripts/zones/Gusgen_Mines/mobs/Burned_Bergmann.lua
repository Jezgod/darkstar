------------------------------
-- Area: Gusgen Mines
--   NM: Burned Bergmann
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 233)
end