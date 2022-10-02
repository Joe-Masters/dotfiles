local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Remap space bar as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
normal_mode = "n"
insert_mode = "i"
visual_mode = "v"
visual_block_mode = "x"
term_mode = "t"
command_mode = "c"

local normal = {
    -- Simpler window navigation
    { "<C-h>", "<C-w>h" },
    { "<C-j>", "<C-w>j" },
    { "<C-k>", "<C-w>k" },
    { "<C-l>", "<C-w>l" },
    -- Open Netrw as a left-hand file explorer
    { "<leader>e", ":Lex 40<cr>" },
    -- Resize with arrow keys
    { "<C-Up>", ":resize +2<CR>" },
    { "<C-Down>", ":resize -2<CR>" },
    { "<C-Left>", ":vertical resize -2<CR>" },
    { "<C-Right>", ":vertical resize +2<CR>" },
    -- Navigate buffers
    { "<leader>bn", ":bnext<CR>" },
    { "<leader>bp", ":bprevious<CR>" },
    -- Toggle Spellcheck
    { "<leader>sp", ":setlocal spell! spelllang=en_gb<CR>" },
}

for _, keymapping in ipairs(normal) do
    new_value, old_value = table.unpack(keymapping)
    keymap(normal_mode, new_value, old_value, opts)
end

-- Insert mode
-- Press jk quickly to ESC
keymap(insert_mode, "jk", "<ESC>", opts)

local visual = {
    -- Keep yanked text when pasting over highlighted text
    { "p", '" _dP'},
    -- Move text up and down (single line)
    { "<A-j>", ":m .+1<CR>==gv-gv" },
    { "<A-k>", ":m .-2<CR>==gv-gv" },
    -- Move text up and down ((visual) block of text)
    { "<A-j>", ":move '>+1<CR>gv-gv" },
    { "<A-k>", ":move '<-2<CR>gv-gv" },
}

for _, keymapping in ipairs(visual) do
    new_value, old_value = table.unpack(keymapping)
    keymap(visual_mode, new_value, old_value, opts)
end
