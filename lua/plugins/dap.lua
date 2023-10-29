return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				"mfussenegger/nvim-dap-python",
				config = function()
					require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
				end,
			},
		},
		keys = {
			{ "gbd", [[<Cmd>lua require("dap").toggle_breakpoint() <CR>]] },
			{ "grd", [[<Cmd>lua require("dap").repl.open() <CR>]] },
			{ "gcd", [[<Cmd>lua require("dap").continue() <CR>]] },
			{ "gsi", [[<Cmd>lua require("dap").step_into() <CR>]] },
			{ "gsu", [[<Cmd>lua require("dap").step_out() <CR>]] },
			{ "gso", [[<Cmd>lua require("dap").step_over() <CR>]] },

			-- Don't actually need this... the repl is extremely powerful
			-- and can show us frames/scopes/whatever already
			{ "gsf", [[<Cmd>lua require("dap.ui.widgets").sidebar(require("dap.ui.widgets").frames).open()<CR>]] },
		},
	},
}
