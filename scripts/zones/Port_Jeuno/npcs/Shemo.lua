-----------------------------------
-- Area: Port Jeuno
--  NPC: Shemo
-- Orb Trader (BCNM)
-- !pos -14 8 44 246
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/quests");
local ID = require("scripts/zones/Port_Jeuno/IDs");
-----------------------------------

function onTrade(player,npc,trade)
    local NumberItem = trade:getItemCount();
    local Item = math.floor(NumberItem / 3)
    local bythree = NumberItem % 3
    local BeastmensSeal = player:getSeals(0);
    local KindredsSeal = player:getSeals(1);
    local KindredsCrest = player:getSeals(2);
    local HighKindredsCrest = player:getSeals(3);
    local SacredKindredsCrest = player:getSeals(4);
----------------------------------------------------------------------------------------------------------------------------
-------- Trading Seals/Crests to Shemo -------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
    if (bythree ~= 0) then
	player:PrintToPlayer( string.format("Please trade is quantities of three") )
	return 1;
    end
	
    if (trade:hasItemQty(1126,NumberItem) and trade:getItemCount() == NumberItem) then
        player:tradeComplete();
	player:addItem(1127,Item);
        player:messageSpecial(ID.text.ITEM_OBTAINED,1127);
        printf("item : %u",Item)

    --elseif (trade:hasItemQty(1127,NumberItem) and trade:getItemCount() == NumberItem) then
    --    player:addSeals(NumberItem,1);
    --    player:tradeComplete(trade);

    elseif (trade:hasItemQty(2955,NumberItem) and trade:getItemCount() == NumberItem) then
        player:tradeComplete();
	player:addItem(2956,Item);
        player:messageSpecial(ID.text.ITEM_OBTAINED,2956);
        printf("item : %u",Item)

    elseif (trade:hasItemQty(2956,NumberItem) and trade:getItemCount() == NumberItem) then
        player:tradeComplete();
	player:addItem(2957,Item);
        player:messageSpecial(ID.text.ITEM_OBTAINED,2957);
        printf("item : %u",Item)

    --elseif (trade:hasItemQty(2957,NumberItem) and trade:getItemCount() == NumberItem) then
    --    player:addSeals(NumberItem,4);
    --    player:tradeComplete(trade);
    end

end;

function onTrigger(player,npc)
	player:PrintToPlayer( string.format("Trade 3 seals/crests of a lower tier to get 1 higher tier seal/crest") )
end;