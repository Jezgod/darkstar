------------------------------
-- Area: Sauromugue Champaign
--   NM: Bashe
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 273)
end