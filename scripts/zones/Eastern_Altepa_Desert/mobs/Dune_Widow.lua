-----------------------------------
-- Area: Eastern Altepa Desert (114)
--   NM: Dune Widow
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 408)
end;
