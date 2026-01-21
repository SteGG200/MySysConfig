return {
	{
		"zbirenbaum/copilot.lua",
		dependencies = {
			{ "copilotlsp-nvim/copilot-lsp" },
		},
		config = function()
			require("copilot").setup({
				panel = { enabled = false },
				suggestion = {
					enabled = true,
					auto_trigger = true,
					keymap = {
						accept = "<M-a>",
						accept_word = "<M-l>",
						accept_line = "<M-j>",
						dismiss = "<M-BS>",
					},
				},
				nes = {
					enabled = true,
					auto_trigger = true,
					keymap = {
						accept_and_goto = "<M-c>",
						dismiss = "<M-Esc>",
					}
				}
			})
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		config = function()
			require("CopilotChat").setup()
			vim.keymap.set("n", "<F3>", "<cmd>CopilotChat<cr>", { silent = true, desc = "Open Copilot Chat" })
		end,
	},
}
