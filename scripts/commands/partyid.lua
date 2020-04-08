---------------------------------------------------------------------------------------------------
-- func: getid
-- desc: Prints the ID of the currently selected target under the cursor
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
    local targ = player:getCursorTarget();
--    local master = targ:getMaster();
--    local petid = master:getPartyTID();
    if (targ ~= nil) then
        player:PrintToPlayer(string.format("%s's party ID is: %u ", targ:getName(),targ:getPartyTID()));
--        player:PrintToPlayer(string.format("%s's Master ID is: %s ", targ:getName(), master));
--        player:PrintToPlayer(string.format("%s's Party ID is: %s ", targ:getName(), petid));
    else
        player:PrintToPlayer("Must select a target using in game cursor first.");
    end
end;