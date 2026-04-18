local wezterm = require("wezterm")
local config_dir = wezterm.config_dir

local helper = dofile(config_dir .. "/helper.lua")

local data = {}

local function os_is_windows()
	return package.config:sub(1, 1) == "\\"
end

if os_is_windows() then
	data = {
		default_prog = { "cmd.exe", "/c", config_dir .. "\\..\\..\\..\\s7sys\\msys2\\run.cmd" },
	}
end

return helper.getConfigs(data)
