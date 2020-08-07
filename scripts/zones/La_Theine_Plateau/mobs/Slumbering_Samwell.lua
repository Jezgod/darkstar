------------------------------
-- Area: La Theine Plateau
--   NM: Slumbering Samwell
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 155)
end