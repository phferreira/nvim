vim.api.nvim_create_user_command("GitShow", function(opts)
  local branch = opts.args
  local current_file = vim.fn.expand("%:p")

  local git_file = vim.fn.systemlist({ "git", "ls-files", "--full-name", current_file })[1]

  if not git_file or git_file == "" then
    vim.notify("Arquivo não rastreado pelo Git", vim.log.levels.ERROR)
    return
  end

  local content = vim.fn.systemlist({
    "git",
    "show",
    branch .. ":" .. git_file,
  })

  vim.cmd("vnew")
  vim.api.nvim_buf_set_lines(0, 0, -1, false, content)

  vim.bo.buftype = "nofile"
  vim.bo.bufhidden = "wipe"
  vim.bo.swapfile = false
  vim.bo.modifiable = false

  vim.cmd("file " .. vim.fn.fnameescape(git_file .. " [" .. branch .. "]"))
end, {
  nargs = 1,
})
