local argparse = require 'argparse'

-- parse args
local parser = argparse('MyLuaApp', '')
parser:option('-f --foo', 'This is a foo')
local args = parser:parse()

print(args.foo)
