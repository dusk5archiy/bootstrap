local M = {}

function M.execute_command(command)
	local handle = io.popen(command, "r")

	if not handle then
		return nil
	end

	local result = handle:read("*a")
	handle:close()
	result = result:gsub("^%s*(.-)%s*$", "%1")
	return result
end

return M
