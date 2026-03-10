return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npx --yes yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons" ,
			"nvim-treesitter/nvim-treesitter",
		},
		config = function ()
			require("render-markdown").setup({
				file_types = { "markdown", "quarto", "codecompanion" },
			})
		end
	}
}
