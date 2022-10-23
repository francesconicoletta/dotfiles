local nnoremap = require("nomnp.keymap").nnoremap

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key"
      },
    },
  },
}

-- add leader shortcuts
nnoremap('<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
nnoremap('<leader>sf', [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]])
nnoremap('<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]])
nnoremap('<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]])
nnoremap('<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]])
nnoremap('<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]])
nnoremap('<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]])
nnoremap('<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]])
nnoremap('<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])
