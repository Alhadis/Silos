std = 'lua52c' -- Lua 5.2 without compatibility extensions.
max_line_length = 100 -- Actually this should be 78 or so - but some lines
                      -- can't really be shorter.
unused_args = false
files['test'] = { std = '+busted' }
-- vim: set filetype=lua:
