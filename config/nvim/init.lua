-- Neovim-specific config
-- A lot borrowed from arnvald/viml-to-lua but mostly nicknisi/dotfiles

require "user.autopairs"
require "user.colorscheme"
require "user.comment"
require "user.cmp"
require "user.dap"
require "user.filetype"
require "user.gitsigns"
require "user.keymaps"
require "user.lsp"
require "user.options"
require "user.plugins"
require "user.telescope"
require "user.treesitter"


-- Tag jumpings with ctags
--command! MakeTags !ctags -R .


-- Snippets!! Find out how to do these in lua and add snippets to nvim/snippets/[language]/
