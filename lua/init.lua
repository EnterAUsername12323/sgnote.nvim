local config = require("sgnote.config")
local commands = require("sgnote.commands")

local M = {}

function M.setup(opts)
	config.setup(opts)
	commands.register()
end

return M
