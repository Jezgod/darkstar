-----------------------------------
-- Area: Kuftal Tunnel
--   NM: Sabotender Mariachi
-- TODO: Auto-Regen during the day
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 417)
end
