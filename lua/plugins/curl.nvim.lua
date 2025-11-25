return {
  "oysandvik94/curl.nvim",
  -- event = "VeryLazy",
  config = function()
    local curl = require("curl")
    curl.setup({})
    vim.keymap.set("n", "<leader>cc", curl.open_curl_tab, { desc = "Open curl tab" })
    vim.keymap.set("n", "<leader>cC", curl.close_curl_tab, { desc = "Close curl tab" })
  end,
}
