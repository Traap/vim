" {{{ Leader
let g:mapleader = ","
let maplocalleader = ","
set tm=750                                   " Leader key timeout.
" -------------------------------------------------------------------------- }}}
" {{{ Filetype and plugin defaults.
filetype on
filetype plugin indent on
" -------------------------------------------------------------------------- }}}
" {{{ Alphabetical listing of things I set.
set autowrite
set cmdheight=1                               " Height of the command bar.
set colorcolumn=+1
set complete=.,w,b,u,t,i,kspell
set encoding=UTF-8
set expandtab
set fileformats=unix
set foldmethod=marker
set formatoptions=qrn1t
set hlsearch                                  " Highlight previous search
set ignorecase                                " Ignore case when searching
set laststatus=2
set lazyredraw
set linebreak
set matchtime=3
set modelines=0
set nobackup
set nocompatible
set norelativenumber
set noswapfile
set notimeout
set novisualbell
set number
set numberwidth=1
set path+=**
set shiftround
set shiftwidth=2
set showbreak=↪
set showcmd
set showmatch
set showmode
set sidescroll=1
set sidescrolloff=10
set smartcase                                 " Be smart about case.
set softtabstop=2
set splitbelow splitright
set synmaxcol=800
set tabstop=2
set textwidth=80
set title
set ttimeoutlen=10
set ttyfast
set undodir=~/.vim/undodir
set undofile
set virtualedit+=block
set visualbell
set wrap

syntax on

" -------------------------------------------------------------------------- }}}
" {{{ Show trailing whitespaces
set nolist                                    " Show trailing whitespaces
if &listchars ==# 'eol:$'                     " But only interesting whitespace
  set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:-,nbsp:+
endif

" -------------------------------------------------------------------------- }}}
" {{{ grep experiment
" Yank visually selected test and search for it in any file.
vnoremap _g y:exe "grep /. escape(@", '\\/') . "/ *.*"<cr>

" ------------------------------------------------------------------------- }}}
" {{{ Print options
set printoptions=paper:A4,duplex:off,collate:n,syntax:y,number:y,top:5pc,right:2pc,bottom:5pc,left:2pc
" -------------------------------------------------------------------------- }}}
" {{{ neovim
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  set mouse=nvi
  behave xterm
endif
" -------------------------------------------------------------------------- }}}
" {{{ The Silver Search through ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'
" -------------------------------------------------------------------------- }}}
" {{{ vim-most-minimal-folds
let g:most_minimal_folds_line_count = 1
" -------------------------------------------------------------------------- }}}
