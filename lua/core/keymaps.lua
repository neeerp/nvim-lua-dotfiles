local modes = {
	normal_mode = "n",
	insert_mode = "i",
	terminal_mode = "t",
	visual_mode = "v",
	visual_block_mode = "x",
	command_mode = "c",
	insert_abbreviation = "ia",
	command_abbreviation = "ca",
	abbreviation = "!a",
}

local keymaps = {
	insert_mode = {
		["<C-p>"] = { cmd = [[<Cmd>Telescope find_files<CR>]], desc = "Open fuzzy finder" },
		["<C-f>"] = { cmd = [[<Cmd>Telescope live_grep<CR>]], desc = "Open fuzzy finder" },
		["<C-h>"] = { cmd = [[<Cmd>wincmd h<CR>]] },
		["<C-j>"] = { cmd = [[<Cmd>wincmd j<CR>]] },
		["<C-k>"] = { cmd = [[<Cmd>wincmd k<CR>]] },
		["<C-l>"] = { cmd = [[<Cmd>wincmd l<CR>]] },
	},

	normal_mode = {
		["<leader>pv"] = { cmd = [[<Cmd>NvimTreeToggle<cr>]], desc = "Open Nvim Tree" },

		["<C-h>"] = { cmd = [[<Cmd>wincmd h<CR>]] },
		["<C-j>"] = { cmd = [[<Cmd>wincmd j<CR>]] },
		["<C-k>"] = { cmd = [[<Cmd>wincmd k<CR>]] },
		["<C-l>"] = { cmd = [[<Cmd>wincmd l<CR>]] },
		["<space>h"] = { cmd = [[<Cmd>wincmd h<CR>]] },
		["<space>j"] = { cmd = [[<Cmd>wincmd j<CR>]] },
		["<space>k"] = { cmd = [[<Cmd>wincmd k<CR>]] },
		["<space>l"] = { cmd = [[<Cmd>wincmd l<CR>]] },
		["<C-space>h"] = { cmd = [[<Cmd>wincmd h<CR>]] },
		["<C-space>j"] = { cmd = [[<Cmd>wincmd j<CR>]] },
		["<C-space>k"] = { cmd = [[<Cmd>wincmd k<CR>]] },
		["<C-space>l"] = { cmd = [[<Cmd>wincmd l<CR>]] },

		["<C-Up>"] = { cmd = [[<Cmd>resize +2<CR>]], desc = "Increase vertical size" },
		["<C-Down>"] = { cmd = [[<Cmd>resize -2<CR>]], desc = "Decrease vertical size" },
		["<C-Left>"] = { cmd = [[<Cmd>vertical resize +2<CR>]], desc = "Increase horizontal size" },
		["<C-Right>"] = { cmd = [[<Cmd>vertical resize -2<CR>]], desc = "Decrease horizonal size" },

		["<C-p>"] = { cmd = [[<Cmd>Telescope find_files<CR>]], desc = "Open fuzzy finder" },
		["<C-f>"] = { cmd = [[<Cmd>Telescope live_grep<CR>]], desc = "Open fuzzy finder" },
	},

	terminal_mode = {
		["<C-h>"] = { cmd = [[<Cmd>wincmd h<CR>]] },
		["<C-j>"] = { cmd = [[<Cmd>wincmd j<CR>]] },
		["<C-k>"] = { cmd = [[<Cmd>wincmd k<CR>]] },
		["<C-l>"] = { cmd = [[<Cmd>wincmd l<CR>]] },
		["<C-space>h"] = { cmd = [[<Cmd>wincmd h<CR>]] },
		["<C-space>k"] = { cmd = [[<Cmd>wincmd k<CR>]] },
		["<C-space>l"] = { cmd = [[<Cmd>wincmd l<CR>]] },

		["<C-Up>"] = { cmd = [[<Cmd>resize +2<CR>]] },
		["<C-Down>"] = { cmd = [[<Cmd>resize -2<CR>]] },
		["<C-Left>"] = { cmd = [[<Cmd>vertical resize +2<CR>]] },
		["<C-Right>"] = { cmd = [[<Cmd>vertical resize -2<CR>]] },

		["<Esc>"] = { cmd = [[<C-\><C-n>]], desc = "Enter normal mode" },
		["<C-space>j"] = { cmd = [[<C-\><C-n>]], desc = "Enter normal mode" },

		["<C-p>"] = { cmd = [[<Cmd>Telescope find_files<CR>]], desc = "Open fuzzy finder" },
		["<C-f>"] = { cmd = [[<Cmd>Telescope live_grep<CR>]], desc = "Open fuzzy finder" },
	},

	command_abbreviation = {
		["wQ"] = { cmd = "wq" },
		["WQ"] = { cmd = "wq" },
		["Wq"] = { cmd = "wq" },
		["W"] = { cmd = "w" },
		["Q"] = { cmd = "q" },
		["Qa"] = { cmd = "qa" },
		["QA"] = { cmd = "qa" },
		["qA"] = { cmd = "qa" },
	},
}

set_keymaps(keymaps.insert_mode, modes.insert_mode)
set_keymaps(keymaps.normal_mode, modes.normal_mode)
set_keymaps(keymaps.terminal_mode, modes.terminal_mode)
set_keymaps(keymaps.command_abbreviation, modes.command_abbreviation)
