--luacheck: ignore
stds.factorio = {
  globals = {'aliengoopcracking'},
  read_globals = {
      --[[
      factorio-given globals

      @global@:  The global dictionary, useful for storing data persistent across a save-load cycle.
                 Writing access is given to the mod-id field (for mod-wise saved data).
                 (http://lua-api.factorio.com/latest/Global.html)
      @game@:    Main object through which most of the API is accessed.
                 It is, however, not available inside handlers registered with @script.on_load@.
                 (http://lua-api.factorio.com/latest/LuaGameScript.html)
      @script@:  Provides an interface for registering event handlers.
                 (http://lua-api.factorio.com/latest/LuaBootstrap.html)
      @defines@: Allows inter-mod communication by providing a repository of interfaces that is shared by all mods.
                 (http://lua-api.factorio.com/latest/LuaRemote.html)
      @log@:     Gives writing access to Factorio's logger instance.
      @serpent@: Lua serializer and pretty printer. (https://github.com/pkulchenko/serpent)
      @data@:    Table used to instantiate all game object prototypes. Use data:extend to write to it.
    --]]
    global = {
      fields = {
        aliengoopcracking = { 
          read_only = false,
          other_fields = true
        }
      }
    },

    table = {
      fields = {'deepcopy'}
    },

    data = {
      fields = {
        raw = {
          read_only = false,
          other_fields = true
        },

        'extend'
      }
    },

    'game', 'script', 'remote', 'defines', 'log', 'serpent', 'data', 'Event',

    -- project specific globals
    angelsmods = {
      fields = {'functions', 'refining', 'bioprocessing'}
    },

    bobmods = {
      fields = {'plates', 'enemies'}
    }
  }
}

std = '+factorio'

exclude_files = {'stdlib/'}