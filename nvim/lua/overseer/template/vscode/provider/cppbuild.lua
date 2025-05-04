local shell = require("overseer.shell")
local M = {}

---@param defn table This is the decoded JSON data for the task
---@return table
M.get_task_opts = function(defn)
	local command = defn.command
	if defn.args and not vim.tbl_isempty(defn.args) then
		local cmd_list = vim.list_extend({ defn.command }, defn.args)
		command = shell.escape_cmd(cmd_list)
	end
	return {
		-- cmd is required. It can be a string or list of strings.
		cmd = command,
		cwd = defn.options.cwd,
		problem_matcher = defn.problem_matcher,
	}
end

return M
