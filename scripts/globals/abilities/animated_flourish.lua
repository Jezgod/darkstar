-----------------------------------
-- Ability: Animated Flourish
-- Provokes the target. Requires at least one, but uses two Finishing Moves.
-- Obtained: Dancer Level 20
-- Finishing Moves Used: 1-2
-- Recast Time: 00:30
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)

    if (player:hasStatusEffect(dsp.effect.FINISHING_MOVE_1)) then
        return 0,0

    elseif (player:hasStatusEffect(dsp.effect.FINISHING_MOVE_2)) then
        return 0,0

    elseif (player:hasStatusEffect(dsp.effect.FINISHING_MOVE_3)) then
        return 0,0

    elseif (player:hasStatusEffect(dsp.effect.FINISHING_MOVE_4)) then
        return 0,0

    elseif (player:hasStatusEffect(dsp.effect.FINISHING_MOVE_5)) then
        return 0,0
    else
        return dsp.msg.basic.NO_FINISHINGMOVES,0
    end
end

function onUseAbility(player,target,ability)
    local duration = 1
    local TPGain = 1000

    if (player:hasStatusEffect(dsp.effect.FINISHING_MOVE_1)) then
        player:delStatusEffect(dsp.effect.FINISHING_MOVE_1)

    --Add extra enmity if 2 finishing moves are used
    elseif (player:hasStatusEffect(dsp.effect.FINISHING_MOVE_2)) then
        player:delStatusEffect(dsp.effect.FINISHING_MOVE_2)
        if (target:getObjType() == 1 or target:getObjType() == 8) then	
		player:setCursorTarget();
                target:addStatusEffect(dsp.effect.STUN,1,0,duration);
                target:addTP(TPGain);
	else
		target:addEnmity(player, 0, 500)
	end
        
    elseif (player:hasStatusEffect(dsp.effect.FINISHING_MOVE_3)) then
        player:delStatusEffectSilent(dsp.effect.FINISHING_MOVE_3)
        player:addStatusEffect(dsp.effect.FINISHING_MOVE_1,1,0,7200)
        if (target:getObjType() == 1 or target:getObjType() == 8) then
		player:setCursorTarget();
                target:addStatusEffect(dsp.effect.STUN,1,0,duration);
                target:addTP(TPGain);
	else
		target:addEnmity(player, 0, 500)
	end

    elseif (player:hasStatusEffect(dsp.effect.FINISHING_MOVE_4)) then
        player:delStatusEffectSilent(dsp.effect.FINISHING_MOVE_4)
        player:addStatusEffect(dsp.effect.FINISHING_MOVE_2,1,0,7200)
        if (target:getObjType() == 1 or target:getObjType() == 8) then	
		player:setCursorTarget();
                target:addStatusEffect(dsp.effect.STUN,1,0,duration);
                target:addTP(TPGain);
	else
		target:addEnmity(player, 0, 500)
	end

    elseif (player:hasStatusEffect(dsp.effect.FINISHING_MOVE_5)) then
        player:delStatusEffectSilent(dsp.effect.FINISHING_MOVE_5)
        player:addStatusEffect(dsp.effect.FINISHING_MOVE_3,1,0,7200)
        if (target:getObjType() == 1 or target:getObjType() == 8) then	
		player:setCursorTarget();
                target:addStatusEffect(dsp.effect.STUN,1,0,duration);
                target:addTP(TPGain);
	else
		target:addEnmity(player, 0, 500)
	end
    end
end