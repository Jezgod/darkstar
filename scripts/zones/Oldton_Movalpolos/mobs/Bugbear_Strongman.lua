------------------------------
-- Area: Oldton Movalpolos
--   NM: Bugbear Strongman
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 244)
end