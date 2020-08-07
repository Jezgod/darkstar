------------------------------
-- Area: The Boyahda Tree
--   NM: Unut
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 359)
end