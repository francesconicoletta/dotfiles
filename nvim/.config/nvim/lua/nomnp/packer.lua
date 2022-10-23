local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec([[
  augroup Packer
  autocmd!
  autocmd BufWritePost init.lua PackerCompile
  augroup end
]], false)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-commentary'
  use 'szw/vim-maximizer'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'folke/tokyonight.nvim'
  use 'tpope/vim-fugitive'
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use { 'glepnir/lspsaga.nvim', branch = "main" }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
    requires = { 'nvim-treesitter/nvim-treesitter-textobjects' } }
end)
