---------------------------------------------------------------------------------------------------
-- func: getNation
-- desc: Prints the nation of the currently selected target under the cursor
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
	local sandy = player:getConquestPointRatio(0)
 	local basty = player:getConquestPointRatio(1)
	local windy = player:getConquestPointRatio(2)

	player:PrintToPlayer(string.format("Current state of global PVP Conquest Point bonus is: San d'Oria %u%% / Bastok %u%% / Windurst %u%%",sandy, basty, windy)) --/ Bastok 'u%' / Windurst '%u'",player:getConquestPointRatio(0), player:getConquestPointRatio(1), player:getConquestPointRatio(2)));
    
end;
