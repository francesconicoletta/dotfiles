local nnoremap = require("nomnp.keymap").nnoremap
local vnoremap = require("nomnp.keymap").vnoremap
local xnoremap = require("nomnp.keymap").xnoremap
local inoremap = require("nomnp.keymap").inoremap

-- resizing
nnoremap("<Up>", "<cmd>resize +2<CR>")
nnoremap("<Down>", "<cmd>resize -2<CR>")
nnoremap("<Left>", "<cmd>vertical resize +2<CR>")
nnoremap("<Right>", "<cmd>vertical resize -2<CR>")

-- move and indent selected lines
vnoremap("K", "[[:move '<-2<CR>gv=gv]]")
vnoremap("J", "[[:move '>+1<CR>gv=gv]]")

-- disable PageUp and PageDown keys
nnoremap("<PageUp>", "")
nnoremap("<PageDown>", "")
vnoremap("<PageUp>", "")
vnoremap("<PageDown>", "")
xnoremap("<PageUp>", "")
xnoremap("<PageDown>", "")
inoremap("<PageUp>", "")
inoremap("<PageDown>", "")

-- change working directory
nnoremap("<leader>cd", "<cmd>:cd %:p:h<CR>:pwd<CR>")

-- paste over selection without yanking it
xnoremap("<leader>p", "\"_dP")
