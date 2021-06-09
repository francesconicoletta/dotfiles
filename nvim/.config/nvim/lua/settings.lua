vim.cmd [[filetype plugin indent on]]
vim.cmd [[syntax enable]] 

vim.o.hidden = true
vim.o.wildmenu = true
vim.o.wildmode = "list:longest,full"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.backspace = "indent,eol,start"
vim.o.startofline = false
vim.o.confirm = true
vim.o.mouse = 'a'
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.breakindent = true
vim.o.linebreak = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.autoindent = true
vim.o.shiftwidth = 4
vim.wo.colorcolumn = "80"
vim.o.updatetime = 200
vim.cmd [[set shortmess+=c ]]
vim.cmd [[set nrformats+=alpha,octal,hex,bin ]]
vim.o.undofile = true
vim.o.incsearch = true
vim.cmd [[set path+=**]]
vim.o.modeline = false
vim.o.list = true
vim.o.cursorline = true
vim.cmd [[set dictionary+=/usr/share/dict/words]]
vim.o.completeopt = "menuone,noselect"
vim.cmd [[set undofile]]
