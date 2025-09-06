require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- You can customize some of the format options for the filetype (:help conform.format)
    rust = { "rustfmt", lsp_format = "fallback" },
    -- Conform will run the first available formatter
    javascript = { "prettierd", "prettier", stop_after_first = true },
    sql = { "pg_format" },
  },
  formatters = {
    pg_format = {
      command = "pg_format",
      args = { "-s", "2" }, -- Indenta com 2 espaços
      stdin = true,
    },
  },
})
