-- luacheck: globals std
-- luacheck: globals max_line_length
-- luacheck: globals stds

stds.ellips = dofile("EllipsLuaBindingsTable.lua")

stds.i10 =
{
  read_globals =
  {
    i10 = { fields = {
      pi = { read_only = true } 
    }}
  }
}

std = "max+ellips+i10"
  
max_line_length = 220