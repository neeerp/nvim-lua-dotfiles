return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter" },
	-- these dependencies will only be loaded when cmp loads
	-- dependencies are always lazy-loaded unless specified otherwise
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		{
			"L3MON4D3/LuaSnip", -- Snippet Engine (One is required!)
			version = "v2.*",
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip", -- Snippet Completions
		"rafamadriz/friendly-snippets", -- Some useful snippets!
		-- {
		-- 	"zbirenbaum/copilot-cmp",
		-- 	config = function()
		-- 		require("copilot_cmp").setup()
		-- 	end,
		-- 	dependencies = {
		-- 		{
		-- 			"zbirenbaum/copilot.lua",
		-- 			config = function()
		-- 				require("copilot").setup({
		-- 					suggestion = {
		-- 						auto_trigger = true,
		-- 						keymap = { accept = "<C-l>", next = "<C-]>", prev = "<C-[>" },
		-- 					},
		-- 				})
		-- 			end,
		-- 		},
		-- 	},
		-- },
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		-- Load VS Code style snippets (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()
		-- Custom snippets!
		require("luasnip.loaders.from_snipmate").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets/snipmate" })

		local kind_icons = {
			Namespace = "",
			Text = "",
			Method = "",
			Function = "",
			Constructor = "",
			Field = "ﰠ",
			Variable = "",
			Class = "ﴯ",
			Interface = "",
			Module = "",
			Property = "ﰠ",
			Unit = "塞",
			Value = "",
			Enum = "",
			Keyword = "",
			Snippet = "",
			Color = "",
			File = "",
			Reference = "",
			Folder = "",
			EnumMember = "",
			Constant = "",
			Struct = "פּ",
			Event = "",
			Operator = "",
			TypeParameter = "",
			Table = "",
			Object = "",
			Tag = "",
			Array = "[]",
			Boolean = "",
			Number = "",
			Null = "ﳠ",
			String = "",
			Calendar = "",
			Watch = "",
			Package = "",
			Copilot = "",
		}

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),

				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expandable() then
						luasnip.expand()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
			}),
			formatting = {
				format = function(entry, vim_item)
					if vim.tbl_contains({ "path" }, entry.source.name) then
						local icon, hl_group = require("nvim-web-devicons").get_icon(entry:get_completion_item().label)
						if icon then
							vim_item.kind = icon
							vim_item.kind_hl_group = hl_group
							return vim_item
						end
					end

					-- Fallback if web-devicon can't be used
					vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
					return vim_item
				end,
			},
			sources = {
				{ name = "copilot" },
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			},
			confirm_opts = {
				behaviour = cmp.ConfirmBehavior.Replace,
				select = false,
			},
			window = {
				completion = cmp.config.window.bordered({
					border = "rounded",
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:Search",
					col_offset = -3,
					side_padding = 1,
				}),
				documentation = cmp.config.window.bordered({
					border = "rounded",
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:Search",
					col_offset = -3,
					side_padding = 1,
				}),
			},
			experimental = {
				ghost_text = { enabled = true },
			},
		})
	end,
}
