return {
	"FabijanZulj/blame.nvim",
	config = function()
		require("blame").setup({
			merge_consecutive = false,
		})
	end,
}
