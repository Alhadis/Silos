-- .luacheckrc: Luacheck configuration
-- Reference: https://luacheck.readthedocs.io/en/stable/config.html

-- Allow common WoW environment globals.
read_globals = {'time', 'bit', 'LibStub'}

-- Override default of 120.
max_line_length = 100
-- Override default of 120 for localization files.
files['locale/'].max_line_length = false

-- Ensure reasonable cyclomatic complexity.
max_cyclomatic_complexity = 10

-- Exclude libraries.
exclude_files = {'lib'}
