" {{{ Tell Vim where our plugin manager is located.

call plug#begin('~/.vim/bundle')

" -------------------------------------------------------------------------- }}}
" {{{ Begin community plugins

Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'

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
set numberwidth=2
set path+=**
"set relativenumber
set timeoutlen=500

" -------------------------------------------------------------------------- }}}
" {{{ Minimal settings specific to nvim plugins.

lua <<EOF
require('telescope').setup {
  defaults = {
    shorten_path = false
  }
}
EOF

nnoremap <Leader>gf <cmd>lua require'telescope.builtin'.git_files{}<cr>
nnoremap <Leader>ff <cmd>lua require'telescope.builtin'.find_files{}<cr>
nnoremap <silent>gr <cmd>lua require'telescope.builtin'.lsp_references { shorten_path = true }<cr>

" -------------------------------------------------------------------------- }}}
" {{{ Indicate vimplug installation is done.

if g:not_finish_vimplug == "yes"
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" -------------------------------------------------------------------------- }}}
