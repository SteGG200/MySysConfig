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
		version = "18.*",
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
										default = "gpt-5.3-codex",
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
				},
				extensions = {
					mcphub = {
						callback = "mcphub.extensions.codecompanion",
						opts = {
							-- MCP Tools
							make_tools = true,              -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
							show_server_tools_in_chat = true, -- Show individual tools in chat completion (when make_tools=true)
							add_mcp_prefix_to_tool_names = false, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
							show_result_in_chat = true,      -- Show tool results directly in chat buffer
							format_tool = nil,               -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
							-- MCP Resources
							make_vars = true,                -- Convert MCP resources to #variables for prompts
							-- MCP Prompts
							make_slash_commands = true,      -- Add MCP prompts as /slash commands
						}
					}
				}
			})

			vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>CodeCompanionChat Toggle<cr>", { silent = true, desc = "Open Code Companion Chat" })
		end,
	},
	{
		"ravitemer/mcphub.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		build = "bundled_build.lua",  -- Bundles `mcp-hub` binary along with the neovim plugin
		config = function()
			require("mcphub").setup({
				use_bundled_binary = true,  -- Use local `mcp-hub` binary
				shutdown_delay = 30 * 000,
			})

			vim.keymap.set({ "n" }, "<F4>", "<cmd>MCPHub<cr>", { silent = true, desc = "Toggle MCP Hub" })
		end,
	}
}
