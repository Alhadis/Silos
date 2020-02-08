-- .luacheckrc: Luacheck configuration
-- Reference: https://luacheck.readthedocs.io/en/stable/config.html

-- Allow common WoW environment globals.
read_globals = {'time', 'bit', 'LibStub'}

-- Override default of 120.
max_line_length = 100

-- Ensure reasonable cyclomatic complexity.
max_cyclomatic_complexity = 10
