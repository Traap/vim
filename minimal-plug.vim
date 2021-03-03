" {{{ Tell vim-plug where our plugins are located.

call plug#begin("$HOME/.vim/bundle")

" Must have

Plug 'ajh17/VimCompletesMe'
Plug 'chriskempson/base16-vim'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'lervag/wiki-ft.vim'
Plug 'lervag/wiki.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-utils/vim-most-minimal-folds'

call plug#end()

" -------------------------------------------------------------------------- }}}
" {{{ Indicate vimplug installation is done.

if g:traap_pluginstall
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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
" {{{ Minimal keybindings that I must have!!!

" Copy entire buffer to "+y buffer.
nnoremap <silent>cc ggVGg_"+y

" Copy visual selection to "+y buffer.
vnoremap <silent>cc "+y

" Paste
nnoremap <silent><leader>cv "+p

" Delete line
map - dd

" verse lookup.
nnoremap gk 0mMvg_"ky :exec "r!kjv  -b -d -w 65" getreg("k")<cr>

" PlugLookup 
nnoremap <silent> gx    :call PlugLookup(expand("<cWORD>"))<cr>
xnoremap <silent> gx "gy:call PlugLookup(@g)<cr>gv

" Toggle [i]nvisible characters
nnoremap <leader>i :set list!<cr>

" Select (charwise) the contents of the current line, excluding indentation.
nnoremap vv ^vg_

" Select entire buffer
nnoremap vaa ggvGg_
nnoremap Vaa ggVG

" Easier linewise reselection of what you just pasted.
nnoremap <leader>V V`]

" Make only the current window visible.
nnoremap <silent> <leader>oo :only<cr>

" Markdown highlights and indentation.
vmap gs S*v)3>

" Toggle search results
noremap <silent><leader><space> :set hlsearch!<CR>

" Source lines
vnoremap <leader>S y:@"<CR>
nnoremap <leader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>

" Remove trailing whitespace.
nnoremap <leader>ww mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Remove Windoz line endings.
nnoremap <leader>wr :%s/\r//g<cr>

" Resize buffers: Make em bigger or smaller.
map <silent><a-h> :vertical resize -1<cr>
map <silent><a-j> :resize +1<cr>
map <silent><a-k> :resize -1<cr>
map <silent><a-l> :vertical resize +1<cr>

" Traditional FZF
nnoremap <silent> <leader>ff :FZF<CR>
nnoremap <silent> <leader>fg :FZF ~/git/<CR>
nnoremap <silent> <leader>fv :FZF ~/git/vim/<CR>

" Wiki.wim FZF
nnoremap <silent> <leader>fw :WikiFzfPages<cr>

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Join an entire paragraph
nnoremap <leader>J myvipJ`ygq<CR>

" Fugitive keybindings.
nnoremap <leader>gp :Git push<cr>
nnoremap <leader>gc :Git commit<cr>
nnoremap <leader>gh :silent vert bo help fugitive<cr>
nnoremap <leader>gl :Git log<cr>
nnoremap <leader>gP :Git pull<cr>
nnoremap <leader>gs :G<cr>gg<c-n><c-n>
nnoremap <leader>gD :Gvdiff<cr>

" Update and upgrade vim-plug.
command! PU PlugUpdate |
       \    PlugUpgrade

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
" {{{ Your next experiment goes here. 



" -------------------------------------------------------------------------- }}}
