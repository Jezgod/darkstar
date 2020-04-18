-----------------------------------------
-- Spell: Sleepga II
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    local cpid = caster:getPartyTID()
    local tpid = target:getPartyTID()
    local master = target:getMaster()
    if (cpid == tpid and cpid ~= nil) then
	return 1
    elseif (master ~= nil and cpid == master:getPartyTID()) then
	return 1
    else
	return 0
    end
end

function onSpellCast(caster, target, spell)
    local dINT = caster:getStat(dsp.mod.INT) - target:getStat(dsp.mod.INT)

    local duration = calculateDuration(90, spell:getSkillType(), spell:getSpellGroup(), caster, target)

    local params = {}
    params.diff = dINT
    params.skillType = dsp.skill.ENFEEBLING_MAGIC
    params.bonus = 0
    params.effect = dsp.effect.SLEEP_II
    local resist = applyResistanceEffect(caster, target, spell, params)

    if resist >= 0.5 then
        if target:addStatusEffect(params.effect, 2, 0, duration * resist) then
            spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST)
    end

    return params.effect
end