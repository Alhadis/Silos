return {
  codes = true,
  std = 'max',
  exclude_files = {
    'spec/dataDumper.lua',
    'spec/tableShow.lua'
  },
  files = {
    ['spec/'] = {
      std = 'max+busted'
    },
    ['yarball/filesystem/love.lua'] = {
      std = 'max+busted+love'
    },
  }
}