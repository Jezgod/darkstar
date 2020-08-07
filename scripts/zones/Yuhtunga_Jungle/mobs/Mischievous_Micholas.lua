-----------------------------------
-- Area: Yuhtunga Jungle
--   NM: Mischievous Micholas
-----------------------------------
require("scripts/globals/regimes")
require("scripts/globals/hunts")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 362)
    dsp.regime.checkRegime(player, mob, 126, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 128, 1, dsp.regime.type.FIELDS)
end
