vim.g.mapleader = ' '

-- MOVE SELCTED LINES
vim.keymap.set('v', '<C-K>', ':m \'<-2<CR>gv=gv')
vim.keymap.set('v', '<C-J>', ':m \'>+1<CR>gv=gv')

-- KEEP SELECTION
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', 'u', 'ugv')
vim.keymap.set('v', 'U', 'Ugv')

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
vim.keymap.set('n', '<leader>fR', ':FlutterHotRestart<cr>')
vim.keymap.set('n', '<leader>fD', ':FlutterVisualDebug<cr>')
vim.keymap.set('n', '<leader>fa', ':lua FlutterAnalyze()<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ft', ':lua FlutterTest()<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fct', ':lua FlutterCreateTest()<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fta', ':lua FlutterTestAll()<cr>', { noremap = true, silent = true })

-- CODE ACTION
vim.keymap.set('n', '<M-CR>', require("actions-preview").code_actions, { noremap = true, silent = true })

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
vim.keymap.set('n', '<leader>gR', ':lua GReset()<CR>')
vim.keymap.set('n', '<leader>gP', ':lua GPull()<CR>')
vim.keymap.set('n', '<leader>gC', ':lua require\'telescope.builtin\'.git_branches()<CR>')
vim.keymap.set('n', '<leader>gS', ':lua require\'telescope.builtin\'.git_stash()<CR>')
vim.keymap.set('n', '<leader>gL', ':lua require\'telescope.builtin\'.git_commits()<CR>')
vim.keymap.set('n', '<leader>d', ':lua ToggleDiagnostics()<CR>')

-- SHOW TODOS
vim.keymap.set('n', '<leader>std', ':TodoTelescope<CR>')
