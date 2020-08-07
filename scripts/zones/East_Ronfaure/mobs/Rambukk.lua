-----------------------------------
-- Area: East Ronfaure
--  Mob: Rambukk
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 152)
end;

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID());
end;
