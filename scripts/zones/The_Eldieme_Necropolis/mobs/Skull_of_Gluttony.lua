------------------------------
-- Area: The Eldieme Necropolis
--   NM: Skull of Gluttony
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 184)
end