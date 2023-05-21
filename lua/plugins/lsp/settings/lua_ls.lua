return {
	settings = {
		Lua = {
			semantic = {
				enable = false,
			},
			diagnostics = {
				globals = { "vim" },
			},
			telemetry = { enable = false },
			workspace = {
				[vim.fn.expand("$VIMRUNTIME/lua")] = true,
				[vim.fn.stdpath("config") .. "/lua"] = true,
				checkThirdParty = false,
			},
		},
	},
}
