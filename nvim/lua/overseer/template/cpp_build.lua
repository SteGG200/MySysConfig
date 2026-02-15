---@type overseer.TemplateFileDefinition
return {
	name = "C/C++: g++ build active file",
	builder = function()
		-- Full path to current file (see :help expand())
		local file = vim.fn.expand("%:p")
		local basename = vim.fn.expand("%:p:r")
		return {
			name = "C/C++: g++ build active file",
			cmd = { "g++" },
			cwd = vim.fn.expand("%:p:h"),
			args = {
				"-fdiagnostics-color=always",
				"-g",
				file,
				"-o",
				basename,
			},
			components = { "default" },
		}
	end,
	priority = 61,
	condition = {
		filetype = { "cpp" },
	},
}
