return {
	{
		"mason-org/mason-lspconfig.nvim",
		version = "*",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"ts_ls",
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
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Lua
			lspconfig.lua_ls.setup({
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
			})

			-- C++
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})

			-- Python
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})

			-- Golang
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})

			-- JavaScript/TypeScript
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})

			-- HTML
			lspconfig.html.setup({
				capabilities = capabilities,
			})

			-- CSS
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})

			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show document" })
			vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { silent = true, desc = "[G]o to [D]efinition" })
			vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { silent = true, desc = "List all [R]eferences" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
			vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Show [C]ode [D]iagnostics" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]ename [N]ame" })
		end,
	},
}
