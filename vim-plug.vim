" Tell Vim where our plugin manager is located.
call plug#begin('~/.vim/bundle')

" Finders
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ivalkeen/nerdtree-execute'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'haya14busa/incsearch.vim'
Plug 'dkprice/vim-easygrep'
Plug 'tpope/vim-vinegar'

" Buffers
" Plug 'christoomey/vim-system-copy'
Plug 'moll/vim-bbye'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'vim-utils/vim-most-minimal-folds'
Plug 'Traap/vim-ide'

" Git
Plug 'int3/vim-extradite'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/gitignore'
"Plug 'Traap/github-issues.vim'

" Bars, panels and files
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Text manipulation
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sensible'
Plug 'Traap/vim-dragvisuals'
Plug 'junegunn/vim-easy-align'

" Command-line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install -all'}
Plug 'junegunn/fzf.vim'

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
  Plug '}Twinside/vim-hoogle', { 'for': 'haskell' }
  Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
  Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' }
  Plug 'mpickering/hlint-refactor-vim', { 'for': 'haskell' }
  Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
endif

" Colors
Plug 'luochen1990/rainbow'
Plug 'chriskempson/base16-vim'
Plug 'joeytwiddle/vim-diff-traffic-lights-colors'

" LaTeX
Plug 'lervag/vimtex'

" Checkers (Lint, Syntax, etc.)
" Plug 'valloric/youcompleteme'
Plug 'vim-syntastic/syntastic'
	" Very slow.  Pr'chriskempson/base16-vim'obably not configured correctly.

" Dispatchers
Plug 'tpope/vim-dispatch'
" Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" YAML
if has('lua')
  Plug 'Shougo/neocomplete.vim'
  " Plug 'mkasa/neco-yaml-kwalify-schema'
  " Plug 'sunaku/kwalify
endif

" Help
Plug 'Traap/vim-helptags'
" Plug 'beloglazov/vim-online-thesaurus'
Plug 'vim-utils/vim-man'

" Clang
if $HOSTNAME == "Stooges"
  Plug 'rhysd/vim-clang-format'
  Plug 'kana/vim-operator-user'
  Plug 'chriskempson/base16-vim'
  " Java
  Plug 'tpope/vim-classpath'
endif

" C#
" Plug 'OrangeT/vim-csharp'

" Grammar
Plug 'rhysd/vim-grammarous'

" Ruby
Plug 'tpope/vim-endwise'
Plug 'ngmy/vim-rubocop'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rake'
Plug 'thoughtbot/vim-rspec'
Plug 'ecomba/vim-ruby-refactoring'
" Plug 'tpope/vim-bundler'
" Plug 'tpope/vim-projectionist'
	" Very slow.  Probably not configured correctly.

" Operating system helpers
Plug 'tpope/vim-eunuch'

" Read Unix man pages...
Plug 'jez/vim-superman'

" Outlines with Check-Boxes.
Plug 'vimoutliner/vimoutliner'

" Dash search APIs wiht Dash.app
Plug 'rizzatti/dash.vim'

call plug#end()
