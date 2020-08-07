------------------------------
-- Area: Rolanberry Fields
--   NM: Black Triple Stars
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 215)
end