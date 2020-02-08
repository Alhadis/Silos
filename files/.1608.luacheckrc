std = "max" -- globals are defined by the union of globals of Lua 5.1, Lua 5.2, Lua 5.3, and LuaJIT 2.x
read_globals = {
  ngx = {
    other_fields = true, -- all fields of `ngx` are read-only except those defined in `fields` below
    fields = {
      status = {
        read_only = false, -- `ngx.status` is not read-only
      },
      header = {
        read_only = false,
        other_fields = true, -- `ngx.header.anything` is defined and can be set
      },
      ctx = {
        read_only = false,
        other_fields = true, -- `ngx.ctx.anything` is defined and can be set
      },
      var = {
        read_only = false,
        other_fields = true, -- `ngx.var.anything` is defined and can be set
      },
    },
  },
} -- these globals can only be accessed.

files["specs/lib/resty/*_spec.lua"].std = "+busted"

exclude_files = ["*.rockspec", ]
