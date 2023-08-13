local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system ({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim when plugins.lua file is saved
vim.cmd([[
    augroup packer_user_config
	autocmd!
	autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Plugins to install
return packer.startup(function(use)

    use("wbthomason/packer.nvim") -- Have packer manage itself
    use "numToStr/Comment.nvim"   -- Quick commenting

    -- Completion plugins
    use "hrsh7th/nvim-cmp"     -- main completion plugin
    use "hrsh7th/cmp-buffer"   -- buffer completions
    use "hrsh7th/cmp-path"     -- path completions
    use "hrsh7th/cmp-cmdline"  -- cmdline completions
    use "hrsh7th/cmp-nvim-lsp"
    use "windwp/nvim-autopairs"  -- Auto close brackets, braces etc.

    -- Snippets
    use "L3MON4D3/LuaSnip"

    -- LSP
    use {
    "williamboman/mason.nvim",
    run = ":MasonUpdate", -- :MasonUpdate updates registry contents
    }
    use "neovim/nvim-lspconfig"
    use "williamboman/mason-lspconfig.nvim"

    -- Linters

    -- Telescope plugins
    use {
      "nvim-telescope/telescope.nvim", tag = "0.1.2",
      requires = { {"nvim-lua/plenary.nvim"} }
    }
    use "nvim-telescope/telescope-live-grep-args.nvim"

    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }  -- improved sorting performance

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    }
    use "p00f/nvim-ts-rainbow"

    -- git
    use "lewis6991/gitsigns.nvim"
    use "tpope/vim-fugitive"
    -- Language specific comments
    use "JoosepAlviste/nvim-ts-context-commentstring"

    -- Colour schemes
    use { "catppuccin/nvim", as = "catppuccin", tag = "v1.3.0" }
end)
