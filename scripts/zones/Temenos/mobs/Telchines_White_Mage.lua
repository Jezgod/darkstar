-----------------------------------
-- Area: Temenos N T
--  Mob: Telchines White Mage
-----------------------------------
require("scripts/globals/limbus")
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/Temenos/IDs")

function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        if GetMobByID(ID.mob.TEMENOS_N_MOB[3]):isDead() and GetMobByID(ID.mob.TEMENOS_N_MOB[3]+1):isDead() then
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[3]):setStatus(dsp.status.NORMAL)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[3]+1):setStatus(dsp.status.NORMAL)
            GetNPCByID(ID.npc.TEMENOS_N_CRATE[3]+2):setStatus(dsp.status.NORMAL)
        end
    end
end