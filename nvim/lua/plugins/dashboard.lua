return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		-- Font ANSI Shadow
		local logo = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
		]]

		logo = string.rep("\n", 3) .. logo .. "\n\n"

		local customizedCenter = {
			{
				icon = "󰒲 ",
				desc = "Open Lazy",
				action = "Lazy",
				key = "l",
			},
			{
				icon = " ",
				desc = "Open File Browser",
				action = "Telescope file_browser",
				key = "f",
			},
			{
				icon = " ",
				desc = "Find File",
				action = function()
					require("telescope.builtin").find_files()
				end,
				key = "p",
			},
			{
				icon = " ",
				desc = "Create New File",
				action = "enew",
				key = "a",
			},
			{
				icon = " ",
				desc = "Quit",
				action = "q",
				key = "q",
			},
		}

		for _, button in ipairs(customizedCenter) do
			button.desc = button.desc .. string.rep(" ", 35 - #button.desc)
			button.key_format = "  %s"
		end

		require("dashboard").setup({
			-- config
			theme = "doom",
			hide = {
				statusline = false,
			},
			config = {
				header = vim.split(logo, "\n"),
				center = customizedCenter,
				footer = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					return {
						"",
						"⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
					}
				end,
				vertical_center = true,
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
