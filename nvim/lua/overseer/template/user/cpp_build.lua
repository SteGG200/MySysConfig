return {
	name = "C++ build",
	builder = function()
		-- Full path to current file (see :help expand())
		local file = vim.fn.expand("%:p")
		local basename = vim.fn.expand("%:r")
		return {
			cmd = { "g++" },
			args = {
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
