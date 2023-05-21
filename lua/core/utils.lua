--- This file defines some global helper methods.
-- @module utils

--- Set vim options (i.e. `vim.opt`)
-- @options A table of { <vim options> = <value> } to set.
function _G.set_options(options)
	for name, value in pairs(options) do
		vim.opt[name] = value
	end
end

--- Set vim globals (i.e. `vim.g.`)
-- @globals A table of { <vim globals> = <value> } to set.
function _G.set_globals(globals)
	for name, value in pairs(globals) do
		vim.g[name] = value
	end
end

--- Set vim key mappings for a given vim mode.
-- @keymaps A table of {[<command>] = { cmd = <command>, desc = <description>, opt? = <opts> }}
-- @mode The one-letter representation of the vim mode for which the keymaps should be set.
function _G.set_keymaps(keymaps, mode)
	for keymap, value in pairs(keymaps) do
		if value.opt ~= nil then
			vim.keymap.set(mode, keymap, value.cmd, value.opt, { desc = value.desc or "" })
		else
			local opt = { silent = true }

			if mode == "c" then
				opt = { expr = true }
			end

			vim.keymap.set(mode, keymap, value.cmd, opt, { desc = value.desc or "" })
		end
	end
end
