-- Convenience bindings for berevity :)
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local general = augroup("General Settings", { clear = true })

-- TODO: Is this actually necessary?
autocmd("VimEnter", {
	callback = function(data)
		local isDirectory = vim.fn.isdirectory(data.file) == 1

		if isDirectory then
			vim.cmd.cd(data.file)
			require("nvim-tree.api").tree.open()
		end
	end,
	group = general,
	desc = "Open tree when vim is opened on a directory",
})
