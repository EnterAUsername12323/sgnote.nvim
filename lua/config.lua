local M = {}

M.defaults = {
	path = vim.fn.expand(vim.env.HOME .. "/notes.md"),
}

--- Merge user options with defaults
---@param opts table?
function M.setup(opts)
	M.options = vim.tbl_extend("force", M.defaults, opts or {})
end

return M
