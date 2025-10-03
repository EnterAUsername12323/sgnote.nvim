local M = {}

-- Default options
M.opts = {
	path = vim.fn.expand(vim.env.HOME .. "/notes.md"),
}

local function file_exists(path)
	local f = io.open(path, "r")
	if f then
		f:close()
		return true
	end
	return false
end

function M.open_notes()
	local path = M.opts.path

	if not file_exists(path) then
		local f = io.open(path, "w")
		if f then
			f:close()
		end
	end

	-- Open in current buffer
	vim.cmd("edit " .. path)
end

function M.setup(opts)
	M.opts = vim.tbl_extend("force", M.opts, opts or {})

	vim.api.nvim_create_user_command("Notes", function()
		M.open_notes()
	end, {})
end

return M
