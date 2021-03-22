" {{{ Tell vim-plug where out plugins are located. 

call plug#begin('~/.vim/bundle')

" -------------------------------------------------------------------------- }}}
" {{{ Are we running WSL (windows Subsystem for Linux) or Arch Linux
"
" uname prints system information.  The information below was captured while
" running Ubuntu 18.04 from WSL2.
"
" uname        : Linux:
"     kernel -s: Linux:
"      node  -n: USLKZ6QQ6WT2:
"   release  -r: 4.4.0-18362-Microsoft:
"   version  -v: #476-Microsoft Fri Nov 01 16:53:00 PST 2019:
"   machine  -m: x86_64:
" processor  -p: x86_64:
"  hardware  -i: x86_64:
"        OS  -o: GNU/Linux

" Establish defaults
let g:os_wsl = 0
let g:os_arch = 0

if has('unix') && has('nvim') && has('wsl')
  " This check uses build-in nvim capabilities.
  let g:os_wsl = 1
elseif has('unix')
  " This check pulls information from uname.
  let g:os_wsl  = (substitute(system('uname -r'), '\n', '', '') =~ 'Microsoft')
  let g:os_arch = (substitute(system('uname -r'), '\n', '', '') =~ 'arch')
endif

" -------------------------------------------------------------------------- }}}
" {{{ Preamble ... One Ring to Rule them All!

" Plugins loaded define global values needed by a community plugin.

Plug 'Traap/vim-bundle-vimwiki'

" vimtex needs to know default file format.
let g:tex_flavor = 'latex'

" -------------------------------------------------------------------------- }}}
" {{{ Begin community plugins

Plug 'ajh17/VimCompletesMe'
Plug 'aklt/plantuml-syntax'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'dpelle/vim-LanguageTool'
Plug 'ecomba/vim-ruby-refactoring', {'branch': 'main'}
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'ivalkeen/nerdtree-execute', {'on': 'NERDTreeToggle'}
Plug 'jremmen/vim-ripgrep'
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
Plug 'mileszs/ack.vim'
Plug 'moll/vim-bbye'
Plug 'ngmy/vim-rubocop'
Plug 'rhysd/vim-grammarous'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'Traap/vim-dragvisuals'
Plug 'Traap/vim-helptags'
Plug 'Traap/vim-ide'
Plug 'tyru/open-browser.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/gitignore'
Plug 'vim-utils/vim-most-minimal-folds'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'will133/vim-dirdiff'
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
" Plug 'ycm-core/YouCompleteMe'
Plug 'PProvost/vim-ps1'
" Plug 'plasticboy/vim-markdown'

if v:version >= 800
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

if has('macunix')
  Plug 'sjl/vitality.vim'
endif

" Lighten the load when using mingw64
if !exists("$MSYSTEM")
  Plug 'dbeniamine/cheat.sh-vim'
  Plug 'RishabhRD/nvim-cheat.sh'
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'tpope/gem-browse'
  Plug 'tpope/vim-bundler'
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-rake'
  Plug 'tpope/vim-rbenv'
endif

if has('nvim')
  Plug 'glacambre/firenvim', {'do': {_ -> firenvim#install(27)}}
  Plug 'rbgrouleff/bclose.vim'
endif

" End community plugins ---------------------------------------------------- }}}
" {{{ Begin my bundles

" My goal is to customize a community plugin after it has been loaded.
Plug 'Traap/vim-bundle-abbreviate'
Plug 'Traap/vim-bundle-airline'

" Disabled 2021-02-15
" Plug 'Traap/vim-bundle-ale'
Plug 'Traap/vim-bundle-autocmd'
Plug 'Traap/vim-bundle-coc'
Plug 'Traap/vim-bundle-dispatch'
Plug 'Traap/vim-bundle-fzf'
Plug 'Traap/vim-bundle-github-issues'
Plug 'Traap/vim-bundle-grammarous'
Plug 'Traap/vim-bundle-haskell'
Plug 'Traap/vim-bundle-lmgtfy'
Plug 'Traap/vim-bundle-macunix'
Plug 'Traap/vim-bundle-nerdtree'
Plug 'Traap/vim-bundle-plantuml'
Plug 'Traap/vim-bundle-rainbow'
Plug 'Traap/vim-bundle-resume'
Plug 'Traap/vim-bundle-settings'
Plug 'Traap/vim-bundle-terminal'
Plug 'Traap/vim-bundle-tmux-runner'
Plug 'Traap/vim-bundle-vimtex'
Plug 'Traap/vim-bundle-wildignore'
Plug 'Traap/vim-bundle-wipeout'

" End my bundles ----------------------------------------------------------- }}}
" {{{ Now order matters.

Plug 'Traap/vim-bundle-colors'
Plug 'Traap/vim-bundle-keybindings'
Plug 'ryanoasis/vim-devicons'

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
" {{{ Your next experiment goes here.



" -------------------------------------------------------------------------- }}}
" -------------------------------------------------------------------------- }}}
