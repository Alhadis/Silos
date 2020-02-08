-- vim: set filetype=lua:
std = 'lua51'
unused_args = false
--allow_defined_top = true
globals = { 'love' }
-- Third party:
files['gamera.lua'] = {
  ignore = {'211'}
}
files['PROBE.lua'] = {
  ignore = {'111', '112', '113'}
}
files['main.lua'] = {
  ignore = {'111', '112', '113'}
}
