-----------------------------------
-- Area: Lower Delkfutt's Tower
--   NM: Eurymedon
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/hunts")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 342)
end
