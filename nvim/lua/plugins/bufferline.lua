return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"catppuccin/nvim"
	},
	config = function()
		vim.opt.termguicolors = true
		local bufferline = require("bufferline")

		bufferline.setup({
			highlights = require("catppuccin.groups.integrations.bufferline").get({
				styles = {},
			}),
			options = {
				separator_style = "slant",
				hover = {
					enabled = true,
					reveal = { 'close' },
				}
			},
		})

	end,
}
