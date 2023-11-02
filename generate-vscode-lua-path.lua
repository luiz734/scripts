#! /usr/bin/env lua

-- converts the enviroment variables in .envrc to use in vscode

local env_path = '.envrc'
local f = io.open(env_path, 'r')
if not f then
    io.stderr:write('File .envrc not found in the current dir.')
    os.exit(1)
end

local content = f:read('a')
f:close()
local _, _, path = string.find(content, 'LUA_PATH%s*=%s*\'(.-)\'\n')
local _, _, cpath = string.find(content, 'LUA_CPATH%s*=%s*\'(.-)\'\n')

local output = ''
if path then
    output = output .. string.format('            "path": "%s",\n', path)
end
if cpath then
    output = output .. string.format('            "cpath": "%s",\n', cpath)
end
io.write(output)
io.flush()
