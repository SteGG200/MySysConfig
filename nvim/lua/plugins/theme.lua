return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				no_italic = true,
				integrations = {
					cmp = true,
					neotree = true,
					mason = true,
					which_key = true,
					indent_blankline = {
						enabled = true,
						scope_color = "sky",
					},
					dropbar = {
						enabled = true,
						color_mode = true,
					},
				}
			})

			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
}
