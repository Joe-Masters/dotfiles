vim.cmd[[
set termguicolors
try
    colorscheme catppuccin-mocha
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
endtry  
]]
