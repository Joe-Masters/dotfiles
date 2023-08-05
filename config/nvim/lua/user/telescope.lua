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
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
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
    }
  }
}

