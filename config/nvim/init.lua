-- Neovim-specific config
-- A lot borrowed from arnvald/viml-to-lua but mostly nicknisi/dotfiles


HOME = os.getenv("HOME")

local g = vim.g
local opt = vim.opt
local fn = vim.fn
local env = vim.env
local cmd = vim.cmd


opt.compatible = false

-- Tab control
opt.smarttab = true
opt.tabstop = 8
opt.softtabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.expandtab = false

opt.spell = true
opt.number = true
