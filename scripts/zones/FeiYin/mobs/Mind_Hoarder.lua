-----------------------------------
-- Area: Fei'Yin
--  Mob: Mind Hoarder
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/hunts")
-----------------------------------

function onMobDeath(mob, player, isKiller)
     dsp.hunts.checkHunt(mob, player, 347)

    -- Curses, Foiled A-Golem!?
    if (player:hasKeyItem(dsp.ki.SHANTOTTOS_NEW_SPELL)) then
        player:delKeyItem(dsp.ki.SHANTOTTOS_NEW_SPELL)
        player:addKeyItem(dsp.ki.SHANTOTTOS_EXSPELL)
    end

end