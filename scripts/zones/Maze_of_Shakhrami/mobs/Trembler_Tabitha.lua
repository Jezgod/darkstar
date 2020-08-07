------------------------------
-- Area: Maze of Shakhrami
--   NM: Trembler Tabitha
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 293)
end