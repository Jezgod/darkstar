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
	local sandy = player:getAlliedPointRatio(0)
 	local basty = player:getAlliedPointRatio(1)
	local windy = player:getAlliedPointRatio(2)

	player:PrintToPlayer(string.format("Current state of global PVP Allied Notes bonus is: San d'Oria %u%% / Bastok %u%% / Windurst %u%%",sandy, basty, windy)) --/ Bastok 'u%' / Windurst '%u'",sandy, basty, windy));
    
end;
