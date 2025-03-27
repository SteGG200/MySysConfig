return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		dependencies = { "hrsh7th/nvim-cmp" },
		config = function()
			local npairs = require("nvim-autopairs")

			-- npairs.setup({
			-- 	fast_wrap = {
			-- 		map = "<C-a>",
			-- 		chars = { "{", "[", "(", '"', "'", "`" },
			-- 		pattern = [=[[%'%"%>%]%)%}%,]]=],
			-- 		end_key = "$",
			-- 		before_key = "h",
			-- 		after_key = "l",
			-- 		cursor_pos_before = true,
			-- 		keys = "qwertyuiopzxcvbnmasdfghjkl",
			-- 		manual_position = true,
			-- 		highlight = "Search",
			-- 		highlight_grey = "Comment",
			-- 	},
			-- })

			local cmp = require("cmp")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")

			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "^3.0.0",
		event = "VeryLazy",
		config = function()
			local surround = require("nvim-surround")
			surround.setup({
				keymaps = {
					normal = "s",
					normal_cur = "ss",
					normal_line = "S",
					normal_cur_line = "SS",
					visual = "S",
					visual_line = "gS",
					delete = "ds",
					change = "cs",
					change_line = "cS",
				},
			})
		end,
	}
}
