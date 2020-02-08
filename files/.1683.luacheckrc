-- library specific stuff
stds.logger = require('game.lib.logger-lua.luacheck-def')

-- game specific stuff
stds.game = {
    globals = {
        "SC",    -- table with game world resolution
        "require"  -- to allow for dev to override this function
    }
}

-- loads all the definitions and namespaces
std = "min+love+game+logger"

-- ignores
exclude_files = {
    -- ignoring the temporary files, because theses aren't
    -- part of the actual game
    "tmp/*",

    -- ignoring prototypes because these are experiments and
    -- not production / release.
    "prototypes/*",

    -- including any old stuff
    "*-old/*",
    "game/*-old/*",

    -- ignore the libraries because we assume they are good.
    "game/lib/*"
}