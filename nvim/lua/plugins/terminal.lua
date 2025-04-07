return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			local user_functions = require("user-functions")
			if user_functions.get_OS() == "Windows" then
				vim.o.shell = ((vim.fn.executable("pwsh") == 1) and "pwsh.exe" or "powershell.exe")
				vim.o.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
				vim.o.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
				vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
				vim.o.shellquote = ""
				vim.o.shellxquote = ""
			end

			local terminal = require("toggleterm")
			terminal.setup({
				float_opts = {
					border = 'curved',
				},
			})

			vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { silent = true, desc = "Open [F]loat terminal" })
			vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical size=70<cr>", { silent = true, desc = "Open [V]ertical terminal" })
			vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { silent = true, desc = "Open [H]orizontal terminal" })
			vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { silent = true, desc = "[T]oggle terminal" })
			vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
		end,
	},
}

