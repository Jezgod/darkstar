------------------------------
-- Area: Ifrits Cauldron
--   NM: Lindwurm
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 401)
end