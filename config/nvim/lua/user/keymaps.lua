local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Remap space bar as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
local normal_mode = "n"
local insert_mode = "i"
local visual_mode = "v"
local visual_block_mode = "x"
local term_mode = "t"
local command_mode = "c"

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
    -- Tabs
    { "<leader>nt", ":tabnew<CR>" },
    { "<leader>wt", ":tabclose<CR>" },
    { "<A-n>", ":tabnext<CR>" },
    { "<A-p>", ":tabprevious<CR>" },
    -- Toggle Spellcheck
    { "<leader>sp", ":setlocal spell! spelllang=en_gb<CR>" },
    -- Telescope
    { "<leader>fb", "<cmd>Telescope buffers<cr>" },
    { "<leader>f", "<cmd>Telescope find_files<cr>" },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>" },
    { "<leader>gs", "<cmd>Telescope git_status<cr>" },
    { "<leader>gb", "<cmd>Telescope git_branches<cr>" },
    --{ "<leader>/", "<cmd>Telescope live_grep<cr>" },
    {"<leader>/", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>" },
    { "<leader>s", "<cmd>Telescope spell_suggest<cr>" },
}

for _, keymapping in ipairs(normal) do
    local new_value, old_value = table.unpack(keymapping)
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
    { "jk", "<ESC>" },
}

for _, keymapping in ipairs(visual) do
    local new_value, old_value = table.unpack(keymapping)
    keymap(visual_mode, new_value, old_value, opts)
end

local command = {
  -- quit all (when using multiple tabs)
  { "<S-q>", "quitall" },
}

for _, keymapping in ipairs(command) do
    local new_value, old_value = table.unpack(keymapping)
    keymap(command_mode, new_value, old_value, opts)
end

