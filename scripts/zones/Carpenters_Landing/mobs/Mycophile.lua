------------------------------
-- Area: Carpenters Landing
--   NM: Mycophile
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 166)
end