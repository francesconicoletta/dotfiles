" Basic Settings {{{
set nocompatible
filetype indent plugin on
syntax on
set shell=/bin/bash
set encoding=utf-8
set tabstop=8
set shiftwidth=8
set softtabstop=0
set noexpandtab
set smarttab
set hidden
set spelllang=en_us,it
"set spell
set wildmenu
set wildmode=list:longest,full
set showcmd
set cmdheight=1
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set confirm
set mouse=a
set number
set relativenumber
set notimeout ttimeout ttimeoutlen=200
set conceallevel=1
set splitbelow
set breakindent
set linebreak
set colorcolumn=80
"set signcolumn=yes
set updatetime=100
set shortmess+=c
set nrformats+=alpha
set undofile
set incsearch
set modifiable
set foldmethod=marker
set path+=**
set nomodeline
set splitright
" set listchars=trail:+
set list
set cursorline

let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:termdebug_wide=1
au BufRead /tmp/neomutt-* set colorcolumn=72
"}}}

" Remaps {{{
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Move and indent selected lines
"vnoremap K :move '<-2<CR>gv=gv
"vnoremap J :move '>+1<CR>gv=gv
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

" Disable PageUp and PageDown keys
nnoremap <PageUp> <Nop>
nnoremap <PageDown> <Nop>
xnoremap <PageUp> <Nop>
xnoremap <PageDown> <Nop>
inoremap <PageUp> <Nop>
inoremap <PageDown> <Nop>

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Change working directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
"}}}

" Plugins {{{
call plug#begin('~/.config/nvim/plugged')
	" Themes
	Plug 'gruvbox-community/gruvbox'
	Plug 'joshdick/onedark.vim'

	" Git
	Plug 'airblade/vim-gitgutter'
	Plug 'rhysd/git-messenger.vim'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-rhubarb'

	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	Plug 'neovim/nvim-lspconfig'
	Plug 'sheerun/vim-polyglot'
	Plug 'tpope/vim-commentary'
	Plug 'vim-airline/vim-airline'
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'npm install --frozen-lockfile && npm run compile' }
	Plug 'junegunn/goyo.vim'
call plug#end()
"}}}

" Colorscheme {{{
let g:gruvbox_italic=1
set termguicolors
autocmd vimenter * ++nested colorscheme gruvbox

let g:gruvbox_contrast_dark = 'dark'
" let hr = (strftime('%H'))
" if hr >= 19
" set background=dark
" elseif hr >= 8
" set background=light
" elseif hr >= 0
" set background=dark
" endif
"}}}

" git-messenger {{{
map <Leader>gm :GitMessenger <CR>
"}}}

" FZF {{{
map <C-t> :FZF <CR>
map <Leader>t :Rg <CR>

if executable('rg')
	let g:rg_derive_root='true'
endif
"}}}

" Prettier {{{
command! -nargs=0 Prettier :CocCommand prettier.formatFile
"}}}

" Fugitive {{{
nmap <leader>gs :G<CR>

" dv on file
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>
"}}}

" Goyo {{{
nnoremap <leader>x :Goyo<CR>
"}}}
