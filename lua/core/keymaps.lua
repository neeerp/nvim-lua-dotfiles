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
  },
}

set_keymaps(keymaps.normal_mode, modes.normal_mode)
set_keymaps(keymaps.terminal_mode, modes.terminal_mode)
