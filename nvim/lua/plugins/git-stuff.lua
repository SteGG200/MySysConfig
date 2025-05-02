return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		version = "*",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "gph", "<cmd>Gitsigns preview_hunk<cr>", { silent = true, desc = "[P]review [H]unk (git diff)" })
		end,
	},
}
