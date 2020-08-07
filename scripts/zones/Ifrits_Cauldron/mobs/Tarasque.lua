------------------------------
-- Area: Ifrits Cauldron
--   NM: Tarasque
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 403)
end