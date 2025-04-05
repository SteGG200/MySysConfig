return {
	{
		"jay-babu/mason-nvim-dap.nvim",
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = {
					"cpptools",
				},
				automatic_installation = false,
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
			local user_functions = require("user-functions")

			if user_functions.get_OS() == "Windows" then
				-- Configurations for Windows
				dap.adapters.cppdbg = {
					id = "cppdbg",
					type = "executable",
					command = vim.fn.stdpath("data") .. "\\mason\\bin\\OpenDebugAD7.cmd",
					options = {
						detached = false,
					},
				}

				dap.configurations.c = {
					{
						name = "Launch file",
						type = "cppdbg",
						request = "launch",
						program = function()
							return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "\\", "file")
						end,
						cwd = "${workspaceFolder}",
						stopAtEntry = true,
					},
				}
			else
				-- Configurations for Unix OS
				dap.adapters.cppdbg = {
					id = "cppdbg",
					type = "executable",
					command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
				}

				dap.configurations.c = {
					{
						name = "Launch file",
						type = "cppdbg",
						request = "launch",
						program = function()
							return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
						end,
						cwd = "${workspaceFolder}",
						stopAtEntry = true,
					},
				}
			end

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

			vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "Set breakpoint" })
			vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start/continue debugging" })
			vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step over" })
			vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step into" })
			vim.keymap.set("n", "<F12>", function()
				dap.terminate()
				dapui.close()
			end, { desc = "Stop debugging" })
			vim.keymap.set("n", "<C-D>", dapui.toggle, { desc = "Toggle debugging ui" })

			-- Format breakpoint symbol
			vim.api.nvim_set_hl(0, "red", { fg = "#f8312f" })
			vim.fn.sign_define(
				"DapBreakpoint",
				{ text = "*", texthl = "red", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)
		end,
	},
}
