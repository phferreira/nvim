return {
  "hasansujon786/super-kanban.nvim",
  dependencies = {
    "folke/snacks.nvim", -- [required]
    "nvim-orgmode/orgmode", -- [optional] Org format support
  },
  opts = {
    markdown = {
      -- Absolute or relative path where markdown note files are stored
      notes_dir = "./.notes/",
      -- Markdown heading level used for lists (e.g. h2)
      list_heading = "h2",
      -- Mark inserted when a list is marked complete
      list_auto_complete_mark = "**Complete**",
      -- String used to separate sections in the file
      section_separators = "***",
      -- Heading title for archived tasks
      archive_heading = "Archive",
      -- Initial section headings for new boards
      default_template = {
        "## Backlog\n",
        "## Todo\n",
        "## Work in progress\n",
        "## Completed\n",
        "**Complete**",
      },
      -- Lines inserted at the top of the file
      header = {
        "---",
        "",
        "kanban-plugin: basic",
        "",
        "---",
        "",
      },
      -- Lines inserted at the bottom of the file
      footer = {
        "",
        "%% kanban:settings",
        "```",
        '{"kanban-plugin":"basic"}',
        "```",
        "%%",
      },
    },
    list = {
      -- Width of the list window (columns)
      width = 32,
      -- Height of the list window (0–1 = % of screen height)
      height = 0.9,
      -- Z-index layering of the list window
      zindex = 6,
      -- List window border characters
      -- border = { '', '', '', '│', '┘', '─', '└', '│' }, -- bottom single
      -- border = { "", "", "", "│", "╯", "─", "╰", "│" }, -- bottom rounded
      border = "rounded",
      -- Additional window-local options for the list
      win_options = {},
    },
    board = {
      -- Width of the board window (0 = full width)
      width = 0,
      -- Height of the board window
      height = vim.o.lines - 2,
      -- Z-index layering of the board
      zindex = 5,
      -- Board border characters (empty or filled)
      -- border = { "", " ", "", "", "", "", "", "" }, -- Only add empty space on top border
      -- Additional window-local options for the board
      win_options = {},
      -- Padding around board content (top, left)
      padding = { top = 1, left = 8 },
    },
    icons = {
      -- Character for left edge of a list
      list_edge_left = "║", -- ║
      -- Character for right edge of a list
      list_edge_right = "║", -- ║
      -- Left decorative separator for elements
      -- bubble_edge_left = "", -- 
      -- Right decorative separator for elements
      -- bubble_edge_right = "", -- 
      -- Arrows
      arrow_left = "←",
      arrow_right = "→",
      arrow_up = "↑",
      arrow_down = "↓",
      -- Symbols for checkbox states in cards
      card_checkmarks = {
        ["empty_box"] = "☐",
        [" "] = " ",
        ["x"] = "✔",
      },
    },
  },
}
