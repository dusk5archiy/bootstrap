if vim.g.vscode then
	vim.opt.clipboard = "unnamedplus"
	return
end

local W_CUSTOM_NVIM_CONFIG_DIR = os.getenv("W_CUSTOM_NVIM_CONFIG_DIR")
local CUSTOM_NVIM_CONFIG_DIR = os.getenv("CUSTOM_NVIM_CONFIG_DIR")

if W_CUSTOM_NVIM_CONFIG_DIR then
	package.path = package.path .. ";" .. W_CUSTOM_NVIM_CONFIG_DIR .. "\\lua\\?.lua"
else
	package.path = package.path .. ";" .. CUSTOM_NVIM_CONFIG_DIR .. "/lua/?.lua"
end

require("config.lazy")
