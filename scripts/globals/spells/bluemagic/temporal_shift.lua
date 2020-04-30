-----------------------------------------
-- Spell: Temporal Shift
-- Enemies within range are temporarily prevented from acting
-- Spell cost: 48 MP
-- Monster Type: Luminians
-- Spell Type: Magical (Lightning)
-- Blue Magic Points: 5
-- Stat Bonus: HP+10, MP+15
-- Level: 73
-- Casting Time: 0.5 seconds
-- Recast Time: 120 seconds
-- Magic Bursts on: Impaction, Fragmentation, and Light
-- Combos: Attack Bonus
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    local leaderid = caster:getLeaderID()
    local targetid = target:getLeaderID()
    local master = target:getMaster()

    if (leaderid ~= targetid and master == nil) then
	return 0

    elseif (leaderid == targetid) then
	return 1

     elseif (leaderid == master:getLeaderID()) then
	return 1

     else     
        return 0 

    end

end

function onSpellCast(caster,target,spell)
    local typeEffect = dsp.effect.STUN
    local dINT = caster:getStat(dsp.mod.INT) - target:getStat(dsp.mod.INT)
    local params = {}
    params.diff = nil
    params.attribute = dsp.mod.INT
    params.skillType = dsp.skill.BLUE_MAGIC
    params.bonus = 0
    params.effect = dsp.effect.STUN
    local resist = applyResistanceEffect(caster, target, spell, params)
    local duration = 5 * resist

    if (resist > 0.0625) then -- Do it!
        if (target:addStatusEffect(typeEffect,2,0,duration)) then
            spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST)
    end

    return typeEffect
end
