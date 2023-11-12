local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local M = {}

local cmp_nvim_lsp = require("cmp_nvim_lsp")

M.capabilities = cmp_nvim_lsp.default_capabilities()

M.setup = function()
	-- TODO
	local signs = { Error = "", Warn = "", Hint = "", Info = "" }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	local config = {
		virtual_text = true,
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)
end

local function lsp_keymaps(bufnr)
	local keymap = vim.keymap.set
	local buf_opts = { buffer = bufnr, silent = true }

	keymap("n", "gd", vim.lsp.buf.definition, buf_opts)
	keymap("n", "gr", vim.lsp.buf.references, buf_opts)
	keymap("n", "K", vim.lsp.buf.hover, buf_opts)
	keymap("n", "gn", vim.lsp.buf.rename, buf_opts)
	keymap("n", "gi", vim.lsp.buf.implementation, buf_opts)
	keymap({ "n", "v" }, "<C-e>", vim.lsp.buf.code_action, buf_opts)
end

-- Highlight the symbol under the cursor
local function lsp_highlight(client, bufnr)
	if client.supports_method("textDocument/documentHighlight") then
		augroup("lsp_document_highlight", {
			clear = false,
		})

		vim.api.nvim_clear_autocmds({
			buffer = bufnr,
			group = "lsp_document_highlight",
		})

		autocmd({ "CursorHold", "CursorHoldI" }, {
			group = "lsp_document_highlight",
			buffer = bufnr,
			callback = vim.lsp.buf.document_highlight,
		})

		autocmd({ "CursorMoved", "CursorMovedI" }, {
			group = "lsp_document_highlight",
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
		})
	end
end

M.on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)
	lsp_highlight(client, bufnr)
end

return M
