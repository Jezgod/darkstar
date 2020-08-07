-----------------------------------
-- Area: Jugner Forest
--   NM: Supplespine Mujwuj
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/hunts")
-----------------------------------

function onMobInitialize(mob)
    mob:setMod(dsp.mod.DOUBLE_ATTACK, 100)
end

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 160)
end
