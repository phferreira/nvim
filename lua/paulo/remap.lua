vim.g.mapleader = ' '

local args = { noremap = true, silent = true }

-- MOVE SELCTED LINES
vim.keymap.set('v', '<C-K>', ':m \'<-2<CR>gv=gv')
vim.keymap.set('v', '<C-J>', ':m \'>+1<CR>gv=gv')

-- KEEP SELECTION
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', 'u', 'ugv')
vim.keymap.set('v', 'U', 'Ugv')

-- KEEP CURRENT REGISTER ON PASTE
vim.keymap.set("x", "p", '"_dP', args)
vim.keymap.set("x", "P", '"_dP', args)

-- CENTER ON COMMAND
vim.keymap.set('n', '<space><space>', 'i<space><ESC>')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- FINDS
vim.keymap.set('n', '[q', ':cprev<CR>')
vim.keymap.set('n', ']q', ':cnext<CR>')
vim.keymap.set('n', '[Q', ':cfirst<CR>')
vim.keymap.set('n', ']Q', ':clast<CR>')
vim.keymap.set('n', '[<C-Q>', ':cpfile<CR>')
vim.keymap.set('n', ']<C-Q>', ':cnfile<CR>')

-- NAVIGATION
vim.keymap.set('n', '<M-l>', ':bn<cr>')
vim.keymap.set('n', '<M-h>', ':bp<cr>')
vim.keymap.set('n', '<C-M-l>', ':tabnext<cr>')
vim.keymap.set('n', '<C-M-h>', ':tabprevious<cr>')
vim.keymap.set('n', '<C-M-k>', ':tabnew<cr>')
vim.keymap.set('n', '<C-M-j>', ':tabclose<cr>')

-- CLOSE BUFFER
vim.keymap.set('n', '<leader>c', require("tabscope").remove_tab_buffer)

-- INSERT LINE
vim.keymap.set('n', '<C-j>', 'i<CR><ESC>')
vim.keymap.set('n', '<C-k>', 'O<ESC>')

-- REPLACE
vim.keymap.set('n', '<leader>r', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/g<LEFT><LEFT>')
vim.keymap.set('n', '<leader>rc', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gc<LEFT><LEFT><LEFT>')

-- TELESCOPE
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- DISABLE ARROW KEYS
vim.keymap.set('n', '<UP>', '<NOP>')
vim.keymap.set('n', '<DOWN>', '<NOP>')
vim.keymap.set('n', '<LEFT>', '<NOP>')
vim.keymap.set('n', '<RIGHT>', '<NOP>')
vim.keymap.set('n', '<C-UP>', '<NOP>')
vim.keymap.set('n', '<C-DOWN>', '<NOP>')
vim.keymap.set('n', '<C-LEFT>', '<NOP>')
vim.keymap.set('n', '<C-RIGHT>', '<NOP>')
vim.keymap.set('n', '<C-M-UP>', '<NOP>')
vim.keymap.set('n', '<C-M-DOWN>', '<NOP>')
vim.keymap.set('n', '<C-M-LEFT>', '<NOP>')
vim.keymap.set('n', '<C-M-RIGHT>', '<NOP>')

-- FLUTTER
vim.keymap.set('n', '<leader>fr', ':FlutterRun<cr>')
vim.keymap.set('n', '<leader>fq', ':FlutterQuit<cr>')
vim.keymap.set('n', '<leader>fH', ':FlutterHotReload<cr>')
vim.keymap.set('n', '<leader>fR', ':FlutterRestart<cr>')
vim.keymap.set('n', '<leader>fD', ':FlutterVisualDebug<cr>')
vim.keymap.set('n', '<leader>fa', ':lua FlutterAnalyze()<cr>', args)
vim.keymap.set('n', '<leader>ft', ':lua FlutterTest()<cr>', args)
vim.keymap.set('n', '<leader>fct', ':lua FlutterCreateTest()<cr>', args)
vim.keymap.set('n', '<leader>fta', ':lua FlutterTestAll()<cr>', args)

-- CODE ACTION
vim.keymap.set("n", "<M-CR>", vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "Code Action" })

-- DIAGNOSTICS
vim.keymap.set('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', args)
vim.keymap.set('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', args)
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', args)
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', args)

-- GIT
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
vim.keymap.set('n', '<leader>gc', ':Git commit<CR>')
vim.keymap.set('n', '<leader>ga', ':Git add %<CR>')
vim.keymap.set('n', '<leader>gr', ':Git restore --staged %<CR>')
vim.keymap.set('n', '<leader>gd', ':Gdiffsplit<CR>')
vim.keymap.set('n', '<leader>gl', ':Git log %<CR>')
vim.keymap.set('n', '<leader>gb', ':Git blame %<CR>')
vim.keymap.set('n', '<leader>gdh', ':diffget //2<CR>')
vim.keymap.set('n', '<leader>gdl', ':diffget //3<CR>')
vim.keymap.set('x', '<leader>gdp', ':diffput<CR>')
vim.keymap.set('x', '<leader>gdg', ':diffget<CR>')
vim.keymap.set('n', '<leader>gw', ':Gwrite<CR>')
vim.keymap.set('n', '<leader>gp', ':Git push<CR>')
vim.keymap.set('n', '<leader>gf', ':Git fetch --prune<CR>')
vim.keymap.set('n', '<leader>gR', ':lua GReset()<CR>')
vim.keymap.set('n', '<leader>gP', ':lua GPull()<CR>')
vim.keymap.set('n', '<leader>gC', ':lua require\'telescope.builtin\'.git_branches()<CR>')
vim.keymap.set('n', '<leader>gS', ':lua require\'telescope.builtin\'.git_stash()<CR>')
vim.keymap.set('n', '<leader>gL', ':lua require\'telescope.builtin\'.git_commits()<CR>')
vim.keymap.set('n', '<leader>d', ':lua ToggleDiagnostics()<CR>')

-- GIT SIGNS
local gs = require('gitsigns')

vim.keymap.set('n', ']c', function()
  if vim.wo.diff then return ']c' end
  vim.schedule(function() gs.next_hunk() end)
  return '<Ignore>'
end, { expr = true })

vim.keymap.set('n', '[c', function()
  if vim.wo.diff then return '[c' end
  vim.schedule(function() gs.prev_hunk() end)
  return '<ignore>'
end, { expr = true })

vim.keymap.set('n', '<leader>hr', gs.reset_hunk)
vim.keymap.set('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
vim.keymap.set('n', '<leader>hp', gs.preview_hunk)
vim.keymap.set('n', '<leader>hb', function() gs.blame_line { full = true } end)
vim.keymap.set('n', '<leader>tb', gs.toggle_current_line_blame)
vim.keymap.set('n', '<leader>td', gs.toggle_deleted)
vim.keymap.set('n', '<leader>tl', gs.toggle_linehl)

-- SHOW TODOS
vim.keymap.set('n', '<leader>std', ':TodoTelescope<CR>')

-- DAP
vim.keymap.set("n", "<F5>", function()
  if require('dap').session() then
    require('dap').continue()
  else
    vim.cmd('FlutterRun')
  end
end, { desc = "Continuar depuração" })
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>lp',
  function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dt', function()
  require('dapui').toggle()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)

-- NEOTEST
vim.keymap.set('n', '<leader>tr', ':Neotest run<CR>', args)
vim.keymap.set('n', '<leader>tra', ':lua require("neotest").run.run(vim.fn.expand("%")) <CR>', args)
vim.keymap.set('n', '<leader>ts', ':Neotest summary<CR>', args)
vim.keymap.set('n', '<leader>to', ':Neotest output<CR>', args)
vim.keymap.set('n', '<leader>top', ':Neotest output-panel<CR>', args)
vim.keymap.set('n', '<leader>trd', ':lua require("neotest").run.run({strategy = "dap"})<CR>', args)

-- DADBOD
vim.keymap.set('n', '<leader>db', ':DBUIToggle<CR>', args)

--CHATGPT
vim.keymap.set("n", "<leader>cg", "<cmd>ChatGPT<cr>", { desc = "Open ChatGPT" })
vim.keymap.set("v", "<leader>ce", ":<C-u>ChatGPTRun explain_code<CR>", { desc = "Explain code", silent = true })
vim.keymap.set("v", "<leader>cf", ":<C-u>ChatGPTRun fix_bugs<CR>", { desc = "Fix bugs", silent = true })
vim.keymap.set("v", "<leader>co", ":<C-u>ChatGPTRun optmize_code<CR>", { desc = "Optmize code", silent = true })
vim.keymap.set("v", "<leader>ct", ":<C-u>ChatGPTRun add_tests<CR>", { desc = "Add tests", silent = true })
vim.keymap.set("v", "<leader>cT", ":<C-u>ChatGPTRun translate<CR>", { desc = "Translate", silent = true })
vim.keymap.set("v", "<leader>ci", ":<C-u>ChatGPTEditWithInstructions<CR>",
  { desc = "Open ChatGPT with prompt", silent = true })
