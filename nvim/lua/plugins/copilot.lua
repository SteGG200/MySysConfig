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
	},
	{
		"olimorris/codecompanion.nvim",
		version = "^19.0.0",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function ()
			require("codecompanion").setup({
				interactions = {
					chat = {
						adapter = "opencode",
					},
					cli = {
						agent = "opencode",
						agents = {
							opencode = {
								cmd = "opencode",
								args = {},
								description = "OpenCode CLI",
								provider = "terminal"
							}
						},
						keymaps = {
							back_to_code = {
								modes = { t = "<C-H>" },
								callback = function ()
									vim.cmd("wincmd h")
								end,
								description = "Back to code window",
							}
						},
						opts = {
							auto_insert = true,
							reload = true,
						}
					},
					inline = {
						adapter = "opencode",
					}
				},
				display = {
					cli = {
						window = {
							width = 0.35,
							opts = {
								signcolumn = "no",
								number = false,
								relativenumber = false,
								foldcolumn = "0",
							}
						}
					}
				}
			})
			
			vim.keymap.set({ "n", "t" }, "<F3>", require("codecompanion").toggle_cli, { desc = "Toggle Code Companion CLI", silent = true })
		end
	},
}
