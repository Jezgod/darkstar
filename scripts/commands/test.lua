-------------------------------------------------------------------------------
--  Command: Test
--  Details: Test command for trying new things
--  Syntax:  !test
-------------------------------------------------------------------------------
cmdprops =
{
    permission = 1,
    parameters = "s"
}
-------------------------------------------------------------------------------
require("scripts/Retrib/Quests")
require("scripts/globals/status");
-------------------------------------------------------------------------------
function onTrigger(PC)
	--PC:SendAnnouncement();
    --PC:DeleteHunt()
    --local Hunt =  PC:GetNewHunt(PC:GetHighestLevel())
    --PC:PrintToPlayer("Name: "..Hunt[1], 29)
    --PC:completeQuest(SANDORIA, dsp.quest.id.sandoria.GROWING_FLOWERS)
    --PC:completeQuest(BASTOK,   dsp.quest.id.bastok.A_LADY_S_HEART)
	--PC:completeQuest(WINDURST, dsp.quest.id.windurst.FLOWER_CHILD)
	--PC:completeQuest(JEUNO,    dsp.quest.id.jeuno.PRETTY_LITTLE_THINGS)
    --PC:CompleteRetribQuest(Retrib.Quests.ACureForWhatAilsYou.ID)
    --PC:UpdateEvents()
	--PC:SendServerMessage("Test Message")
	--PC:PrintToPlayer(string.format("Genkai: %s", --PC:TrueGenkai()), 29)
	--PC:StoreCoords()
	--PC:ResetCoords()
	--PC:PrintToPlayer(string.format("Can Warp: %s", --PC:CanWarp()), 29)
	--PC:GoBack()
	--PC:ToDestination(33)
	--PC:PrintToPlayer(string.format("Has WAR 75: %s", --PC:Has75Job(1)), 29)
	--PC:PrintToPlayer(string.format("Has GID HP: %s", --PC:HasRetribHomepoint(0)), 29)
	--PC:PrintToPlayer(string.format("HP Count: %s", --PC:GetHomepointsCount()), 29)
	--PC:PrintToPlayer(string.format("Has All HP: %s", --PC:HasAllRetribHomepoints()), 29)
	--PC:AddRetribHomepoint(1)
	--PC:PrintToPlayer(string.format("GID HP Stage: %s", --PC:GetRetribHPStage(0)), 29)
	--PC:SetRetribHPStage(0,1)
	--PC:DeleteRetribHomepoint(0)
	--PC:SetRetribQuestTimer(0, os.time())
	--PC:PrintToPlayer(string.format("Retrib Timer Quest 0: %s", --PC:GetRetribQuestTimer(0)), 29)
	--PC:PrintToPlayer(string.format("Retrib Stat 0: %s", --PC:GetRetribStat(0)), 29)
	--PC:AddRetribStat(0)
	--PC:SetRetribQuestStatus(0, 5)
	--PC:AddRetribQuestStatus(0)
	--PC:CompleteRetribQuest(0)
	--PC:DeleteRetribQuest(0)
	--PC:PrintToPlayer(string.format("Retrib Quest Status 0: %s", --PC:GetRetribQuestStatus(0)), 29)
	--PC:PrintToPlayer(string.format("Has completed Quest 0: %s", --PC:HasCompletedRetribQuest(0)), 29)
	--PC:CreateEmptyItem(17132)
        --PC:StartEvent(Retrib.Event.Strongest)
	  
	
end