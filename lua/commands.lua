local config = require("sgnote.config")

local M = {}

local function file_exists(path)
	local f = io.open(path, "r")
	if f then
		f:close()
		return true
	end
	return false
end

function M.open_notes()
	local path = config.options.path

	if not file_exists(path) then
		local f = io.open(path, "w")
		if f then
			f:close()
		end
	end

	vim.cmd("edit " .. path)

	vim.bo.swapfile = false

	-- auto reload if changed externally
	vim.o.autoread = true
	vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
		buffer = 0,
		command = "checktime",
	})
end

function M.register()
	vim.api.nvim_create_user_command("Notes", M.open_notes, {})
end

return M
