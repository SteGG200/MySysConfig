return {
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = {
					"stylua",
					"black",
					"prettier",
					"clang-format",
				},
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = false })
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.clang_format.with({
						extra_args = function(params)
							local dir = vim.fs.dirname(params.bufname)
							local found = vim.fs.find({ ".clang-format", "_clang-format" }, {
								upward = true,
								path = dir,
							})[1]

							if found then
								return { "-style=file" }
							end
							local my_style = "{ BasedOnStyle: Google, IndentWidth: 2, TabWidth: 2, UseTab: Always }"
							return { "-style=" .. my_style }
						end,
					}),
					null_ls.builtins.formatting.prettier.with({
						extra_args = { "--use-tabs" },
					}),
				},
				on_attach = function(client, bufnr)
					if client:supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({
									bufnr = bufnr,
									async = false,
									filter = function(formatting_client)
										return formatting_client.name == "null-ls"
											or formatting_client.name == "rust_analyzer"
									end,
								})
							end,
						})
					end
				end,
			})

			vim.keymap.set("n", "<Leader>i", vim.lsp.buf.format, { desc = "Format current file" })
		end,
	},
}
