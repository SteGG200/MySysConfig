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
				"typescript",
				"tsx",
				"python",
				"go",
				"gomod",
				"gosum",
				"markdown",
			},
			sync_install = false,
			auto_install = false,
			highlight = {
				enable = true,
			},
			indent = { enable = true },
		})
	end,
}
