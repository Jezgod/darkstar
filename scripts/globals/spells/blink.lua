-----------------------------------------
-- Spell: Blink
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local duration = calculateDuration(300, spell:getSkillType(), spell:getSpellGroup(), caster, target)
    local shadows = 2

    if (caster:getMainJob() == dsp.job.WHM and caster:hasStatusEffect(dsp.effect.DIVINE_SEAL)) then
	shadows = shadows * 2
	duration = duration * 2
    else
	shadows = shadows
	duration = duration
    end
	
    if target:addStatusEffect(dsp.effect.BLINK, shadows, 0, duration) then
		
        spell:setMsg(dsp.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end

    return dsp.effect.BLINK
end
