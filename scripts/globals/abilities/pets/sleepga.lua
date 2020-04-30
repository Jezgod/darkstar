-----------------------------------------
-- Sleepga
-----------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onAbilityCheck(player, target, ability)
    local leaderid = player:getLeaderID()
    local targetid = target:getLeaderID()
    local master = target:getMaster()

    if (leaderid ~= targetid and master == nil) then
	return 0,0

    elseif (leaderid == targetid) then
        return dsp.msg.basic.CANNOT_ATTACK_TARGET,0

    elseif (leaderid == master:getLeaderID()) then
	return dsp.msg.basic.CANNOT_ATTACK_TARGET,0

    else     
        return 0,0 
    end

end

function onPetAbility(target, pet, skill)
    local duration = 60
    local resm = applyPlayerResistance(pet,-1,target,pet:getStat(dsp.mod.INT)-target:getStat(dsp.mod.INT),dsp.skill.ELEMENTAL_MAGIC, 5)
    if (resm < 0.5) then
        skill:setMsg(dsp.msg.basic.RESIST) -- resist message
        return dsp.effect.SLEEP_I
    end
    duration = duration * resm
    if (target:hasImmunity(1) or hasSleepEffects(target)) then
        --No effect
        skill:setMsg(dsp.msg.basic.SKILL_NO_EFFECT)
    else
        skill:setMsg(dsp.msg.basic.SKILL_ENFEEB)

        target:addStatusEffect(dsp.effect.SLEEP_I,1,0,duration)
    end

    return dsp.effect.SLEEP_I
end
