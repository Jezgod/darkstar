------------------------------
-- Area: King Ranperres Tomb
--   NM: Ankou
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 176)
end