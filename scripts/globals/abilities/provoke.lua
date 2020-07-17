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
	local bindduration = 2
        local stunduration = 1
        --local amnesiaduration = 3
	local TPGain = 1000
        local pet = target:getPet()

        --leave blank please! This file will be deleted when the core is updated.
	if (target:getObjType() == 1 or target:getObjType() == 8) then
		
		user:setCursorTarget();
                target:addStatusEffect(dsp.effect.BIND,1,0,bindduration);
                target:addStatusEffect(dsp.effect.STUN,1,0,stunduration);
                --target:addStatusEffect(dsp.effect.AMNESIA,1,0,amnesiaduration);
                target:addTP(TPGain);

		if (target:hasPet() == false) then
			return 0;
		else
			pet:wait(15000);
                end
	
	else
	
	end

end