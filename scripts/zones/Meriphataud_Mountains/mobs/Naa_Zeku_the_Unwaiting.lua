------------------------------
-- Area: Meriphataud Mountains
--   NM: Naa Zeku the Unwaiting
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 271)
end