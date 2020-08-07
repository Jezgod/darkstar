-----------------------------------
-- Area: Buburimu Peninsula
--   NM: Wake Warder Wanda
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/hunts")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.MAGIC_COOL, 50) -- just one spell to spam
end

function onMobEngaged(mob,target)
    mob:setMod(dsp.mod.REGAIN, 25)
end

function onMobDisengage(mob)
    mob:setMod(dsp.mod.REGAIN,0)
end

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 260)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(3600, 4200)) -- repop 60-70min
end
