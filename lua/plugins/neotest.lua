return {
	"nvim-neotest/neotest",
	event = { "BufRead" },
	cmd = { "Neotest" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim",
		"nvim-neotest/neotest-python",
		"antoinemadec/FixCursorHold.nvim",
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python"),
			},
			summary = {
				animated = true,
				enabled = true,
				expand_errors = true,
				follow = true,
				mappings = {
					attach = "a",
					clear_marked = "M",
					clear_target = "T",
					debug = "d",
					debug_marked = "D",
					expand = { "<CR>", "<2-LeftMouse>" },
					expand_all = "e",
					jumpto = "i",
					mark = "m",
					next_failed = "J",
					output = "o",
					prev_failed = "K",
					run = "r",
					run_marked = "R",
					short = "O",
					stop = "u",
					target = "t",
					watch = "w",
				},
				open = "botright vsplit | vertical resize 50",
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
