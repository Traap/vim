" Tell Vim where our plugin manager is located.
source  ~/.vim/autoload/vim-plug/plug.vim
runtime ~/.vim/autoload/vim-plug/plug.vim

" Plugin
call plug#begin('~/.vim/bundle')

" Finders
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ivalkeen/nerdtree-execute'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'haya14busa/incsearch.vim'

" Buffers
Plug 'christoomey/vim-system-copy'
Plug 'moll/vim-bbye'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'vim-utils/vim-most-minimal-folds'
Plug 'tkhoa2711/vim-togglenumber'
Plug 'Traap/vim-ide'

" Git
Plug 'int3/vim-extradite'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'vim-scripts/gitignore'
"Plug 'jaxbot/github-issues.vim'

" Bars, panels and files
Plug 'bling/vim-airline'

" Text manipulation
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'traap/vim-dragvisuals'
Plug 'junegunn/vim-easy-align'

" Tmux 
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'tmux-plugins/vim-tmux-focus-events'

" iTerm2
if has('maxunix')
  Plug 'sjl/vitality.vim'
endif

" Haskell
if $HOSTNAME == "Stooges"
  Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
  Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
  Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' }
  Plug 'mpickering/hlint-refactor-vim', { 'for': 'haskell' }
  Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
endif

" Colors
Plug 'chriskempson/base16-vim'
Plug 'luochen1990/rainbow'

" LaTeX
Plug 'lervag/vimtex'

" Checkers (Lint, Syntax, etc.)
Plug 'vim-syntastic/syntastic'

" Dispatchers
Plug 'tpope/vim-dispatch'
" Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" Plug 'Shougo/vimshell.vim'

" YAML
Plug 'mkasa/neco-yaml-kwalify-schema'
" Plug 'Shougo/neocomplete.vim'
Plug 'sunaku/kwalify'

" Help
Plug 'Traap/vim-helptags'
Plug 'beloglazov/vim-online-thesaurus'
Plug 'vim-utils/vim-man'

" Clang
Plug 'rhysd/vim-clang-format'
Plug 'kana/vim-operator-user'

" Java
Plug 'tpope/vim-classpath'

" Grammar
Plug 'rhysd/vim-grammarous'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'

" Operating system helpers 
Plug 'tpope/vim-eunuch'

" Read Unix man pages...
Plug 'jez/vim-superman'

" Experimental
Plug 'junegunn/vim-journal'
call plug#end()
