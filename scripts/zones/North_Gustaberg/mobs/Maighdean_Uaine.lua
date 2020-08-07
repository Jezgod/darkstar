------------------------------
-- Area: North Gustaberg
--   NM: Maighdean Uaine
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 198)
end