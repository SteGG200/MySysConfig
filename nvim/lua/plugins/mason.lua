return {
	"williamboman/mason.nvim",
	config = function()
		require("mason").setup()
		vim.keymap.set("n", "<C-a>", ":Mason<cr>", { silent = true, desc = "Open m[A]son tool manager" })
	end,
}
