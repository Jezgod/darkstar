------------------------------
-- Area: South Gustaberg
--   NM: Carnero
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 202)
end