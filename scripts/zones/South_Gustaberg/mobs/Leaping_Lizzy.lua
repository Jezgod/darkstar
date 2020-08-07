------------------------------
-- Area: South Gustaberg
--   NM: Leaping Lizzy
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 200)
end