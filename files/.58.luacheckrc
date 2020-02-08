std = 'luajit'
cache = true
codes = true
globals = {'_ENV', 'ngx'}
files['spec/'].read_globals = {
  'after_each',
  'assert',
  'before_each',
  'describe',
  'insulate',
  'it',
  'match',
  'mock',
  'setup',
  'spy',
  'stub',
  'teardown'
}
unused_args = false
ignore = {}
