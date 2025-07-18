local Functions = {}

function Functions.get_OS()
	local is_windows = vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1
	if is_windows then
		return "Windows"
	else
		local uname_output = vim.fn.system("uname")
		return string.gsub(uname_output, "\n", "")
	end
end

-- function Functions.replaceAll()
-- 	local origin = vim.fn.input("Enter origin text: ")
-- 	local replacement = vim.fn.input("Enter replacement: ")
-- 	local flags = vim.fn.input("Enter flags: ", "g")
-- 	vim.cmd("%s/" .. origin .. "/" .. replacement .. "/" .. flags)
-- end
--
-- function Functions.replaceScope()
-- 	local origin = vim.fn.input("Enter origin text: ")
-- 	local replacement = vim.fn.input("Enter replacement: ")
-- 	local flags = vim.fn.input("Enter flags: ", "g")
-- 	vim.cmd("'<,'>s/" .. origin .. "/" .. replacement .. "/" .. flags)
-- end

return Functions
