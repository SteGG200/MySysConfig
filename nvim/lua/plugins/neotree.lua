return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = false,
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_hidden = false,
					hide_by_name = {
						".git",
					},
				},
			},
		})
		vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal left reveal_force_cwd<CR>", {})
		vim.keymap.set("n", "<leader>b", ":Neotree close<CR>", {})
		vim.keymap.set("n", "<F12>", ":Neotree float reveal_file=<cfile> reveal_force_cwd<cr>", {})
		vim.keymap.set("n", "<leader>g", ":Neotree float git_status<cr>", {})
	end,
}
