-- -*- mode: lua; -*- vim: set syntax=lua:

-- https://github.com/mpeterv/luacheck/blob/master/src/luacheck/stds.lua
std = 'lua51'

-- Ignore libs as we aren't accountable for those
exclude_files = { 'lib/*.*' }

-- Ignore non-standard lua love behavior just right here
files['conf.lua'] = {
  globals = {
    'love'
  }
}
files['src/services/love.lua'] = {
  globals = {
    'love'
  }
}
-- Ignore busted spec file globals
files['src/*/*.spec.lua'] = {
  globals = {
    'after_each',
    'before_each',
    'describe',
    'match',
    'mock',
    'stub',
    'spy',
    'it'
  }
}

-- List of allowed globals
globals = {}

-- false, don't allow something to be defined (??)
allow_defined = false

-- false, don't allow something to be defined on top (??)
allow_defined_top = false

-- true, enable color on command line
color = true

-- true, enable error codes on command line
-- http://luacheck.readthedocs.org/en/stable/warnings.html
codes = true

-- true, don't allow globals
global = true

-- true, don't allow variables to be shadowed
redefined = true

-- true, don't allow use of the deprecated module function
module = true

-- true, don't allow unused variable
unused = true

-- true, don't allow unused arguments
unused_args = true

-- true, don't allow unused secondary variables
unused_secondaries = true
