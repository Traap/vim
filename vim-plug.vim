" Tell Vim where our plugin manager is located.
call plug#begin('~/.vim/bundle')

" Finders
Plug 'ivalkeen/nerdtree-execute'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'dkprice/vim-easygrep'
Plug 'tpope/vim-vinegar'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" Buffers
Plug 'moll/vim-bbye'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'vim-utils/vim-most-minimal-folds'
Plug 'Traap/vim-ide'

" Git
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/gitignore'
" Plug 'Traap/github-issues.vim'

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

" Command-line fuzzy finder and ack
if has('unix')
  if has('nvim')
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
    Plug 'junegunn/fzf.vim'
    Plug 'mileszs/ack.vim'
  else
    Plug 'ctrlpvim/ctrlp.vim'
  endif
endif

Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'tmux-plugins/vim-tmux-focus-events'
" Tmux

" iTerm2
if has('macunix')
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
Plug 'luochen1990/rainbow'
Plug 'chriskempson/base16-vim'
Plug 'mechatroner/rainbow_csv'

" LaTeX
Plug 'lervag/vimtex'

" Checkers (Lint, Syntax, etc.)
if has('nvim')
  Plug 'neomake/neomake'
else
  Plug 'vim-syntastic/syntastic'
endif
Plug 'vim-syntastic/syntastic'

" Dispatchers
Plug 'tpope/vim-dispatch'

" Help
Plug 'Traap/vim-helptags'

Plug 'beloglazov/vim-online-thesaurus'
Plug 'vim-utils/vim-man'

" Clang
if $HOSTNAME == "Stooges"
  Plug 'rhysd/vim-clang-format'
  Plug 'kana/vim-operator-user'
  " Java
  Plug 'tpope/vim-classpath'
endif

" C#
" Plug 'OrangeT/vim-csharp'

" Grammar
" May not work with linux.  Requires JAVA.
" Plug 'rhysd/vim-grammarous'

" Ruby
Plug 'tpope/vim-endwise'
Plug 'ngmy/vim-rubocop'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rake'
Plug 'thoughtbot/vim-rspec'
" Plug 'ecomba/vim-ruby-refactoring'

" Very slow.  Probably not configured correctly.
" Plug 'tpope/vim-bundler'

" Very slow.
" Plug 'tpope/vim-projectionist'

" Operating system helpers
Plug 'tpope/vim-eunuch'

" Read Unix man pages...
" Plug 'jez/vim-superman'

" Outlines with Check-Boxes.
Plug 'vimoutliner/vimoutliner'

" Experiments ... not sure if I'll keep these plugins. 
" Ranger ... woot woot
Plug 'francoiscabrol/ranger.vim'

" Must be listed last.
Plug 'ryanoasis/vim-devicons'
call plug#end()
