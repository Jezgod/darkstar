------------------------------
-- Area: Gusgen Mines
--   NM: Crushed Krause
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 231)
end