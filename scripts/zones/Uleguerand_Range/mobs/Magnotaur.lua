-----------------------------------
-- Area: Uleguerand Range
--   NM: Magnotaur
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/hunts")
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(dsp.mod.REGAIN, 50)
end

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 322)
end
