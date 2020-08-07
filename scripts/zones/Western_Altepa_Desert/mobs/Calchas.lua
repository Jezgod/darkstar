-----------------------------------
-- Area: Western Altepa Desert
--   NM: Calchas
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/hunts")
-----------------------------------

function onMobInitialize(mob)
    mob:setMod(dsp.mod.TRIPLE_ATTACK, 33)
end

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 415)
end
