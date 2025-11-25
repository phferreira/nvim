return {
  "folke/snacks.nvim",
  opts = {
    bufferline = { enabled = false },
    -- explorer = { enabled = false },
    explorer = {
      input = {
        enabled = false, -- desativa o campo de busca automático
      },
    },
    dashboard = {
      enabled = false,
    },
    cmp = {
      keymap = {
        preset = "default",

        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },

        -- OPTIONAL: Enter confirma
        ["<CR>"] = { "accept", "fallback" },
      },
    },
  },
}
