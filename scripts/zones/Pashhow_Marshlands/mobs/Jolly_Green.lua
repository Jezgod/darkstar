-----------------------------------
-- Area: Pashhow Marshlands
--   NM: Jolly Green
-----------------------------------
require("scripts/globals/regimes")
require("scripts/globals/hunts")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 212)
    dsp.regime.checkRegime(player, mob, 60, 3, dsp.regime.type.FIELDS)
end
