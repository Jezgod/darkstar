------------------------------
-- Area: Gusgen Mines
--   NM: Asphyxiated Amsel
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 235)
end