" {{{ Tell Vim where our plugin manager is located.

call plug#begin('~/.vim/bundle')

" -------------------------------------------------------------------------- }}}
" {{{ Begin community plugins

Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-utils/vim-most-minimal-folds'

" -------------------------------------------------------------------------- }}}
" {{{ Done loading plugins.

call plug#end()

" -------------------------------------------------------------------------- }}}
" {{{ Minimal setting 

let g:mapleader = ','
let maplocalleader = ','

set clipboard+=unnamedplus	
set colorcolumn=+1
set foldmethod=marker
set hlsearch
set ignorecase
set number
set numberwidth=1
set path+=**
set timeoutlen=500

" -------------------------------------------------------------------------- }}}
" {{{ Indicate vimplug installation is done.

if g:not_finish_vimplug
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" -------------------------------------------------------------------------- }}}
" {{{ vim-plug-lookup : Lookup a plugin on GitHub 

if exists('g:loaded_plug_lookup')
  finish
endif
let g:loaded_plug_lookup = 1

function! PlugLookup(pat)
  if has('unix')
    let url = "xdg-open https://github.com/" . a:pat . ".git"
    call jobstart(url)
  endif
endfunction

" -------------------------------------------------------------------------- }}}
