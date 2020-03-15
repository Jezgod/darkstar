---------------------------------------------------------------------------------------------------
-- func: offloot
-- desc: sets loot flag
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

local zone_list =
{
	230, -- Southern San d'Oria
    	231, -- Northern San d'Oria
    	232, -- Port San d'Oria
    	233, -- Chateau d'Oraguille
	234, -- Bastok Mines
	235, -- Bastok Markets
	236, -- Port Bastok
	237, -- Metalworks
	238, -- Windurst Waters
    	239, -- Windurst Walls
    	240, -- Port Windurst
    	241, -- Windurst Woods
    	242, -- Heavens Tower
    	243, -- Ru'Lude Gardens
    	244, -- Upper Jeuno
    	245, -- Lower Jeuno
    	246, -- Port Jeuno
    	247, -- Rabao
    	248, -- Selbina
    	249, -- Mhaura
    	250, -- Kazham
    	251, -- Hall of the Gods
    	252  -- Norg
}

local function validZone(zone_list, id)
	for k,v in pairs(zone_list) do
		if v == id then
		return true
 		end
 	end
end

function onTrigger(player)
	zone = player:getZoneID()
	local var = 2
	local nationByNum = {
		[0] = "None",
        	[1] = "Player",
        	[2] = "San d'Oria",
        	[3] = "Bastok",
        	[4] = "Windurst"
    	}
	
    -- set player status
	nation = player:getNation()
    	allegiance = 0
	player:setCharVar("loot", 2)
	
	if validZone(zone_list, zone) == true then
		player:PrintToPlayer( string.format("This function is not valid here."))
		goto done	

    	elseif player:getCharVar("loot") == 2 then
		allegiance = nation + 2
		player:setAnimation(0)
     		player:setAllegiance( allegiance )
		player:PrintToPlayer( string.format("Allegiance set to %s", nationByNum[allegiance]) )
   	end;
::done::	
end;

