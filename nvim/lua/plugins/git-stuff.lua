return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function ()
			require("gitsigns").setup()

			vim.keymap.set("n", "gph", "<cmd>Gitsigns preview_hunk<cr>", { silent = true, desc = "Show git diff" })
		end
	},
}
