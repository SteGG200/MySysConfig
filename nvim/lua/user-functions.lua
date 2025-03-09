local Functions = {}

function Functions.get_OS()
	local is_windows = vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1
	if is_windows then
		return "Windows"
	else
		local uname_output = vim.fn.system('uname')
		return string.gsub(uname_output, '\n', '')
	end
end

return Functions
