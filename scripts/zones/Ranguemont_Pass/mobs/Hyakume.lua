------------------------------
-- Area: Ranguemont Pass
--   NM: Hyakume
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 344)
end