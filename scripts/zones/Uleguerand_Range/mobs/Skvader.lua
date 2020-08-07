-----------------------------------
-- Area: Uleguerand Range
--   NM: Skvader
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/hunts")
-----------------------------------

function onMobInitialize(mob)
    mob:setMod(dsp.mod.DOUBLE_ATTACK, 20)
end

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 321)
end
