------------------------------
-- Area: Quicksand Caves
--   NM: Sabotender Bailarina
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 438)
end