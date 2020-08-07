-----------------------------------
-- Area: Labyrinth of Onzozo
--   NM: Soulstealer Skullnix
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/regimes")
require("scripts/globals/hunts")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 298)
    dsp.regime.checkRegime(player, mob, 771, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 772, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 774, 2, dsp.regime.type.GROUNDS)
end
