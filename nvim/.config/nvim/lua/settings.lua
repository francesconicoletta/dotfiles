vim.opt.hidden = true
vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest,full"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.backspace = "indent,eol,start"
vim.opt.startofline = false
vim.opt.confirm = true
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.breakindent = true
vim.opt.linebreak = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.shiftwidth = 4
vim.opt.colorcolumn = "80"
vim.opt.updatetime = 200
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.modeline = false
vim.opt.list = true
vim.opt.cursorline = true
vim.opt.foldlevelstart = 20
vim.opt.completeopt = "menuone,noselect"
vim.cmd [[set path+=**]]
vim.cmd [[set shortmess+=c ]]
vim.cmd [[set nrformats+=alpha,octal,hex,bin ]]
vim.cmd [[set dictionary+=/usr/share/dict/words]]
vim.cmd [[set undofile]]
vim.cmd [[filetype plugin indent on]]
vim.cmd [[syntax enable]]
