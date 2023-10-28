vim.cmd([[
  filetype plugin indent on
  syntax on
]])

vim.g.mapleader = ' '

vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', 'u', 'ugv')
vim.keymap.set('v', 'U', 'Ugv')

vim.keymap.set('n', '<space><space>', 'i<space><ESC>')
vim.keymap.set('n', 'n',      'nzzzv')
vim.keymap.set('n', 'N',      'Nzzzv')
vim.keymap.set('n', 'J',      'mzJ`z')
vim.keymap.set('n', '[q',     ':cprev<CR>')
vim.keymap.set('n', ']q',     ':cnext<CR>')
vim.keymap.set('n', '[Q',     ':cfirst<CR>')
vim.keymap.set('n', ']Q',     ':clast<CR>')
vim.keymap.set('n', '[<C-Q>', ':cpfile<CR>')
vim.keymap.set('n', ']<C-Q>', ':cnfile<CR>')
vim.keymap.set('n', '<M-Right>', ':bn<cr>')
vim.keymap.set('n', '<M-Left>',  ':bp<cr>')
vim.keymap.set('n', '<C-M-Right>', ':tabnext<cr>')
vim.keymap.set('n', '<C-M-Left>', ':tabprevious<cr>')
vim.keymap.set('n', '<C-M-Up>', ':tabnew<cr>')
vim.keymap.set('n', '<C-M-Down>', ':tabclose<cr>')

vim.keymap.set('n', '<C-j>', 'i<CR><ESC>')
vim.keymap.set('n', '<C-k>', 'O<ESC>')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set('n', '<leader>c',  require("tabscope").remove_tab_buffer)
vim.keymap.set('n', '<leader>r',  ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/g<LEFT><LEFT>')
vim.keymap.set('n', '<leader>rc', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gc<LEFT><LEFT><LEFT>')

vim.keymap.set('n', '<UP>',    '<NOP>')
vim.keymap.set('n', '<DOWN>',  '<NOP>')
vim.keymap.set('n', '<LEFT>',  '<NOP>')
vim.keymap.set('n', '<RIGHT>', '<NOP>')
