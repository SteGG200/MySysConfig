return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		local parsers = {
			"c",
			"cpp",
			"lua",
			"vim",
			"html",
			"css",
			"javascript",
			"typescript",
			"tsx",
			"svelte",
			"python",
			"rust",
			"go",
			"gomod",
			"gosum",
			"markdown",
			"typst",
			"yaml",
		}

		require("nvim-treesitter").install(parsers)

		vim.api.nvim_create_autocmd('FileType', {
			pattern = parsers,
			callback = function ()
				vim.treesitter.start()
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end
		})
	end,
}
