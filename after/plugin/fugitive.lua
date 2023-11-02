vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
vim.keymap.set('n', '<leader>gc', ':Git commit<CR>')
vim.keymap.set('n', '<leader>ga', ':Git add %<CR>')
vim.keymap.set('n', '<leader>gr', ':Git restore --staged %<CR>')
vim.keymap.set('n', '<leader>gd', ':Gdiffsplit<CR>')
vim.keymap.set('n', '<leader>gl', ':Git log %<CR>')
vim.keymap.set('n', '<leader>gb', ':Git blame %<CR>')
vim.keymap.set('n', '<leader>gf', ':diffget //2<CR>')
vim.keymap.set('n', '<leader>gj', ':diffget //3<CR>')
vim.keymap.set('n', '<C-h>',      ':diffput')
vim.keymap.set('n', '<C-l>',      ':diffget')
vim.keymap.set('n', '<leader>gw', ':Gwrite<CR>')
vim.keymap.set('n', '<leader>gp', ':Git push<CR>')
vim.keymap.set('n', '<leader>gP', ':lua GPull()<CR>')
vim.keymap.set('n', '<leader>gC', ':lua require\'telescope.builtin\'.git_branches()<CR>')
vim.keymap.set('n', '<leader>gS', ':lua require\'telescope.builtin\'.git_stash()<CR>')

local function GetCurrentBranch()
  local handle = io.popen('git branch --show-current' )
  local output = handle:read('*a')
  local branch = output:gsub('[\n\r]', ' ')
  handle.close()
  return branch
end

function GReset()
  vim.cmd('Git reset origin/' .. GetCurrentBranch() .. ' --hard --recurse-submodules' )
end

function GPull()
  vim.cmd('Git pull origin ' .. GetCurrentBranch() .. ' --recurse-submodules' )
end

