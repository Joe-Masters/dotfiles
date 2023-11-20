-- :help options for details

local options = {
    clipboard = "unnamedplus",	    -- Allow Neovim access to system clipboard 
    cmdheight = 2,		    -- More space in the Neovim cmdline for displaying messages
    colorcolumn = "90",
    conceallevel = 0,		    -- So that `` is visible in markdown files
    expandtab = true,
    foldmethod = "syntax",
    hlsearch = true,		    -- Highlight all matches on previous search pattern
    ignorecase = true,		    -- Ignore case in search patterns
    list = true,		    -- Show hidden chars
    mouse = "a",			    -- Allow the mouse to be used in Neovim
    number = true,
    pumheight = 10,		    -- Pop up menu height
    relativenumber = true,
    shiftround = true,
    shiftwidth = 2,
    showtabline = 2,		    -- Always show tabs
    smartcase = true,
    smarttab = true,
    softtabstop = 2,
    spell = true,
    spelllang = "en_gb",
    tabstop = 2,                    -- See tabstop in :h options for tab info
}

vim.opt.path:append { "**" }        -- equiv to .vim set path += ** for tab searching subdirs 

-- Set hidden chars
vim.opt.listchars = { eol = '⏎', tab = '->|', trail = '⏺' }

-- Diff settings - ignore all whitespace and default to vertical split diff
vim.opt.diffopt:append { "iwhiteall", "vertical" }

for option, value in pairs(options) do
    vim.opt[option] = value
end
