return {
	'stevearc/overseer.nvim',
	config = function ()
		require('overseer').setup({
			templates = {
				'builtin',
				'user'
			},
			strategy = {
				"toggleterm",
				auto_scroll = true,
				open_on_start = true,
			},
		})

		vim.keymap.set("n", "<leader>or", "<cmd>OverseerRun<cr>", { silent = true, desc = "Open [O]verseer Task [R]unners" })
		vim.keymap.set("n", "<leader>oa", "<cmd>OverseerTaskAction<cr>", { silent = true, desc = "Open [O]verseer Task [A]ctions" })
	end
}
