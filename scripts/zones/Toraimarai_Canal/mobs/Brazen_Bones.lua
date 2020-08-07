------------------------------
-- Area: Toraimarai Canal
--   NM: Brazen Bones
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 286)
end