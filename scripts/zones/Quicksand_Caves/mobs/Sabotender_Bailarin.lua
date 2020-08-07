------------------------------
-- Area: Quicksand Caves
--   NM: Sabotender Bailarin
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 433)
end