return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    local null_ls = require("null-ls")
    local code_actions = null_ls.builtins.code_actions
    local diagnostics = null_ls.builtins.diagnostics
    local formatting = null_ls.builtins.formatting

    null_ls.setup({
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
      sources = {
        code_actions.eslint_d,
        diagnostics.eslint_d,
        diagnostics.vale.with({
          filetypes = { "markdown", "plaintex", "asciidoc" },
        }),
        formatting.stylua,
        formatting.rustfmt,
        formatting.prettierd,
      },
    })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
