------------------------------
-- Area: Pashhow Marshlands
--   NM: Toxic Tamlyn
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 213)
end