-----------------------------------
-- Area: Altar_Room
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.ALTAR_ROOM] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED      = 6381, -- You cannot obtain the item <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                = 6387, -- Obtained: <item>.
        GIL_OBTAINED                 = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED             = 6390, -- Obtained key item: <keyitem>.
        THE_MAGICITE_GLOWS_OMINOUSLY = 7101, -- The magicite glows ominously.
        CONQUEST_BASE                = 7102, -- Tallying conquest results...
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.ALTAR_ROOM]