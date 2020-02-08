-- vim: set filetype=lua :miv --
-- This file format is documented at https://luacheck.readthedocs.io/en/stable/

max_line_length = false

std = "min"
-- max - union of globals of Lua 5.1, Lua 5.2, Lua 5.3 and LuaJIT 2.x;
-- min - intersection of globals of Lua 5.1, Lua 5.2, Lua 5.3 and LuaJIT 2.x;
-- lua51 - globals of Lua 5.1 without deprecated ones;
-- lua51c - globals of Lua 5.1;
-- lua52 - globals of Lua 5.2;
-- lua52c - globals of Lua 5.2 compiled with LUA_COMPAT_ALL;
-- lua53 - globals of Lua 5.3;
-- lua53c - globals of Lua 5.3 compiled with LUA_COMPAT_5_2;
-- luajit - globals of LuaJIT 2.x;
-- ngx_lua - globals of Openresty lua-nginx-module 0.10.10, including standard LuaJIT 2.x globals;
-- love - globals added by LÖVE;
-- busted - globals added by Busted 2.0, by default added for files ending with _spec.lua within spec, test, and tests subdirectories;
-- rockspec - globals allowed in rockspecs, by default added for files ending with .rockspec;
-- luacheckrc - globals allowed in Luacheck configs, by default added for files ending with .luacheckrc;
-- none - no standard globals.
