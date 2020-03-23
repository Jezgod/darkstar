-----------------------------------
-- Ability: Provoke
-- Goads an enemy into attacking you.
-- Obtained: Warrior Level 5
-- Recast Time: 0:30
-- Duration: 30 seconds
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
-----------------------------------



function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(user,target,ability)
	local duration = 3
	local TPGain = 1000

    --leave blank please! This file will be deleted when the core is updated.
	if (target:getObjType() == 1 or target:getObjType() == 8) then
		target:addStatusEffect(dsp.effect.BERSERK,25 + target:getMod(dsp.mod.BERSERK_EFFECT),0,30 + target:getMod(dsp.mod.BERSERK_DURATION));
		target:addStatusEffect(dsp.effect.STUN,1,0,duration);
		target:addTP(TPGain);
		return dsp.effect.BERSERK;
	else
	
	end
end