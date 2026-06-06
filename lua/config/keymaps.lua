vim.g.mapleader = " "

local args = { noremap = true, silent = true }

local opts = { buffer = bufnr }

-- EXECUTE LINE
vim.keymap.set({ "n", "v" }, "<leader><CR>", function()
  local mode = vim.fn.mode()
  local cmd

  if mode:match("[vV]") then
    -- modo visual: pega seleção
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")
    local lines = vim.fn.getline(start_pos[2], end_pos[2])
    cmd = table.concat(lines, " ")
    -- sai do modo visual antes de executar o comando
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "nx", false)
  else
    -- modo normal: pega linha atual
    cmd = vim.fn.getline(".")
  end

  if cmd ~= nil and cmd ~= "" then
    vim.cmd(cmd)
  else
    print("⚠️ Nenhum comando para executar")
  end
end, { desc = "Executar linha ou seleção como comando Vim", silent = true })

-- MOVE SELECTED LINES
vim.keymap.set("v", "<C-K>", ":m '<-2<CR>gv=gv", args)
vim.keymap.set("v", "<C-J>", ":m '>+1<CR>gv=gv", args)

-- KEEP SELECTION
vim.keymap.set("v", ">", ">gv", args)
vim.keymap.set("v", "<", "<gv", args)
vim.keymap.set("v", "u", "ugv", args)
vim.keymap.set("v", "U", "Ugv", args)

-- KEEP CURRENT REGISTER ON PASTE
-- vim.keymap.set("x", "p", '"_dP', args)
-- vim.keymap.set("x", "P", '"_dP', args)

-- CENTER ON COMMAND
vim.keymap.set("n", "<space><space>", "i<space><ESC>", args)
vim.keymap.set("n", "n", "nzzzv", args)
vim.keymap.set("n", "N", "Nzzzv", args)
vim.keymap.set("n", "J", "mzJ`z", args)
vim.keymap.set("n", "<C-d>", "<C-d>zz", args)
vim.keymap.set("n", "<C-u>", "<C-u>zz", args)

-- FINDS
vim.keymap.set("n", "[q", ":cprev<CR>", args)
vim.keymap.set("n", "]q", ":cnext<CR>", args)
vim.keymap.set("n", "[Q", ":cfirst<CR>", args)
vim.keymap.set("n", "]Q", ":clast<CR>", args)
vim.keymap.set("n", "[<C-Q>", ":cpfile<CR>", args)
vim.keymap.set("n", "]<C-Q>", ":cnfile<CR>", args)

-- NAVIGATION
vim.keymap.set("n", "<M-l>", ":bn<cr>", args)
vim.keymap.set("n", "<M-h>", ":bp<cr>", args)
vim.keymap.set("n", "<C-M-l>", ":tabnext<cr>", args)
vim.keymap.set("n", "<C-M-h>", ":tabprevious<cr>", args)
vim.keymap.set("n", "<C-M-k>", ":tabnew<cr>", args)
-- vim.keymap.set("n", "<C-M-j>", ":tabclose<cr>", args)

-- CLOSE BUFFER
-- vim.keymap.set("n", "<leader>c", require("tabscope").remove_tab_buffer)

-- INSERT LINE
vim.keymap.set("n", "<C-j>", "i<CR><ESC>", args)
vim.keymap.set("n", "<C-k>", "O<ESC>", args)

-- REPLACE
vim.keymap.set("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/g<LEFT><LEFT>", args)
vim.keymap.set("n", "<leader>rc", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gc<LEFT><LEFT><LEFT>", args)

-- TELESCOPE
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find Grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- DISABLE ARROW KEYS
vim.keymap.set("n", "<UP>", "<NOP>")
vim.keymap.set("n", "<DOWN>", "<NOP>")
vim.keymap.set("n", "<LEFT>", "<NOP>")
vim.keymap.set("n", "<RIGHT>", "<NOP>")
vim.keymap.set("n", "<C-UP>", "<NOP>")
vim.keymap.set("n", "<C-DOWN>", "<NOP>")
vim.keymap.set("n", "<C-LEFT>", "<NOP>")
vim.keymap.set("n", "<C-RIGHT>", "<NOP>")
vim.keymap.set("n", "<C-M-UP>", "<NOP>")
vim.keymap.set("n", "<C-M-DOWN>", "<NOP>")
vim.keymap.set("n", "<C-M-LEFT>", "<NOP>")
vim.keymap.set("n", "<C-M-RIGHT>", "<NOP>")

-- FLUTTER
vim.keymap.set("n", "<leader>fr", ":FlutterRun<cr>", args)
vim.keymap.set("n", "<leader>fq", ":FlutterQuit<cr>", args)
vim.keymap.set("n", "<leader>fH", ":FlutterHotReload<cr>", args)
vim.keymap.set("n", "<leader>fR", ":FlutterRestart<cr>", args)
vim.keymap.set("n", "<leader>fD", ":FlutterVisualDebug<cr>", args)
vim.keymap.set("n", "<leader>fa", ":lua FlutterAnalyze()<cr>", args)
vim.keymap.set("n", "<leader>ft", ":lua FlutterTest()<cr>", args)
vim.keymap.set("n", "<leader>fct", ":lua FlutterCreateTest()<cr>", args)
vim.keymap.set("n", "<leader>fta", ":lua FlutterTestAll()<cr>", args)

-- CODE ACTION
vim.keymap.set("n", "<M-CR>", vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "Code Action" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = -1 })
  vim.defer_fn(function()
    vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
  end, 80)
end, opts)

vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1 })
  vim.defer_fn(function()
    vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
  end, 80)
end, opts)

-- DIAGNOSTICS
vim.keymap.set("n", "<leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>", args)
vim.keymap.set("n", "<leader>dd", "<cmd>Telescope diagnostics<CR>", args)

-- GIT
vim.keymap.set("n", "<leader>gl", function()
  Snacks.lazygit.log()
end)

vim.keymap.set("n", "<leader>gL", function()
  Snacks.lazygit.log_file()
end)

vim.keymap.set("n", "<leader>gb", function()
  Snacks.git.blame_line()
end)

vim.keymap.set("n", "<leader>gC", function()
  Snacks.gitbrowse()
end)

-- SHOW TODOS
vim.keymap.set("n", "<leader>std", ":TodoTelescope<CR>")

-- DAP
vim.keymap.set("n", "<F5>", function()
  local dap = require("dap")
  dap.continue()
end, { desc = "Continuar depuração" })

vim.keymap.set("n", "<F10>", function()
  require("dap").step_over()
end)
vim.keymap.set("n", "<F11>", function()
  require("dap").step_into()
end)
vim.keymap.set("n", "<F12>", function()
  require("dap").step_out()
end)
vim.keymap.set("n", "<Leader>b", function()
  require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", "<Leader>lp", function()
  require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
vim.keymap.set("n", "<Leader>dr", function()
  require("dap").repl.open()
end)
vim.keymap.set("n", "<Leader>dl", function()
  require("dap").run_last()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
  require("dap.ui.widgets").hover()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
  require("dap.ui.widgets").preview()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dt", function()
  require("dapui").toggle()
end)
vim.keymap.set("n", "<Leader>df", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<Leader>ds", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.scopes)
end)

-- NEOTEST
vim.keymap.set("n", "<leader>tr", ":Neotest run<CR>", args)
vim.keymap.set("n", "<leader>tra", ':lua require("neotest").run.run(vim.fn.expand("%")) <CR>', args)
vim.keymap.set("n", "<leader>ts", ":Neotest summary<CR>", args)
vim.keymap.set("n", "<leader>to", ":Neotest output<CR>", args)
vim.keymap.set("n", "<leader>top", ":Neotest output-panel<CR>", args)
vim.keymap.set("n", "<leader>trd", ':lua require("neotest").run.run({strategy = "dap"})<CR>', args)

-- DADBOD
vim.keymap.set("n", "<leader>db", ":DBUIToggle<CR>", args)

-- UNDOTREE
vim.keymap.set("n", "<leader>uu", ":UndotreeToggle<CR>", { silent = true })

-- COMMENTARY
vim.keymap.set("n", "<leader>;", ":Commentary<CR>", { silent = true })
vim.keymap.set("v", "<leader>;", ":Commentary<CR>")

-- CURL
-- vim.keymap.set("n", "<leader>cc", function()
--   curl.open_curl_tab()
-- end, { desc = "Open a curl tab scoped to the current working directory" })
