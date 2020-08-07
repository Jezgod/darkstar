-----------------------------------
-- Area: Castle Oztroja (151)
--   NM: Lii Jixa the Somnolist
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/hunts")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 306)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(3600, 5400)) -- 60 to 90 minutes
end
