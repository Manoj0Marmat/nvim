-- Set colorscheme to nightfly with protected call
-- in case it isn't installed
local status, nightfly = pcall(vim.cmd, "colorscheme nightfly")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
else
	-- Make the background of the colorscheme transparent
	vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
	vim.cmd("highlight NonText guibg=NONE ctermbg=NONE")
	vim.cmd("highlight EndOfBuffer guibg=NONE ctermbg=NONE")
end
