------------------------------
-- Area: Gusgen Mines
--   NM: Pulverized Pfeffer
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 232)
end