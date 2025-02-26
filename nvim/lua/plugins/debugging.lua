return {
	{
		"jay-babu/mason-nvim-dap.nvim",
		config = function()
			require("mason-nvim-dap").setup({
				ensured_installed = {},
			})
		end,
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, {})
			vim.keymap.set("n", "<F5>", dap.continue, {})

			-- Format breakpoint symbol
			vim.api.nvim_set_hl(0, "red", { fg = "#f8312f" })
			vim.fn.sign_define(
				"DapBreakpoint",
				{ text = "*", texthl = "red", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)
		end,
	},
}
