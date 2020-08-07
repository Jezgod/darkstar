------------------------------
-- Area: Korroloka Tunnel
--   NM: Thoon
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 229)
end