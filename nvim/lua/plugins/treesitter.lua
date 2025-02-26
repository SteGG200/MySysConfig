return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"c",
				"cpp",
				"lua",
				"vim",
				"html",
				"css",
				"javascript",
				"python",
				"markdown",
			},
			sync_install = false,
			auto_install = false,
			hightlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
