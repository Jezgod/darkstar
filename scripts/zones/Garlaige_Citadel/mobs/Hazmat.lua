------------------------------
-- Area: Garlaige Citadel
--   NM: Hazmat
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 300)
end