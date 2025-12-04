return {
	{
		"mason-org/mason-lspconfig.nvim",
		version = "*",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"basedpyright",
					"rust_analyzer",
					"gopls",
					"ts_ls",
					"svelte",
					"html",
					"cssls",
					"tailwindcss",
				},
				automatic_enable = false,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Lua
			vim.lsp.enable('lua_ls')
			vim.lsp.config['lua_ls'] = {
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = {
							-- Tell the language server which version of Lua you're using
							-- (most likely LuaJIT in the case of Neovim)
							version = "LuaJIT",
						},
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = {
								"vim",
								"require",
							},
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),
						},
						telemetry = {
							-- Do not send telemetry data containing a randomized but unique identifier
							enable = false,
						},
					},
				},
			}

			-- C++
			vim.lsp.enable('clangd')
			vim.lsp.config['clangd'] = {
				capabilities = capabilities,
			}

			-- Python
			vim.lsp.enable('basedpyright')
			vim.lsp.config['basedpyright'] = {
				capabilities = capabilities,
			}

			-- Rust
			vim.lsp.enable('rust_analyzer')
			vim.lsp.config['rust_analyzer'] = {
				capabilities = capabilities,
			}

			-- Golang
			vim.lsp.enable('gopls')
			vim.lsp.config['gopls'] = {
				capabilities = capabilities,
			}

			-- JavaScript/TypeScript
			vim.lsp.enable('ts_ls')
			vim.lsp.config['ts_ls'] = {
				capabilities = capabilities,
			}

			vim.lsp.enable('svelte')
			vim.lsp.config['svelte'] = {
				capabilities = capabilities,
			}

			-- HTML
			vim.lsp.enable('html')
			vim.lsp.config['html'] = {
				capabilities = capabilities,
			}

			-- CSS
			vim.lsp.enable('cssls')
			vim.lsp.config['cssls'] = {
				capabilities = capabilities,
			}

			vim.lsp.enable('tailwindcss')
			vim.lsp.config['tailwindcss'] = {
				capabilities = capabilities,
			}

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show document" })
			vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { silent = true, desc = "[G]o to [D]efinition" })
			vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { silent = true, desc = "List all [R]eferences" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
			vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Show [C]ode [D]iagnostics" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]ename [N]ame" })
		end,
	},
}
