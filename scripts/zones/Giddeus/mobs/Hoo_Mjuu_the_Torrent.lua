-----------------------------------
-- Area: Giddeus (145)
--   NM: Hoo Mjuu the Torrent
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/hunts")
-----------------------------------

function onMobSpawn(mob)
    dsp.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = dsp.jsa.BENEDICTION, hpp = math.random(10, 50)},
        },
    })
end;

function onMobDeath(mob, player, isKiller)
    dsp.hunts.checkHunt(mob, player, 281)
end;
