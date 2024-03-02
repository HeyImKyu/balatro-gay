table.insert(mods,
        {
            mod_id = "gay",
            name = "Gay",
            version = "0.6.9",
            enabled = true,
            on_enable = function()
                G.localization.misc.poker_hands['Straight Flush'] = "Gay Flush"
                G.localization.misc.poker_hands['Straight'] = "Gay"
                G.localization.misc.poker_hands['Royal Flush'] = "Royal Gay Flush"

                local patch = [[


                G.localization.misc.poker_hands['Straight Flush'] = "Gay Flush"
                G.localization.misc.poker_hands['Straight'] = "Gay"
                G.localization.misc.poker_hands['Royal Flush'] = "Royal Gay Flush"

                init_localization()
                ]]

                local toPatch = "init_localization()"

                inject("game.lua", "Game:set_language", toPatch:gsub("([^%w])", "%%%1"), patch)

                sendDebugMessage("Done")
            end,
        }
)
