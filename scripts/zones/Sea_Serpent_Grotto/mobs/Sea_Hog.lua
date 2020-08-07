------------------------------
-- Area: Sea Serpent Grotto
--   NM: Sea Hog
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 376)
end