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
						accept_and_goto = "<M-w>",
						dismiss = "<M-Esc>",
					}
				}
			})
		end,
	}
}
