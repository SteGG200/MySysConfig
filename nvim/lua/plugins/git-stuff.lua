return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		version = "*",
		config = function()
			local gs = require("gitsigns")
			gs.setup()

			vim.keymap.set(
				"n",
				"gph",
				"<cmd>Gitsigns preview_hunk<cr>",
				{ silent = true, desc = "[P]review [H]unk (git diff)" }
			)

			vim.keymap.set("n", "[c", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Go to previous change (hunk)" })
			vim.keymap.set("n", "]c", "<cmd>Gitsigns next_hunk<cr>", { desc = "Go to next change (hunk)" })
		end,
	},
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		config = function()
			require("git-conflict").setup({
				default_mappings = true, -- disable buffer local mapping created by this plugin
				default_commands = true, -- disable commands created by this plugin
				disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
				list_opener = 'copen', -- command or function to open the conflicts list
				highlights = { -- They must have background color, otherwise the default color will be used
					incoming = 'DiffAdd',
					current = 'DiffText',
				}
			})
		end,
	},
}
