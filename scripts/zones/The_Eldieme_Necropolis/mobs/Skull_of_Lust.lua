------------------------------
-- Area: The Eldieme Necropolis
--   NM: Skull of Lust
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 187)
end