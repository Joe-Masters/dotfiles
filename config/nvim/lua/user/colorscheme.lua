vim.cmd[[
try
    colorscheme gruvbox-baby
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme slate
endtry  
]]
