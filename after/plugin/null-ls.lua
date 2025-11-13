local ok, null_ls = pcall(require, "null-ls")
if not ok then
  vim.notify("null_ls não encontrado")
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  sources = {
    formatting.google_java_format.with({
      command = vim.fn.stdpath("data") .. "/mason/bin/google-java-format",
      extra_args = { "--aosp" },
    }),
    -- Python
    formatting.black.with({ extra_args = { "--fast" } }),
    diagnostics.flake8,

    -- JS / TS
    formatting.prettier.with({
      filetypes = { "javascript", "typescript", "css", "html", "json" },
    }),

    -- Shell
    formatting.shfmt,
    -- diagnostics.shellcheck,

    -- Gerais
    code_actions.gitsigns,
  },
  -- Formatação automática ao salvar
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      -- Limpa autocmds existentes nesse grupo para este buffer
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

      -- Cria autocmd para formatar ao salvar
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, async = false })
        end,
      })
    end
  end,
})
