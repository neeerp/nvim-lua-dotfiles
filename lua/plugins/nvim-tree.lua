return {
	"nvim-tree/nvim-tree.lua",
	cmd = {
		"NvimTreeOpen",
		"NvimTreeToggle",
		"NvimTreeFocus",
		"NvimTreeFindFile",
		"NvimTreeFindFileToggle",
	},
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local function on_attach(bufnr)
			local api = require("nvim-tree.api")
			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			vim.keymap.set("n", "<C-k>", api.node.show_info_popup, opts("Info"))
			vim.keymap.set("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
			vim.keymap.set("n", "<C-i>", api.node.open.vertical, opts("Open: Vertical Split"))
			vim.keymap.set("n", "i", api.node.open.vertical, opts("Open: Vertical Split"))
			vim.keymap.set("n", "<C-s>", api.node.open.horizontal, opts("Open: Horizontal Split"))
			vim.keymap.set("n", "s", api.node.open.horizontal, opts("Open: Horizontal Split"))
			vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
			vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
			vim.keymap.set("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
			vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts("Up"))
			vim.keymap.set("n", "a", api.fs.create, opts("Create"))
			vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
			vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))

			vim.keymap.set("n", "E", api.tree.expand_all, opts("Expand All"))
			vim.keymap.set("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
			vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))

			vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
			vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))

			vim.keymap.set("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
			vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
			vim.keymap.set("n", "u", api.node.navigate.parent, opts("Parent Directory"))
			vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
			vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))

			vim.keymap.set("n", "W", api.tree.collapse_all, opts("Collapse"))
			vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
			vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))

			vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))

			vim.keymap.set("n", "A", api.tree.expand_all, opts("Expand All"))
			vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
			vim.keymap.set("n", "C", api.tree.change_root_to_node, opts("CD"))
			vim.keymap.set("n", "P", function()
				local node = api.tree.get_node_under_cursor()
				print(node.absolute_path)
			end, opts("Print Node Path"))
		end
		require("nvim-tree").setup({
			on_attach = on_attach,
			git = {
				enable = true,
				ignore = true,
				show_on_dirs = true,
				show_on_open_dirs = true,
				timeout = 5000,
			},
			renderer = {
				add_trailing = false,
				group_empty = false,
				highlight_git = false,
				full_name = false,
				highlight_opened_files = "name",
				highlight_modified = "none",
				root_folder_label = ":~:s?$?/..?",
				indent_width = 2,
				indent_markers = {
					enable = true,
					inline_arrows = true,
					icons = {
						corner = "└",
						edge = "│",
						item = "│",
						bottom = "─",
						none = " ",
					},
				},
				icons = {
					glyphs = {
						default = "",
						symlink = "",
						folder = {
							default = "",
							empty = "",
							empty_open = "",
							open = "",
							symlink = "",
							symlink_open = "",
							arrow_open = "",
							arrow_closed = "",
						},
						git = {
							unstaged = "",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "U",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
			view = {
				cursorline = true,
				float = {
					enable = false,
					quit_on_focus_loss = true,
					open_win_config = {
						relative = "editor",
						border = "rounded",
						width = 30,
						height = 30,
						row = 1,
						col = 1,
					},
				},
			},
		})
	end,
}
