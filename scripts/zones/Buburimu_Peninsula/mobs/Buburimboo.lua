-----------------------------------
-- Area: Buburimu Peninsula (118)
--  Mob: Buburimboo
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 261)
end;
