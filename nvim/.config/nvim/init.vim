" Basic Settings {{{
set nocompatible
filetype indent plugin on
syntax on
set hidden
set wildmenu
set wildmode=list:longest,full
set ignorecase
set smartcase
set backspace=indent,eol,start
set nostartofline
set confirm
set mouse=a
set number
set relativenumber
set breakindent
set linebreak
set colorcolumn=80
set updatetime=100
set shortmess+=c
set nrformats+=alpha,octal,hex,bin
set undofile
set incsearch
set path+=**
set nomodeline
set list
set cursorline
set dictionary+=/usr/share/dict/words
"set foldmethod=syntax
"set tabstop=8
"set shiftwidth=8
"set softtabstop=0
"set noexpandtab
"set smarttab
"set notimeout ttimeout ttimeoutlen=200
"set signcolumn=yes
"}}}

" Remaps {{{
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Move and indent selected lines
vnoremap K :move '<-2<CR>gv=gv
vnoremap J :move '>+1<CR>gv=gv

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

	" Git
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-rhubarb'

	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'itchyny/lightline.vim'
	Plug 'tpope/vim-commentary'
	Plug 'szw/vim-maximizer'
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	Plug 'rust-lang/rust.vim'
call plug#end()
"}}}

"Colorscheme {{{
let g:gruvbox_contrast_dark = 'dark'
set termguicolors
colorscheme gruvbox
"}}}

" Fugitive {{{
nmap <leader>gs :G<CR>

" dv on file
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>
"}}}

" Lightline {{{
  let g:lightline = {
	\ 'colorscheme': 'gruvbox',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'cocstatus': 'coc#status',
	\   'gitbranch': 'FugitiveHead'
	\ },
\ }
"}}}

" Maximizer {{{
nnoremap <silent><F3> :MaximizerToggle<CR>
vnoremap <silent><F3> :MaximizerToggle<CR>gv
inoremap <silent><F3> <C-o>:MaximizerToggle<CR>
"}}}

" FZF {{{
map <C-t> :FZF <CR>
map <Leader>t :Rg <CR>

if executable('rg')
	let g:rg_derive_root='true'
endif
"}}}

" COC {{{
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
	nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
	inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
	vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"}}}

" Coc Extensions {{{
let g:coc_global_extensions = [
    \ 'coc-clangd',
    \ 'coc-deno',
    \ 'coc-eslint',
    \ 'coc-explorer',
    \ 'coc-highlight',
    \ 'coc-html',
    \ 'coc-java',
    \ 'coc-json',
    \ 'coc-marketplace',
    \ 'coc-pyright',
    \ 'coc-tsserver',
    \ 'coc-yaml',
    \ 'coc-emmet',
    \ ]
"}}}

" CocExplorer {{{
nnoremap <leader>e :CocCommand explorer --sources=buffer+,file+<CR>
nnoremap <leader>f :CocCommand explorer --preset floating<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'CocCommand explorer' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

let g:coc_explorer_global_presets = {
\   'floating': {
\     'position': 'floating',
\     'floating-width': 100,
\     'open-action-strategy': 'sourceWindow',
\   },
\ }
"}}}

" Prettier {{{
command! -nargs=0 Prettier :CocCommand prettier.formatFile
"}}}
