local M = {}

local home = vim.env.HOME

M.opts = {
	path = vim.fn.expand(home .. "/notes.md"),
}

-- Path to your global notes file
local notes_file = vim.fn.expand(home .. "/notes.md")

local function file_exists(path)
	local path = M.opts.path

	if not file_exists(path) then
		-- Create the file
		local f = io.open(path, "w")
		if f then
			f:close()
		end
	end

	-- Open in current buffer
	vim.cmd("edit " .. path)
end

-- Setup function to create command
function M.setup()
	M.opts = vim.tbl_extend("force", M.opts, opts or {})
	vim.api.nvim_create_user_command("Notes", function()
		M.open_notes()
	end, {})
end

return M
