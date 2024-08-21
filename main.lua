local logging = require("logging")
local logger = logging.getLogger("gay")

local function on_game_load()
    local patch = [[
                G.localization.misc.poker_hands['Straight Flush'] = "Gay Flush"
                G.localization.misc.poker_hands['Straight'] = "Gay"
                G.localization.misc.poker_hands['Royal Flush'] = "Royal Gay Flush"

                init_localization()
                ]]

    local toPatch = "init_localization()"

    logger:info("Gaying up the game")

    balalib.inject("game", "Game:set_language", toPatch, patch)
end

return {
    on_game_load = on_game_load
}
