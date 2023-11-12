return {
	-- TeX
	require("plugins.preview.vimtex"),

	-- Plant UML
	"aklt/plantuml-syntax",
	{
		"weirongxu/plantuml-previewer.vim",
		ft = "plantuml",
		dependencies = {
			"tyru/open-browser.vim",
		},
	},

	-- Markdown
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
	},
}
