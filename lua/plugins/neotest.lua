return {
	"nvim-neotest/neotest",
	event = { "BufRead" },
	cmd = { "Neotest" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-neotest/neotest-python",
		"antoinemadec/FixCursorHold.nvim",
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("neotest").setup({
			log_level = vim.log.levels.DEBUG,
			adapters = {
				require("neotest-python"),
			},
		})
	end,
	keys = {
		{ "grt", [[<Cmd>lua require("neotest").run.run() <CR>]] },
		{ "gdt", [[<Cmd>lua require("neotest").run.run({ strategy = "dap" }) <CR>]] },
		{ "gat", [[<Cmd>lua require("neotest").run.run(vim.fn.expand("%")) <CR>]] },
		{ "gst", [[<Cmd>lua require("neotest").summary.toggle() <CR>]] },
	},
	-- lazy = false,
}
