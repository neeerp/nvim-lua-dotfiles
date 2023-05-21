return {
	"akinsho/toggleterm.nvim",
	-- cmd = "ToggleTerm",
	config = function()
		local toggleterm = require("toggleterm")

		toggleterm.setup({
			open_mapping = [[<c-\>]],
		})
	end,
}
