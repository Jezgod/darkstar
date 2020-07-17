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
    local opt1 = "1-the.Lion"
    local opt2 = "2-the.Stout.Arm"
    local opt3 = "3-the.Twin.Claw"
    local opt4 = "4-Allure"    
    local opt5 = "5-Eternity"    
    local opt6 = "6-the.Heavens"
    local opt7 = "7-the.Baying.Moon"   
    local opt8 = "8-the.Ebon.Hoof"   
    local opt9 = "9-Tremors"   
    local opt10 = "10-the.Savage.Tiger"   
    
    player:PrintToPlayer(string.format("Atma.of? %s %s %s %s %s %s %s Next>",opt1, opt2, opt3, opt4, opt5, opt6, opt7), 12);
    player:PrintToPlayer(string.format("Atma.of? %s %s %s",opt8, opt9, opt10), 12);
    player:PrintToPlayer("test");
     --player:SendSelectionMenu("Choose: opt1 opt2 opt3 opt opt5 opt6")
    
 
end;
