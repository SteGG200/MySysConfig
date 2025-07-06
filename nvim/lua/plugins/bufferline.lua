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
		local mocha = require("catppuccin.palettes").get_palette("mocha")

		bufferline.setup({
			highlights = require("catppuccin.groups.integrations.bufferline").get({
				styles = {},
				custom = {
					mocha = {
						close_button_selected = {
							fg = mocha.sky,
						}
					}
				}
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
