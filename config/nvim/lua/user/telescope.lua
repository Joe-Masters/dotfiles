local status_ok, plugin = pcall(require, "telescope")
local lga_ok, lga_actions = pcall(require, "telescope-live-grep-args.actions")
if not status_ok and lga_ok then
    return
end

local actions = require "telescope.actions"

plugin.setup {
    defaults = {
  prompt_prefix = " ",
  selection_caret = " ",
  path_display = { "truncate" },
    },
  extensions = {
    live_grep_args = {
      -- enable/disable auto-quoting (e.g. false means [auto config/kitty] searches for auto in the directory config/kitty)
      auto_quoting = false,
      mappings = { -- extend mappings
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        },
      },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    },
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require("telescope").load_extension("live_grep_args")
