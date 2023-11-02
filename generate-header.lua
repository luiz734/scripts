#! /usr/bin/env lua

-- create a formatted markdown header

local current_date = os.date('%d/%m/%Y')
local user_name = os.getenv('USER_NAME')
local user_ra = os.getenv('USER_RA')

local header = string.format([[
**Nome**: %s
**RA**: %s
**Data**: %s]], user_name, user_ra, current_date)

io.write(header)
io.flush()
