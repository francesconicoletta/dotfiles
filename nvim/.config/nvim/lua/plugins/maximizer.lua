vim.api.nvim_set_keymap('n', '<silent><F3>', '<cmd>MaximizerToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('v', '<silent><F3>', '<cmd>MaximizerToggle<CR>gv', {noremap = true})
vim.api.nvim_set_keymap('i', '<silent><F3>', '<C-o><cmd>MaximizerToggle<CR>', {noremap = true})
