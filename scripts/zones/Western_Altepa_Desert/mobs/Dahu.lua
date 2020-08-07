------------------------------
-- Area: Western Altepa Desert
--   NM: Dahu
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 413)
end