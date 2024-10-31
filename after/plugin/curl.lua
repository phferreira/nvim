local curl = require("curl")
curl.setup({
  -- Table of strings to specify default headers to be included in each request, i.e. "-i"
  default_flags = {},
  mappings = {
    execute_curl = "<M-CR>"
  }
})

vim.keymap.set("n", "<leader>cc", function()
  curl.open_curl_tab()
end, { desc = "Open a curl tab scoped to the current working directory" })
