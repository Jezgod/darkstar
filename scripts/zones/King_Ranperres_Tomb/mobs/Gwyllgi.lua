------------------------------
-- Area: King Ranperres Tomb
--   NM: Gwyllgi
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 177)
end