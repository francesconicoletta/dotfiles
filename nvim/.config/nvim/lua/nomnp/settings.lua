local opt = vim.opt

opt.inccommand = 'nosplit'
opt.hidden = true
opt.wildmenu = true
opt.wildmode = "list:longest,full"
opt.ignorecase = true
opt.smartcase = true
opt.backspace = "indent,eol,start"
opt.startofline = false
opt.confirm = true
opt.mouse = 'a'
opt.number = true
opt.relativenumber = true
opt.breakindent = true
opt.linebreak = true
opt.tabstop = 8
opt.softtabstop = 8
opt.autoindent = true
opt.shiftwidth = 8
opt.colorcolumn = "80"
opt.updatetime = 200
opt.undofile = true
opt.incsearch = true
opt.modeline = false
opt.list = true
opt.foldlevelstart = 20
opt.undofile = true
opt.completeopt = "menuone,noselect"
opt.path = vim.opt.path + '**'
opt.shortmess = opt.shortmess + 'c'
opt.nrformats = opt.nrformats + 'alpha' + 'octal'
opt.dictionary = opt.dictionary + '/usr/share/dict/words'
opt.clipboard = 'unnamedplus'

if os.getenv("TERM_PROGRAM") ~= "Apple_Terminal" then
  opt.termguicolors = true
  vim.cmd 'colorscheme tokyonight'
end

--vim.cmd 'syntax off'
