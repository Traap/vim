" {{{ Archlinux and Windows Subsystem for Linux check

let g:os_arch = trim(system("cat /etc/issue | rg 'Arch Linux' -c"))
let g:os_wsl = !exists(getenv('WSL_DISTRO_NAME'))

" -------------------------------------------------------------------------- }}}
" {{{ Tell vim-plug where out plugins are located.

call plug#begin('~/.vim/bundle')

" -------------------------------------------------------------------------- }}}
" {{{ Preamble ... One Ring to Rule them All!

" vimtex needs to know default file format.
let g:tex_flavor = 'latex'

" -------------------------------------------------------------------------- }}}
" {{{ vim

Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
Plug 'ajh17/VimCompletesMe'
Plug 'aklt/plantuml-syntax'
" Plug 'chriskempson/base16-vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'dkarter/bullets.vim'
Plug 'dpelle/vim-LanguageTool'
Plug 'ecomba/vim-ruby-refactoring', {'branch': 'main'}
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'itchyny/lightline.vim'
Plug 'ivalkeen/nerdtree-execute', {'on': 'NERDTreeToggle'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kevinoid/vim-jsonc'
Plug 'kovetskiy/sxhkd-vim'
Plug 'leafgarland/typescript-vim'
Plug 'lervag/vimtex'
Plug 'lervag/wiki-ft.vim'
Plug 'lervag/wiki.vim'
Plug 'luochen1990/rainbow'
Plug 'mbbill/undotree'
Plug 'mechatroner/rainbow_csv'
Plug 'mhinz/vim-rfc'
Plug 'mileszs/ack.vim'
Plug 'moll/vim-bbye'
Plug 'PProvost/vim-ps1'
Plug 'ngmy/vim-rubocop'
Plug 'rbgrouleff/bclose.vim'
Plug 'rhysd/vim-grammarous'
Plug 'rust-lang/rust.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'RishabhRD/nvim-cheat.sh'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'thoughtbot/vim-rspec'
Plug 'tmux-plugins/vim-tmux-focus-events'

Plug 'tpope/gem-browse'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

Plug 'tweekmonster/startuptime.vim'
Plug 'tyru/open-browser.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/gitignore'
Plug 'vim-utils/vim-man'
Plug 'vim-utils/vim-most-minimal-folds'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'will133/vim-dirdiff'

" -------------------------------------------------------------------------- }}}
" {{{ macunix plugins

if has('macunix')
  Plug 'sjl/vitality.vim'
endif

" -------------------------------------------------------------------------- }}}
" {{{ Begin my bundles

" My goal is to customize a community plugin after it has been loaded.
Plug 'Traap/vim-bundle-abbreviate'

Plug 'Traap/vim-bundle-autocmd'
Plug 'Traap/vim-bundle-dispatch'
Plug 'Traap/vim-bundle-fzf'
Plug 'Traap/vim-bundle-github-issues'
Plug 'Traap/vim-bundle-grammarous'
Plug 'Traap/vim-bundle-haskell'
Plug 'Traap/vim-bundle-lmgtfy'
Plug 'Traap/vim-bundle-nerdtree'
Plug 'Traap/vim-bundle-plantuml'
Plug 'Traap/vim-bundle-rainbow'
Plug 'Traap/vim-bundle-resume'
Plug 'Traap/vim-bundle-tmux-runner'
Plug 'Traap/vim-bundle-vimtex'
Plug 'Traap/vim-bundle-wiki.vim'
Plug 'Traap/vim-bundle-wildignore'
Plug 'Traap/vim-bundle-wipeout'
Plug 'Traap/vim-dragvisuals'
Plug 'Traap/vim-helptags'
Plug 'Traap/vim-ide'

" Last words.
" Plug 'Traap/vim-bundle-colors'
Plug 'Traap/vim-bundle-keybindings'
Plug 'Traap/vim-bundle-settings'
" Plug 'Traap/vim-bundle-terminal'


" -------------------------------------------------------------------------- }}}
" {{{ Done loading plugins.

call plug#end()

" -------------------------------------------------------------------------- }}}
" {{{ Indicate vimplug installation is done.

if g:traap_pluginstall
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" -------------------------------------------------------------------------- }}}
" {{{ Volatile Experiments.  You have been warned.
"
" These sections contain Vim snippets that maybe deleted my next push, or mature
" into a vim-bundle-xyz.

" {{{ TogglePostBuffer experiments.

let g:post_buffer_on=0

function! TogglePostBuffer()
  if g:post_buffer_on
    let g:post_buffer_on=0
    let &columns=g:post_buffer_columns
    let &textwidth=g:post_buffer_textwidth
    set nobreakindent
  else
    let g:post_buffer_on=1
    let g:post_buffer_columns=&columns
    let g:post_buffer_textwidth=&textwidth
    set breakindent
    set breakindentopt=shift:2
    set columns=50
    set textwidth=0
  endif
endfunction

" -------------------------------------------------------------------------- }}}
" {{{ echom debug information.

function! MyDebug()
  echom "g:vimtex_view_general_viewer: " . g:vimtex_view_general_viewer
  echom "                   g:os_arch: " . g:os_arch
  echom "                    g:os_wsl: " . g:os_wsl
  echom "                 gui_running: " . has('gui_running')
  echom "                       linux: " . has('linux')
  echom "                        unix: " . has('unix')
  echom "                      system: " . has('system')
  echom "               termguicolors: " . has('termguicolors')
  echom "                    terminal: " . has('terminal')
  echom "                    terminfo: " . has('terminfo')
  echom "                termresponse: " . has('termresponse')
  echom "                     tgetent: " . has('tgetent')
  echom "                   win32unix: " . has('win32unix')
  echom "                       win32: " . has('win32')
  echom "                       win64: " . has('win64')
endfunction

nnoremap <silent> ,md :call MyDebug()<cr>

" -------------------------------------------------------------------------- }}}
" {{{ Light line testing.

let g:lightline = {
      \ 'colorscheme': 'selenized_dark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" -------------------------------------------------------------------------- }}}
" {{{ ThePrimeagen : Clear registers

fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
    echo "Registers cleared."
endfun

" -------------------------------------------------------------------------- }}}
" {{{ Bullets

let g:bullets_enabled_file_types = [
    \ 'gitcommit',
    \ 'markdown',
    \ 'scratch',
    \ 'text',
    \ 'wiki'
    \]

" -------------------------------------------------------------------------- }}}
" {{{ Your next experiment goes here.

inoremap ;; <esc>
cnoremap ;; <esc>

" -------------------------------------------------------------------------- }}}
