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
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true
			}

			vim.lsp.enable({
				'lua_ls',
				'clangd',
				'basedpyright',
				'rust_analyzer',
				'gopls',
				'ts_ls',
				'svelte',
				'html',
				'cssls',
				'tailwindcss',
			})
			
			vim.lsp.config('*', {
				capabilities = capabilities,
				root_dir = vim.fn.getcwd(),
			})

			-- Lua
			vim.lsp.config('lua_ls', {
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
			})

			-- Rust
			vim.lsp.enable('rust_analyzer')
			vim.lsp.config('rust_analyzer', {
				on_attach = function (_, bufnr)
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end,
				settings = {
					["rust-analyzer"] = {
						imports = {
							granularity = {
								group = "module",
							},
							prefix = "self",
						},
						cargo = {
							buildScripts = {
								enable = true,
							},
						},
						procMacro = {
							enable = true
						},
					}
				}
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show document" })
			vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { silent = true, desc = "[G]o to [D]efinition" })
			vim.keymap.set("n", "grr", "<cmd>Telescope lsp_references<cr>", { silent = true, desc = "List all [R]eferences" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
			vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Show [C]ode [D]iagnostics" })
		end,
	},
}
