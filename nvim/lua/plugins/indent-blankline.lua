return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		require("ibl").setup({
			indent = {
				char = "·",
				tab_char = "▏",
			},
			whitespace = {
				remove_blankline_trail = false,
			},
			exclude = {
				filetypes = {
					"dashboard",
				},
			},
		})
	end,
}
