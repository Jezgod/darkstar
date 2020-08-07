------------------------------
-- Area: Tahrongi Canyon
--   NM: Herbage Hunter
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 259)
end