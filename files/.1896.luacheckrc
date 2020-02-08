return {
  std = 'luajit',
  read_globals = {
    'box',
    ['os'] = {fields = {'setenv'}},
  },
  unused_args = false,
}
