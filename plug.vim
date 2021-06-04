" {{{ Archlinux and Windows Subsystem for Linux check 

let g:os_arch = trim(system("cat /etc/issue | rg 'Arch Linux' -c"))
let g:os_wsl  = (substitute(system('uname -r'), '\n', '', '') =~ 'Microsoft') ||
              \ (substitute(system('uname -r'), '\n', '', '') =~ 'WSL2') 
             

" -------------------------------------------------------------------------- }}}
" {{{ Tell vim-plug where out plugins are located. 

call plug#begin('~/.vim/bundle')

" -------------------------------------------------------------------------- }}}
" {{{ Preamble ... One Ring to Rule them All!

" vimtex needs to know default file format.
let g:tex_flavor = 'latex'

" -------------------------------------------------------------------------- }}}
" {{{ vim or neovim community plugins. 

Plug 'ajh17/VimCompletesMe'
Plug 'aklt/plantuml-syntax'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'dpelle/vim-LanguageTool'
Plug 'ecomba/vim-ruby-refactoring', {'branch': 'main'}
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/vim-asterisk'
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
Plug 'mhinz/vim-rfc'
Plug 'ngmy/vim-rubocop'
Plug 'rbgrouleff/bclose.vim'
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
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/gitignore'
"Plug 'vim-utils/vim-man'
Plug 'vim-utils/vim-most-minimal-folds'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'will133/vim-dirdiff'

" 2021-03-25 Neovim use buildin lsp. YouCompleteMe: vim candidate only.
" Plug 'ycm-core/YouCompleteMe'

Plug 'PProvost/vim-ps1'

" -------------------------------------------------------------------------- }}}
" {{{ macunix plugins

if has('macunix')
  Plug 'sjl/vitality.vim'
endif

" -------------------------------------------------------------------------- }}}
" {{{ Vim 8 or greater

"  2021-03-25 Eenabled to check Microsoft Termial display issues. 
if v:version >= 800
"  Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

" -------------------------------------------------------------------------- }}}
" {{{ Lighten the load when using msys (Git Bash). 

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

" -------------------------------------------------------------------------- }}}
" {{{ neovim only plugins

if has('nvim')
  Plug 'glacambre/firenvim', {'do': {_ -> firenvim#install(27)}}
  Plug 'glepnir/galaxyline.nvim'
  Plug 'hrsh7th/nvim-compe'
  Plug 'kabouzeid/nvim-lspinstall'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'neovim/nvim-lspconfig'
  Plug 'norcalli/snippets.nvim'
  Plug 'npxbr/glow.nvim', {'do': ':GlowInstall'}
  Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/plenary.nvim',
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/popup.nvim',
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  Plug 'nvim-telescope/telescope-media-files.nvim',
  Plug 'nvim-telescope/telescope-snippets.nvim',
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'tjdevries/nlua.nvim'
  Plug 'sbdchd/neoformat'
  Plug 'tweekmonster/startuptime.vim'
else
  " Vim only plugsins
  Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
  Plug 'chriskempson/base16-vim'
  Plug 'itchyny/lightline.vim'
  Plug 'ivalkeen/nerdtree-execute', {'on': 'NERDTreeToggle'}
  Plug 'ryanoasis/vim-devicons'
  " Do my stuff last. :)
  Plug 'Traap/vim-bundle-colors'
  Plug 'Traap/vim-bundle-keybindings'
  Plug 'Traap/vim-bundle-nerdtree'
  Plug 'Traap/vim-bundle-settings'
  Plug 'Traap/vim-bundle-terminal'
  Plug 'Traap/vim-bundle-vimtex'
  Plug 'Traap/vim-bundle-vimwiki'
endif

" -------------------------------------------------------------------------- }}}
" {{{ Begin my bundles

" My goal is to customize a community plugin after it has been loaded.
Plug 'Traap/vim-bundle-abbreviate'

" Disabled 2021-02-15
" Plug 'Traap/vim-bundle-ale'
Plug 'Traap/vim-bundle-autocmd'

" 2021-03-25 Disabled to check a wsl2 / terminal display issue.
" Plug 'Traap/vim-bundle-coc'

Plug 'Traap/vim-bundle-dispatch'
Plug 'Traap/vim-bundle-fzf'
Plug 'Traap/vim-bundle-github-issues'
Plug 'Traap/vim-bundle-grammarous'
Plug 'Traap/vim-bundle-haskell'
Plug 'Traap/vim-bundle-lmgtfy'
Plug 'Traap/vim-bundle-macunix'
Plug 'Traap/vim-bundle-plantuml'
Plug 'Traap/vim-bundle-rainbow'
Plug 'Traap/vim-bundle-resume'
Plug 'Traap/vim-bundle-tmux-runner'
Plug 'Traap/vim-bundle-wildignore'
Plug 'Traap/vim-bundle-wipeout'

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
  echom "                         wsl: " . has('wsl')
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

if !has('nvim')
  let g:lightline = {
        \ 'colorscheme': 'jellybeans',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'FugitiveHead'
        \ },
        \ } 
endif

" -------------------------------------------------------------------------- }}}
" {{{ Windoz 32 or Windoz 64 check.

if !has('nvim')
   set termguicolors
endif

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
" {{{ Your next experiment goes here.

if has('nvim')
  lua require('config')
endif 

" -------------------------------------------------------------------------- }}}
