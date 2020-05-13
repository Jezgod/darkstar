---------------------------------------------------------------------------------------------------
-- func: !notes
-- desc: Prints the allied notes of the player
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)
    local currency = "allied_notes"
    local tAN = player:getCurrency(currency)
   
    player:PrintToPlayer(string.format("%s's Allied Notes total is: %u ", player:getName(),tAN));

end;
