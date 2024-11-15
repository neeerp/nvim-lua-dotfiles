-- Convenience bindings for berevity :)
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local general = augroup("General Settings", { clear = true })

-- Needed because Nvim-tree is configured to be lazy-loaded
autocmd("VimEnter", {
	callback = function(data)
		local isDirectory = vim.fn.isdirectory(data.file) == 1

		if not isDirectory then
			return
		end
		-- create a new, empty buffer
		vim.cmd.enew()

		-- wipe the directory buffer
		vim.cmd.bw(data.buf)

		-- change to the directory
		vim.cmd.cd(data.file)
		require("nvim-tree.api").tree.open()
	end,
	group = general,
	desc = "Open tree when vim is opened on a directory",
})

vim.cmd([[au BufRead,BufNewFile *.templ set filetype=templ]])
