require("scripts/globals/hunts")

function onTrade(player, npc, trade)
end

function onTrigger(player,npc,event)
  dsp.hunts.onTrigger(player,npc,event)
end

function onEventUpdate(player,csid,option)
  dsp.hunts.onEventUpdate(player,csid,option)
end

function onEventFinish(player, csid, option)
  dsp.hunts.onEventFinish(player, csid, option)
end