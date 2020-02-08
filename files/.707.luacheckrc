-- .luacheckrc 配置文件
-- 安装: luarocks install luacheck
-- 使用: luacheck filename or directory
-- 示例: luacheck ./

cache = true
std = 'ngx_lua'
ignore = {
    "_", -- 忽略 _ 变量，我们用它来表示没有用到的变量
    "6..", -- 忽略格式上的warning
}
-- 这里因为客观原因，定的比较松。如果条件允许，你可以去掉这些豁免条例。
unused = false
unused_args = false
unused_secondaries = false
redefined = false
-- top-level module name
globals = {
    -- 标记 ngx.header and ngx.status 是可以被写入的
    "ngx",
}

-- 因为历史遗留原因，我们代码里有部分采用了旧风格的 module(..., package.seeall)
-- 来定义模块。下面一行命令用于找出这一类文件，并添加豁免的规则。
-- find -name '*.lua' -exec grep '^module(' -l {} \; | awk '{ print "\""$0"\"," }'
local old_style_modules = {
    -- ...
}
for _, path in ipairs(old_style_modules) do
    files[path].module = true
    files[path].allow_defined_top = true
end

-- 对用了 busted 测试框架的测试文件添加额外的标准
files["test/*_spec.lua"].std = "+busted"

-- 不检查来自第三方的代码库
exclude_files = {
    "nginx/resty",
}