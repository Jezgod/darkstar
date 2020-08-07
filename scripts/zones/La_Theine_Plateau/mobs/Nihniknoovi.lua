-----------------------------------
-- Area: La Theine Plateau
--  Mob: Nihniknoovi
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/hunts")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 600);
end;

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 153)
end;