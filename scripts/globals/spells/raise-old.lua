-----------------------------------------
-- Spell: Raise
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

--function onSpellCast(caster,target,spell)
    --local nationtarg = 0
    --local allegcast = 0
	
    -- get nation
    --nationtarg = target:getNation()
    --allegcast = caster:getAllegiance()
    --allegiance = nationtarg + 2
	
	
    -- set nation  
    --if allegcast ~= 1 then
      --target:setAllegiance( allegiance );
    --end

    if (target:isPC()) then
        target:sendRaise(1)
    else
        if (target:getName() == "Prishe") then
            -- CoP 8-4 Prishe
            target:setLocalVar("Raise", 1)
            target:entityAnimationPacket("sp00")
            target:addHP(target:getMaxHP())
            target:addMP(target:getMaxMP())
        end
    end
    spell:setMsg(dsp.msg.basic.MAGIC_CASTS_ON)

    return 1
end
