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
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("codecompanion").setup({
				interactions = {
					chat = {
						adapter = "copilot",
					},
					inline = {
						adapter = "copilot",
					},
					cmd = {
						adapter = "copilot",
					},
					background = {
						adapter = "copilot",
					},
				},

				adapters = {
					http = {
						copilot = function ()
							return require("codecompanion.adapters").extend("copilot", {
								schema = {
									model = {
										default = "claude-opus-4.6",
									}
								}
							})
						end
					}
				},

				prompt_library = {
					markdown= {
						dirs = {
							vim.fn.getcwd() .. "/.github/prompts",
							"~/.config/nvim/prompts",
						}
					}
				}
			})

			vim.keymap.set("n", "<F3>", "<cmd>CodeCompanionChat Toggle<cr>", { silent = true, desc = "Open Code Companion Chat" })
		end,
	},
}
