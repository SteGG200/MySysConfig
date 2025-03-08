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

			dap.adapters.cppdbg = {
				id = 'cppdbg',
				type = 'executable',
				command = 'C:\\Users\\ADMIN\\AppData\\Local\\nvim-data\\mason\\bin\\OpenDebugAD7.cmd',
				options = {
					detached = false,
				},
			}

			dap.configurations.c = {
				{
					name = "Launch file",
					type = "cppdbg",
					request = "launch",
					program = '${fileDirname}/${fileBasenameNoExtension}.exe',
					cwd = '${workspaceFolder}',
					stopAtEntry = true,
				}
			}

			dap.configurations.cpp = dap.configurations.c

			local dapui = require("dapui")
			dapui.setup()

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
			vim.keymap.set("n", "<F10>", dap.step_over, {})
			vim.keymap.set("n", "<F11>", dap.step_into, {})
			vim.keymap.set("n", "<F12>", function ()
				dap.terminate()
				dapui.close()
			end, {})
			vim.keymap.set("n", "<C-D>", dapui.toggle, {})

			-- Format breakpoint symbol
			vim.api.nvim_set_hl(0, "red", { fg = "#f8312f" })
			vim.fn.sign_define(
				"DapBreakpoint",
				{ text = "*", texthl = "red", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)
		end,
	},
}
