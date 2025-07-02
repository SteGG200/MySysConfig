return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
	config = function()
		require("lualine").setup({
			sections = {
				lualine_x = { "overseer", "encoding", "fileformat", "filetype" },
			},
			options = {
				theme = "catppuccin",
			}
		})
	end,
}
