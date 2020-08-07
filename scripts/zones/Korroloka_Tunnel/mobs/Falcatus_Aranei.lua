------------------------------
-- Area: Korroloka Tunnel
--   NM: Falcatus Aranei
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 227)
end