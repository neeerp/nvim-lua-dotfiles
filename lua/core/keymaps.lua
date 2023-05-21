local modes = {
	normal_mode = "n",
	insert_mode = "i",
	terminal_mode = "t",
	visual_mode = "v",
	visual_block_mode = "x",
	command_mode = "c",
}

local keymaps = {
	normal_mode = {
		["<leader>pv"] = {
			cmd = ":NvimTreeToggle<cr>",
		},
	},
}

set_keymaps(keymaps.normal_mode, modes.normal_mode)
