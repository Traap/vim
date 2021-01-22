" {{{ Tell Vim where our plugin manager is located.

call plug#begin('~/.vim/bundle')
Plug 'nvim-telescope/telescope.nvim'
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
set signcolumn=yes
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
