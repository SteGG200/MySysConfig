local my_autocmds = vim.api.nvim_create_augroup("my_autocmds", { clear = true })

vim.api.nvim_create_autocmd("BufReadPost", {
	group = my_autocmds,
	callback = function()
		print(vim.opt_local.signcolumn:get())
		if vim.opt_local.signcolumn:get() == 'yes' then
			vim.opt_local.statuscolumn = "%=%s%l %{v:lua.get_fold()} "
		else
			vim.opt_local.statuscolumn = ""
		end
	end,
})
