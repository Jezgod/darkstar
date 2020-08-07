-----------------------------------
-- Area: Rolanberry Fields
--   NM: Ravenous Crawler
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/hunts")
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(dsp.mod.REGAIN, 100)
end

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 217)
end
