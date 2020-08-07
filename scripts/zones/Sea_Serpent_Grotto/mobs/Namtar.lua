-----------------------------------
-- Area: Sea Serpent Grotto
--   NM: Namtar
-----------------------------------
require("scripts/globals/regimes")
require("scripts/globals/hunts")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 369)
    dsp.regime.checkRegime(player, mob, 805, 2, dsp.regime.type.GROUNDS)
end