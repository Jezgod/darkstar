-----------------------------------
-- Area: Boneyard Gully
--  Mob: Race Runner
--  ENM: Like the Wind
-----------------------------------
require("scripts/globals/pathfind")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

local pathNodes =
{
    -539, 0, -481,
    -556, 0, -478,
    -581, 0, -475,
    -579, -3, -460,
    -572, 2, -433,
    -545, 1, -440,
    -532, 0, -466
}

function onMobSpawn(mob)
    mob:speed(100)
    onMobRoam(mob)
end

function onPath(mob)
    dsp.path.patrol(mob, pathNodes, dsp.path.flag.RUN);
end;

function onMobRoam(mob)
    -- move to start position if not moving
    if not mob:isFollowingPath() then
        mob:pathThrough(dsp.path.first(pathNodes), dsp.path.flag.REVERSE)
    end
end

function onMobDeath(mob, player, isKiller)
end
