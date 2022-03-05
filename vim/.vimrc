" Plugins =========================================================================================
call plug#begin('~/.vim/plugged')
" Layouts
Plug 'Yggdroot/indentLine'
Plug 'ntpeters/vim-better-whitespace'
"- airline
Plug 'vim-airline/vim-airline'
" MISC tools
"- nerdtree
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'xuyuanp/nerdtree-git-plugin'
"- others
Plug 'jiangmiao/auto-pairs'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" filetype =========================================================================================
autocmd BufNewFile,BufRead *inc set filetype=cpp syntax=cpp
filetype on
filetype indent on
filetype plugin on

" Encoding =========================================================================================
set encoding=utf-8
scriptencoding utf-8

" for difference mode ==============================================================================
if &diff
    set scrollbind
    set noro
endif
" airline ==========================================================================================
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_extensions = ['branch', 'tabline']
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#cursormode#enabled = 1
let g:airline#extensions#nerdtree_statusline = 0
let g:airline_section_c = ''
let g:airline_mode_map = {
            \ '__'		: '-',	'c'		: 'C',	'i'		: 'I',	'ic'	: 'I',	'ix'	: 'I',	'n'		: 'N',
            \ 'multi'	: 'M',	'ni'	: 'N',	'no'	: 'N',	'R'		: 'R',	'Rv'	: 'R',	's'		: 'S',
            \ 'S'		: 'S',	''	: 'S',	't'		: 'T',	'v'		: 'V',	'V'		: 'V',	''	: 'V',
            \ }
nmap <C-N>	:bn<CR>
nmap <C-P>	:bp<CR>
noremap <C-x> :w<CR>:bd<CR>

" The-NERD-tree ====================================================================================
let NERDTreeHighlightCursorline = 1
let NERDTreeWinPos = 1
let NERDTreeMinimalUI = 1
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
nmap <leader>e :exec 'NERDTreeToggle'<CR>

" The-NERD-Commenter ===============================================================================
let g:NERDSpaceDelims = 1
map mm	<leader>c<space>

" key mapping ======================================================================================
" let mapleader = ","
nmap <leader>f :vimgrep /
nmap cs	:noh<CR>
nmap <silent> <leader>bb :wa <Enter> :make -C build <CR>
inoremap ;; <ESC>
nmap <UP>		<Nop>
nmap <down>		<Nop>
nmap <right>	<Nop>
nmap <left>		<Nop>
imap <UP>		<Nop>
imap <down>		<Nop>
imap <right>	<Nop>
imap <left>		<Nop>

" vim settings =====================================================================================
"cursor
set cursorline
set	cursorcolumn
"indent
set ai
set si
set cindent
" tab
set ts=4
set shiftwidth=4
set expandtab
set listchars=tab:\ .
set list
"number
set nu
set relativenumber
"window
set splitright
set splitbelow
set fillchars=vert:\ ,stl:\ ,stlnc:\
"search
set hlsearch
set ic
set smartcase
set incsearch
"file
set	backspace=indent,eol,start
"zsh
set wildmenu
set wildmode=full
" Set background color at colum 100
set colorcolumn=100
" tab
set showtabline=2
"others
set nocompatible
set t_Co=256
set showmatch
set showcmd
set nowrap
set guifont=Inconsolata\ for\ Powerline\ 20
set noshowmode
set scrolloff=5

" my color ========================================================================================
hi clear

if exists("synctax_on")
    synctax reset
endif

hi Search       ctermfg=208 ctermbg=235 cterm=none
hi CursorLine               ctermbg=235 cterm=none
hi CursorColumn             ctermbg=235 cterm=none
hi ColorColumn              ctermbg=235
hi LineNr       ctermfg=237             cterm=none
hi CursorLineNr ctermfg=247 ctermbg=233 cterm=bold
hi Comment      ctermfg=241             cterm=none

hi DiffAdd      ctermfg=108 ctermbg=235 cterm=reverse
hi DiffChange   ctermfg=103 ctermbg=235 cterm=reverse
hi DiffDelete   ctermfg=131 ctermbg=235 cterm=reverse
hi DiffText     ctermfg=208 ctermbg=235 cterm=reverse
" autocmd =========================================================================================
autocmd BufWritePre * :%s/\s\+$//e
