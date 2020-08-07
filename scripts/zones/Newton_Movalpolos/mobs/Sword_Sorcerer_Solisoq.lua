------------------------------
-- Area: Newton Movalpolos
--   NM: Sword Sorcerer Solisoq
------------------------------
require("scripts/globals/hunts")
------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 249)
end