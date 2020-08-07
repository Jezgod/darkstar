-----------------------------------
-- Area: La Theine Plateau
--  Mob: Lumbering Lambert
-----------------------------------
local ID = require("scripts/zones/La_Theine_Plateau/IDs");
require("scripts/globals/hunts")
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 156)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.BLOODTEAR_PH, 10, math.random(75600, 86400)) -- 21-24 hours
end