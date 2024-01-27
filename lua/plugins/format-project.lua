-- ~/.config/nvim/lua/format_project.lua

local function is_project_file(file)
	return vim.fn.filereadable(file) == 1
end

local function find_project_file(directory)
	local sln_files = vim.fn.glob(directory .. "/*.sln", true, true)
	local csproj_files = vim.fn.glob(directory .. "/*.csproj", true, true)
	return #sln_files > 0 and sln_files[1] or #csproj_files > 0 and csproj_files[1] or nil
end

local M = {}

function M.format_project_file()
	local current_file = vim.fn.expand("%:p")
	local current_directory = vim.fn.expand("%:p:h")
	local project_file = find_project_file(current_directory)

	if project_file and is_project_file(project_file) then
		local cmd = string.format("cd %s && dotnet format %s", current_directory, project_file)
		vim.fn.system(cmd)
		vim.cmd("edit") -- To refresh the buffer after formatting
	end
end

return M
