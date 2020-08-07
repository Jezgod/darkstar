------------------------------
-- Area: Bibiki Bay
--   NM: Intulo
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 265)
end