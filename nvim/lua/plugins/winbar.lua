return {
	{
		'Bekaboo/dropbar.nvim',
		-- optional, but required for fuzzy finder support
		dependencies = {
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make'
		},
		config = function()
			require('dropbar').setup({
				sources = {
					terminal = {
						name = function(buf)
							local name = vim.api.nvim_buf_get_name(buf)
							-- the second result val is the terminal object
							local term = select(2, require("toggleterm.terminal").identify(name))
							if term then
								return term.display_name or term.name
							else
								return name
							end
						end,
					},
				},
			})

			local dropbar_api = require('dropbar.api')
			vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
			vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
			vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })
		end,
	}
}
