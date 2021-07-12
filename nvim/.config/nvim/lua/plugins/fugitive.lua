vim.api.nvim_set_keymap('n', '<Up>', '<cmd>resize +2<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gs', '<cmd>G<CR>', {noremap = true})

-- dv on file
vim.api.nvim_set_keymap('n', '<leader>gf', '<cmd>diffget //2<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gj', '<cmd>diffget //3<CR>', {noremap = true})
