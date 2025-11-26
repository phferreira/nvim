return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },

  opts = function(_, opts)
    -------------------------------------------------------------------------
    -- NEW DEFAULTS (inclusos conforme solicitado)
    -------------------------------------------------------------------------
    opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
    })

    -------------------------------------------------------------------------
    -- FUNÇÕES PERSONALIZADAS DE GIT
    -------------------------------------------------------------------------
    local action_state = require("telescope.actions.state")
    local utils = require("telescope.utils")
    local actions = require("telescope.actions")

    local function ask_to_confirm(prompt, default_value, yes_values)
      yes_values = yes_values or { "y", "yes" }
      default_value = default_value or ""
      local confirmation = vim.fn.input(prompt, default_value)
      confirmation = string.lower(confirmation)
      if #confirmation == 0 then
        return false
      end
      for _, v in ipairs(yes_values) do
        if v == confirmation then
          return true
        end
      end
      return false
    end

    local git_pop_stash = function(prompt_bufnr)
      local selection = action_state.get_selected_entry()
      if not selection then
        utils.__warn_no_selection("git_pop_stash")
        return
      end

      actions.close(prompt_bufnr)

      local _, ret, stderr = utils.get_os_command_output({ "git", "stash", "pop", "--index", selection.value })

      if ret == 0 then
        utils.notify("git_pop_stash", {
          msg = string.format("applied: '%s' ", selection.value),
          level = "INFO",
        })
      else
        utils.notify("git_pop_stash", {
          msg = string.format("Error applying: %s → %s", selection.value, table.concat(stderr, " ")),
          level = "ERROR",
        })
      end
    end

    local git_drop_stash = function(prompt_bufnr)
      local selection = action_state.get_selected_entry()
      if not selection then
        utils.__warn_no_selection("git_drop_stash")
        return
      end

      if not ask_to_confirm(("Drop stash '%s'? [y/n]: "):format(selection.value)) then
        utils.notify("git_drop_stash", {
          msg = string.format("Canceled: '%s'", selection.value),
          level = "INFO",
        })
        return
      end

      actions.close(prompt_bufnr)

      local _, ret, stderr = utils.get_os_command_output({ "git", "stash", "drop", selection.value })

      if ret == 0 then
        utils.notify("git_drop_stash", {
          msg = string.format("deleted: '%s' ", selection.value),
          level = "INFO",
        })
      else
        utils.notify("git_drop_stash", {
          msg = string.format("Error deleting: %s → '%s'", selection.value, table.concat(stderr, " ")),
          level = "ERROR",
        })
      end
    end

    local git_copy_id = function(prompt_bufnr)
      local selection = action_state.get_selected_entry()
      if not selection then
        utils.__warn_no_selection("git_copy_id")
        return
      end

      actions.close(prompt_bufnr)

      local handle = io.popen("git rev-parse " .. selection.value)
      if not handle then
        utils.__warn_no_selection("git_copy_id:handle")
        return
      end

      local output = handle:read("*a")
      local full_id = output:gsub("[\n\r]", "")
      handle:close()

      vim.fn.setreg("+", full_id)
    end

    -------------------------------------------------------------------------
    -- EXTENDO OS PICKERS PADRÕES DO LAZYVIM
    -------------------------------------------------------------------------
    opts.pickers = opts.pickers or {}

    -- git stash
    opts.pickers.git_stash = vim.tbl_deep_extend("force", opts.pickers.git_stash or {}, {
      mappings = {
        n = {
          ["<C-p>"] = git_pop_stash,
          ["<C-d>"] = git_drop_stash,
        },
      },
    })

    -- git commits
    opts.pickers.git_commits = vim.tbl_deep_extend("force", opts.pickers.git_commits or {}, {
      mappings = {
        n = {
          ["<C-y>"] = git_copy_id,
        },
      },
    })

    return opts
  end,
}
