return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "LspInfo", "LspInstall", "LspUninstall" },
	config = function()
		require("plugins.lsp.handlers").setup()
	end,
	dependencies = {
		{
			-- neodev docs explicitly say to setup neodev BEFORE lspconfig!
			"folke/neodev.nvim",
			event = "LspAttach",
			config = function()
				require("neodev").setup({
					library = {
						enabled = true,
						runtime = true,
						types = true,
						plugins = true,
					},
					lspconfig = false,
					pathStrict = true,
				})
			end,
		},
		{
			"williamboman/mason.nvim",
			cmd = {
				"Mason",
				"MasonInstall",
				"MasonUninstall",
				"MasonUninstallAll",
				"MasonLog",
			},
			dependencies = {
				"williamboman/mason-lspconfig.nvim",
				"mfussenegger/nvim-jdtls",
			},
			config = function()
				local mason = require("mason")
				local mason_lspconfig = require("mason-lspconfig")
				local lspconfig = require("lspconfig")

				local auto_install = {
					"lua_ls",
				}

				mason.setup({
					check_outdated_packages_on_open = false,
					ui = {
						border = "rounded",
						icons = {
							package_pending = " ",
							package_installed = " ",
							package_uninstalled = " ",
						},
					},
				})

				mason_lspconfig.setup({
					ensure_installed = auto_install,
				})

				mason_lspconfig.setup_handlers({
					function(server_name)
						local opts = {
							on_attach = require("plugins.lsp.handlers").on_attach,
							capabilities = require("plugins.lsp.handlers").capabilities,
						}

						local require_ok, server = pcall(require, "plugins.lsp.settings." .. server_name)

						if require_ok then
							opts = vim.tbl_deep_extend("force", server, opts)
						end

						lspconfig[server_name].setup(opts)
					end,
				})
			end,
		},
	},
}
