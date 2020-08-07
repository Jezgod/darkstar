-----------------------------------
-- Area: Tahrongi Canyon
--  Mob: Habrok
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------

function onMobInitialize(mob)
    mob:setLocalVar("pop", os.time() + math.random(1200,7200))
end

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 258)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setLocalVar("pop", os.time() + math.random(1200,7200))
end
