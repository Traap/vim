" {{{ Tell Vim where our plugin manager is located.
call plug#begin('~/.vim/bundle')
" -------------------------------------------------------------------------- }}}
" {{{ Finders 
Plug 'ivalkeen/nerdtree-execute', {'on': 'NERDTreeToggle'}
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'dkprice/vim-easygrep'
Plug 'tpope/vim-vinegar'
" -------------------------------------------------------------------------- }}}
" {{{ Language Server Protocol 
if v:version >= 800
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif
" -------------------------------------------------------------------------- }}}
" {{{ Buffers
Plug 'moll/vim-bbye'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'vim-utils/vim-most-minimal-folds'
Plug 'Traap/vim-ide'
Plug 'will133/vim-dirdiff'
Plug 'bbill/undotree'
" -------------------------------------------------------------------------- }}}
" {{{ Git 
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'vim-scripts/gitignore'
if has("python")
  Plug 'Traap/github-issues.vim'
endif
" -------------------------------------------------------------------------- }}}
" {{{ Bars, panels and files
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" -------------------------------------------------------------------------- }}}
" {{{ Text manipulation
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'Traap/vim-dragvisuals'
Plug 'junegunn/vim-easy-align'
" -------------------------------------------------------------------------- }}}
" {{{ Command-line fuzzy finder and ack
if has('unix')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
  Plug 'junegunn/fzf.vim'
  Plug 'mileszs/ack.vim'
endif
" -------------------------------------------------------------------------- }}}
" {{{ Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'tmux-plugins/vim-tmux-focus-events'
" -------------------------------------------------------------------------- }}}
" {{{ iTerm2
if has('macunix')
  Plug 'sjl/vitality.vim'
endif
" -------------------------------------------------------------------------- }}}
" {{{ Colors
Plug 'luochen1990/rainbow'
Plug 'chriskempson/base16-vim'
Plug 'mechatroner/rainbow_csv'
" -------------------------------------------------------------------------- }}}
" {{{ LaTeX
Plug 'lervag/vimtex'
" -------------------------------------------------------------------------- }}}
" {{{ Checkers (Lint, Syntax, etc.)
Plug 'dense-analysis/ale'
"Plug 'neomake/neomake'
" -------------------------------------------------------------------------- }}}
" {{{ Dispatchers
Plug 'tpope/vim-dispatch'
" -------------------------------------------------------------------------- }}}
" {{{ Help
Plug 'Traap/vim-helptags'
Plug 'beloglazov/vim-online-thesaurus'
Plug 'vim-utils/vim-man'
" -------------------------------------------------------------------------- }}}
" {{{ Clang
if $HOSTNAME == "Stooges"
  Plug 'rhysd/vim-clang-format'
  Plug 'kana/vim-operator-user'
  " Java
  Plug 'tpope/vim-classpath'
endif

" -------------------------------------------------------------------------- }}}
" {{{ C#
" Plug 'OrangeT/vim-csharp'
" -------------------------------------------------------------------------- }}}
" {{{ Grammar 
" LanguageTool
" Requires JAVA.
" Plug 'rhysd/vim-grammarous'
" Plug 'dpelle/vim-LanguageTool'
" -------------------------------------------------------------------------- }}}
" {{{ Ruby
Plug 'ecomba/vim-ruby-refactoring'
Plug 'ngmy/vim-rubocop'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/gem-browse'
Plug 'tpope/vim-bundler'        " Slow.  Check configuration.
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-projectionist'  "Slow. Check configuraiton.
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'vim-ruby/vim-ruby'
" -------------------------------------------------------------------------- }}}
" {{{ Operating system helpers
Plug 'tpope/vim-eunuch'
" Read Unix man pages...
Plug 'jez/vim-superman'
" -------------------------------------------------------------------------- }}}
" {{{ Outlines with Check-Boxes, and journaling.
Plug 'vimoutliner/vimoutliner'
Plug 'junegunn/vim-journal'
" -------------------------------------------------------------------------- }}}
" {{{ Vim Completes me.
Plug 'ajh17/VimCompletesMe'
" -------------------------------------------------------------------------- }}}
" {{{ Experiments ... not sure if I'll keep these plugins. 
" Ranger ... woot woot
Plug 'francoiscabrol/ranger.vim'
if has('nvim')
  Plug 'rbgrouleff/bclose.vim'
endif
" -------------------------------------------------------------------------- }}}
" {{{ Must be listed last plugin.
Plug 'ryanoasis/vim-devicons'
" -------------------------------------------------------------------------- }}}
" {{{ Done loading plugins.
call plug#end()
" -------------------------------------------------------------------------- }}}
" {{{ Install plugins. 
if g:not_finish_vimplug == "yes"
  autocmd VimEnter * PlugInstall
endif
" -------------------------------------------------------------------------- }}}
