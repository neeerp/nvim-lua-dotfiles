return {
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		opts = {
			max_file_length = 12000,
		},
	},
	{
		"FabijanZulj/blame.nvim",
		config = function()
			require("blame").setup({
				merge_consecutive = false,
			})
		end,
		cmd = { "ToggleBlame" },
	},
}
