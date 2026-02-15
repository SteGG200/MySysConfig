return {
	'stevearc/overseer.nvim',
	config = function ()
		require('overseer').setup()

		vim.keymap.set("n", "<leader>or", "<cmd>OverseerRun<cr>", { silent = true, desc = "Open [O]verseer Task [R]unners" })
		vim.keymap.set("n", "<leader>oa", "<cmd>OverseerTaskAction<cr>", { silent = true, desc = "Open [O]verseer Task [A]ctions" })
		vim.keymap.set("n", "<leader>ot", "<cmd>OverseerToggle<cr>", { silent = true, desc = "Open [O]verseer Task [T]oggle" })
	end
}
