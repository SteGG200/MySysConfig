return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		local logo = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
		]]

		logo = string.rep("\n", 5) .. logo .. "\n"

		require("dashboard").setup({
			-- config
			theme = "hyper",
			hide = {
				statusline = false,
			},
			config = {
				header = vim.split(logo, "\n"),
				shortcut = {
					{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
					{
						desc = " Open file",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{
						desc = " New file",
						action = "enew",
						key = "n",
					}
					-- {
					-- 	desc = ' Apps',
					-- 	group = 'DiagnosticHint',
					-- 	action = 'Telescope app',
					-- 	key = 'a',
					-- },
					-- {
					-- 	desc = ' dotfiles',
					-- 	group = 'Number',
					-- 	action = 'Telescope dotfiles',
					-- 	key = 'd',
					-- },
				},
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
