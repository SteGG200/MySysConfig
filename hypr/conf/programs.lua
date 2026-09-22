---------------------
---- MY PROGRAMS ----
---------------------

local uwsm = "uwsm app -- "
local terminal = "kitty.desktop"
local file_manager = "yazi.desktop"
local menu = "rofi -show"
local browser = "firefox.desktop"

local programs = {
	terminal = terminal,
	file_manager = file_manager,
	menu = menu,
	browser = browser,
}

for program, command in pairs(programs) do
	programs[program] = uwsm .. command
end

return programs
