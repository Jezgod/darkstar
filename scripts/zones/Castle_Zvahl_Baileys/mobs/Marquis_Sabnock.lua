------------------------------
-- Area: Castle Zvahl Baileys
--   NM: Marquis Sabnock
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 352)
end