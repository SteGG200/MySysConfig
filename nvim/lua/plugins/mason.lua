return {
	"williamboman/mason.nvim",
	config = function()
		require("mason").setup()
		vim.keymap.set("n", "<C-a>", ":Mason<cr>", { silent = true, desc = "Open mason tool manager" })
	end,
}
