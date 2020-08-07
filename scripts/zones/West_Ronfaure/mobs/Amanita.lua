-----------------------------------
-- Area: West Ronfaure (100)
--   NM: Amanita
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 149)
end
