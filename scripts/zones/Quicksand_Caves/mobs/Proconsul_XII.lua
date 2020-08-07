-----------------------------------
-- Area: Quicksand Caves
--   NM: Proconsul XII
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/hunts")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 437)
end
