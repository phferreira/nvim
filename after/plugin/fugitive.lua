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
  vim.cmd('Git pull origin ' .. GetCurrentBranch() .. ' --rebase --recurse-submodules' )
end

