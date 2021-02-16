" {{{ Tell Vim where our plugin manager is located.

call plug#begin('~/.vim/bundle')

Plug 'neovim/nvim-lspconfig'
Plug 'vim-utils/vim-most-minimal-folds'

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
set textwidth=80
set timeoutlen=500

colorscheme desert

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

nnoremap <silent> gx    :call PlugLookup(expand("<cWORD>"))<cr>
xnoremap <silent> gx "gy:call PlugLookup(@g)<cr>gv

function! PlugLookup(pat)
  if has('unix')
    let url = "xdg-open https://github.com/" . a:pat . ".git"
    call jobstart(url)
  endif
endfunction

" -------------------------------------------------------------------------- }}}
" {{{ Minimal keybindings that I must have!!! 

" Copy entire buffer to "+y buffer.
nnoremap <silent>cc ggVGg_"+y

" Copy visual selection to "+y buffer.
vnoremap <silent>cc "+y

" Paste
nnoremap <silent><leader>cv "+p

" Delete line
map - dd

" Select (charwise) the contents of the current line, excluding indentation.
nnoremap vv ^vg_

" Select entire buffer
nnoremap vaa ggvGg_
nnoremap Vaa ggVG

" Easier linewise reselection of what you just pasted.
nnoremap <leader>V V`]

" Make only the current window visible. 
nnoremap <silent> <leader>oo :only<cr>

" Execute the current line of text as a shell command.
noremap <leader>E !!$SHELL<cr>

"  KJV keybindings
nnoremap gk 0mMvg_"ky :exec "r!kjv  -b -d -w 65" getreg("k")<cr>

" -------------------------------------------------------------------------- }}}
" {{{ ???


" -------------------------------------------------------------------------- }}}
