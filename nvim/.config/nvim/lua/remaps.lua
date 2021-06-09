-- resizing
vim.api.nvim_set_keymap('n', '<Up>', '<cmd>resize +2<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Down>', '<cmd>resize -2<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Left>', '<cmd>vertical resize +2<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Right>', '<cmd>vertical resize -2<CR>', {noremap = true})

-- move and indent selected lines
vim.api.nvim_set_keymap('v', 'K', "<cmd>move '<-2<CR>gv=gv", {noremap = true})
vim.api.nvim_set_keymap('v', 'J', "<cmd>move '>+1<CR>gv=gv", {noremap = true})

-- disable PageUp and PageDown keys
vim.api.nvim_set_keymap('n', '<PageUp>', '', {noremap = true})
vim.api.nvim_set_keymap('n', '<PageDown>', '', {noremap = true})
vim.api.nvim_set_keymap('x', '<PageUp>', '', {noremap = true})
vim.api.nvim_set_keymap('x', '<PageDown>', '', {noremap = true})
vim.api.nvim_set_keymap('i', '<PageUp>', '', {noremap = true})
vim.api.nvim_set_keymap('i', '<PageDown>', '', {noremap = true})

-- save file as sudo on files that require root permission
vim.api.nvim_set_keymap('c', 'w!!', "<cmd>execute 'silent! write !sudo tee % >/dev/null' <bar> edit!", {noremap = true})

-- change working directory
vim.api.nvim_set_keymap('n', '<leader>cd', '<cmd>:cd %:p:h<CR>:pwd<CR>', {noremap = true})
