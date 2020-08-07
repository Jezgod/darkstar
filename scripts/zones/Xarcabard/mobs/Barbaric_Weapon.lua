-----------------------------------
-- Area: Xarcabard
--   NM: Barbaric Weapon
-- TODO: "Gains a Dread Spikes effect whenever Whirl of Rage is used."
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/hunts")
-----------------------------------

function onMobInitialize(mob)
    mob:setMod(dsp.mod.STORETP, 50) -- "Possesses extremely high Store TP."
end

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 318)
end
