return {
	"nvim-treesitter/nvim-treesitter",
	module = true,
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		vim.filetype.add({ extensino = { templ = "templ" } })
		configs.setup({
			ensure_installed = {
				"lua",
				"markdown",
				"markdown_inline",
				"tsx",
				"css",
				"html",
				"yaml",
				"json",
				"toml",
				"templ",
				"go",
			},

			auto_install = true,

			highlight = {
				enable = true,
			},
			autopairs = {
				enable = true,
			},
		})
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
	end,
}
