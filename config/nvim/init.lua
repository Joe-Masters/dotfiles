-- Neovim-specific config
-- A lot borrowed from arnvald/viml-to-lua but mostly nicknisi/dotfiles

require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"

-- Tag jumpings with ctags
--command! MakeTags !ctags -R .


-- Snippets!! Find out how to do these in lua and add snippets to nvim/snippets/[language]/
