---------------------------------------------------------------------------------------------------
-- func: provoke
-- desc: Enables the players provoke.
---------------------------------------------------------------------------------------------------
require("scripts/globals/ability")
require("scripts/globals/status")

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
        --local skill = 

	player:delStatusEffect(dsp.effect.ASTRAL_FLOW)
        --player:dispelAllStatusEffect()
        --player:eraseAllStatusEffect()
        --player:addRecast(dsp.recast.ABILITY, 0, 600)
	--if (player:canLearnAbility(8) ~= true) then
        --player:addLearnedAbility(8)
        --printf("%s", player:hasLearnedAbility(8))
        --printf("%s", skill:getID())
	--player:delLearnedAbility(8)
        
        --end
	
	--player:PrintToPlayer(string.format("Provoke enabled"))
    	
end