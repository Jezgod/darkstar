-----------------------------------
-- Area: Dangruf Wadi
--   NM: Teporingo
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------


function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 223)
end
