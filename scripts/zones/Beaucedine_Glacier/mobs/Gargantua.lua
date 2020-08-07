-----------------------------------
-- Area: Beaucedine Glacier (111)
--   NM: Gargantua
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 312)
end
