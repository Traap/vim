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
set fileformats=unix
set foldmethod=marker
set laststatus=2
set lazyredraw
set linebreak
set matchtime=3
set modelines=0
set nocompatible
set norelativenumber
set notimeout
set nobackup
set noswapfile
set novisualbell
set number
set numberwidth=1
set path+=**
set showbreak=↪
set showcmd
set showmatch
set showmode
set sidescroll=1
set sidescrolloff=10
set splitbelow splitright
set synmaxcol=800
set title
set ttimeoutlen=10
set ttyfast
set virtualedit+=block
set visualbell
set undodir=~/.vim/undodir
set undofile
syntax on
" -------------------------------------------------------------------------- }}}
" {{{ Show trailing whitespaces
set nolist                                    " Show trailing whitespaces
if &listchars ==# 'eol:$'                     " But only interesting whitespace
  set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:-,nbsp:+
endif
" -------------------------------------------------------------------------- }}}
" {{{ Searching
set hlsearch                                  " Highlight previous search
set ignorecase                                " Ignore case when searching
set smartcase                                 " Be smart about case.
" -------------------------------------------------------------------------- }}}
" {{{ Tabs, spaces and wrapping
set expandtab
set formatoptions=qrn1t
set shiftround
set shiftwidth=2
set softtabstop=2
set tabstop=2
set textwidth=80
set wrap
" -------------------------------------------------------------------------- }}}
" {{{ Terminal and GUI setup. 
"
" Establish setting for gui and non-gui vim sessions.
if has("gui_running")

  " Don't blink normal mode cursor
  set guicursor=n-v-c:block-Cursor
  set guicursor+=n-v-c:blinkon0

  set guioptions-=e
  set guioptions-=l
  set guioptions-=L
  set guioptions-=m
  set guioptions-=r
  set guioptions-=R
  set guioptions-=T

  " Set fonts.
  if has("gui_macvim")
    set guifont=Menlo:h13
  else
    set guifont=DejaVu\ Sans\ Mono\ 9
  endif

  set guitablabel=%M\ %t
  hi Directory guifg=#8ac6f2
else

  let &t_SI.="\e[5 q" "SI = Insert
  let &t_SR.="\e[4 q" "SR = Replace
  let &t_EI.="\e[6 q" "EI = Normal

endif

" Set utf-8 as standard encoding and en_US as the standard language
if !has('nvim')
  " Only set this for vim, since neovim is utf8 as default and setting it
  " causes problems when reloading the .vimrc configuration
  set encoding=utf-8
  if exists('$TMUX')
    set term=screen-256color
  endif
endif

" disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color tmux and GNU screen.
" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
if &term =~ '256color'
  set t_ut=
endif

" VIM color are not readable.
if !has("gui_running")
  colorscheme desert
endif
" -------------------------------------------------------------------------- }}}
" {{{ Automatic spelling and typo corrections.
iabbrev efk            gary.howard@fresenius-kabi.com
iabbrev egh            gary.a.howard@mac.com
iabbrev developmetn    development
iabbrev heigth         heigth
iabbrev liek           likewisee
iabbrev liekwise       likewise
iabbrev manditory      mandatory
iabbrev moer           more
iabbrev pritn          print
iabbrev reprot         report
iabbrev retrun         return
iabbrev sectoin        section
iabbrev subsectoin     subsection
iabbrev subsubsectoin  subsubsection
iabbrev teh            the
iabbrev thier          their
iabbrev verboase       verbose
iabbrev waht           what
iabbrev weight         weigth
iabbrev weihg          weigh
iabbrev widht          width
iabbrev wiegh          weigh
iabbrev wiegth         weigth
" ------------------------------------------------------------------------- }}}
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
