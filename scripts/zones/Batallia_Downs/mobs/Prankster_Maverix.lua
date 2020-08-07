-----------------------------------
-- Area: Batallia Downs
--   NM: Prankster Maverix
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/hunts")
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(dsp.mod.REGAIN, 50)
end

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 164)
end
