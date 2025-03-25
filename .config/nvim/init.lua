-- vim: ts=2 sts=2 sw=2 et

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.cmd.colorscheme 'wildcharm'

vim.g.have_nerd_font = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.confirm = true
vim.opt.termguicolors = false
vim.opt.nrformats:append { 'alpha', 'octal', 'hex', 'bin' }

local keymap = vim.keymap.set

-- Preview quickfix list item
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'qf',
  callback = function()
    keymap('n', 'o', '<CR><C-w>p', { buffer = true, silent = true })
  end,
})

-- Resize with arrow keys
keymap('n', '<left>', '<cmd>vertical resize +2<CR>')
keymap('n', '<right>', '<cmd>vertical resize -2<CR>')
keymap('n', '<down>', '<cmd>horizontal resize +2<CR>')
keymap('n', '<up>', '<cmd>horizontal resize -2<CR>')

-- Highlight when yanking text.
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  'tpope/vim-sleuth',
  require 'plugins.gitsigns',
  require 'plugins.which-key',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.autocomplete',
  require 'plugins.conform',
  require 'plugins.treesitter',
  require 'plugins.neo-tree',
  require 'plugins.todo-comments',
}
