------------------------------
-- Area: The Boyahda Tree
--   NM: Ellyllon
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 357)
end