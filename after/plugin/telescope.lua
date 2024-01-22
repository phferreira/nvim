-- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/actions/init.lua

local action_state = require "telescope.actions.state"
local utils = require "telescope.utils"

local actions = require('telescope.actions')

local function ask_to_confirm(prompt, default_value, yes_values)
  yes_values = yes_values or { "y", "yes" }
  default_value = default_value or ""
  local confirmation = vim.fn.input(prompt, default_value)
  confirmation = string.lower(confirmation)
  if string.len(confirmation) == 0 then
    return false
  end
  for _, v in pairs(yes_values) do
    if v == confirmation then
      return true
    end
  end
  return false
end

local git_pop_stash = function(prompt_bufnr)
  local selection = action_state.get_selected_entry()
  if selection == nil then
    utils.__warn_no_selection "git_pop_stash"
    return
  end
  actions.close(prompt_bufnr)
  local _, ret, stderr = utils.get_os_command_output { "git", "stash", "pop", "--index", selection.value }
  if ret == 0 then
    utils.notify("git_pop_stash", {
      msg = string.format("applied: '%s' ", selection.value),
      level = "INFO",
    })
  else
    utils.notify("git_pop_stash", {
      msg = string.format("Error when applying: %s. Git returned: '%s'", selection.value, table.concat(stderr, " ")),
      level = "ERROR",
    })
  end
end

local git_drop_stash = function(prompt_bufnr)
  local selection = action_state.get_selected_entry()
  if selection == nil then
    utils.__warn_no_selection "git_drop_stash"
    return
  end
  local confirmation = ask_to_confirm(string.format("Drop stash '%s'? [y/n]: ", selection.value))
  if not confirmation then
    utils.notify("actions.git_create_branch", {
      msg = string.format("Drop stash canceled: '%s'", selection.value),
      level = "INFO",
    })
    return
  end
  actions.close(prompt_bufnr)
  local _, ret, stderr = utils.get_os_command_output { "git", "stash", "drop", selection.value }
  if ret == 0 then
    utils.notify("git_drop_stash", {
      msg = string.format("deleted: '%s' ", selection.value),
      level = "INFO",
    })
  else
    utils.notify("git_drop_stash", {
      msg = string.format("Error when deleting: %s. Git returned: '%s'", selection.value, table.concat(stderr, " ")),
      level = "ERROR",
    })
  end
end

local git_copy_id = function(prompt_bufnr)
  local selection = action_state.get_selected_entry()
  if selection == nil then
    utils.__warn_no_selection "git_copy_id"
    return
  end
  actions.close(prompt_bufnr)
  vim.fn.setreg('+', selection.value)
end

require("telescope").setup {
  pickers = {
    git_stash = {
      mappings = {
        n = {
          ["<C-p>"] = git_pop_stash,
          ["<C-d>"] = git_drop_stash,
        },
      },
    },
    git_commits = {
      mappings = {
        n = {
          ["<C-y>"] = git_copy_id,
        }
      }
    }
  },
}
