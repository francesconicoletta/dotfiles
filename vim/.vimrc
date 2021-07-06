filetype indent plugin on
syntax on
set hidden
set wildmenu
set wildmode=list:longest,full
set ignorecase
set smartcase
set backspace=indent,eol,start
set mouse=a
set number
set relativenumber
set breakindent
set linebreak
set nrformats+=alpha,octal,hex,bin
set path+=**
set nomodeline
set undofile
set clipboard=unnamedplus
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab

nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
