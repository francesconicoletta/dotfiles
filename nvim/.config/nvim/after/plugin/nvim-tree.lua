local nnoremap = require("nomnp.keymap").nnoremap

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup()
nnoremap("<leader>e", ":NvimTreeToggle<cr>")
