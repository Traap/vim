" {{{ Tell Vim where our plugin manager is located.

call plug#begin('~/.vim/bundle')

" -------------------------------------------------------------------------- }}}
" {{{ Begin community plugins

Plug 'ajh17/VimCompletesMe'
Plug 'beloglazov/vim-online-thesaurus'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
"Plug 'dense-analysis/ale'
Plug 'dkprice/vim-easygrep'
Plug 'dpelle/vim-LanguageTool'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'ivalkeen/nerdtree-execute', {'on': 'NERDTreeToggle'}
Plug 'jez/vim-superman'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-journal'
Plug 'lervag/vimtex'
Plug 'luochen1990/rainbow'
Plug 'mattn/calendar-vim'
Plug 'mbbill/undotree'
Plug 'mechatroner/rainbow_csv'
Plug 'moll/vim-bbye'
Plug 'ngmy/vim-rubocop'
Plug 'rhysd/vim-grammarous'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'thoughtbot/vim-rspec'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/gem-browse'
Plug 'Traap/vim-dragvisuals'
Plug 'Traap/vim-helptags'
Plug 'Traap/vim-ide'
Plug 'lervag/wiki.vim'
Plug 'lervag/wiki-ft.vim'
" Plug 'Traap/vimwiki'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
" Plug 'vim-scripts/bufexplorer.zip'
Plug 'vim-scripts/gitignore'
Plug 'vim-utils/vim-man'
Plug 'vim-utils/vim-most-minimal-folds'
Plug 'will133/vim-dirdiff'
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
Plug 'francoiscabrol/ranger.vim'

if v:version >= 800
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

if has('python')
  " Plug 'Traap/github-issues.vim'
endif

if has('macunix')
  Plug 'sjl/vitality.vim'
endif

if has('nvim')
  Plug 'rbgrouleff/bclose.vim'
endif

if has('unix')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
  Plug 'junegunn/fzf.vim'
  Plug 'mileszs/ack.vim'
endif

if !has('windows')
  Plug 'tpope/vim-bundler'        " Slow on msys2
  Plug 'tpope/vim-projectionist'   "Slow on msys2
endif

" End community plugins ---------------------------------------------------- }}}
" {{{ Begin my bundles

" Bundle specific settings
Plug 'Traap/vim-bundle-abbreviate'
Plug 'Traap/vim-bundle-ale'
Plug 'Traap/vim-bundle-airline'
Plug 'Traap/vim-bundle-autocmd'
Plug 'Traap/vim-bundle-coc'
Plug 'Traap/vim-bundle-fzf'
Plug 'Traap/vim-bundle-dispatch'
Plug 'Traap/vim-bundle-github-issues'
Plug 'Traap/vim-bundle-grammarous'
Plug 'Traap/vim-bundle-haskell'
Plug 'Traap/vim-bundle-lmgtfy'
Plug 'Traap/vim-bundle-macunix'
Plug 'Traap/vim-bundle-nerdtree'
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

if g:not_finish_vimplug == "yes"
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" -------------------------------------------------------------------------- }}}
" {{{ Volatile experiments.  You have been warned.
"
" This sections contains Vim snippets that maybe deleted my next push, or mature
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
" {{{ wiki.vim experiments.

let g:wiki_root = $HOME.'/git/wiki'
let g:wiki_journal = {
  \ 'name': 'journal',
  \ 'frequency': 'daily',
  \ 'date_format': {
  \   'daily' : '%Y-%m-%d',
  \   'weekly' : '%Y_w%V',
  \   'monthly' : '%Y_m%m',
  \ },
  \}
let g:wiki_use_calendar = 1

" -------------------------------------------------------------------------- }}}
" {{{ calendar.vim expierments

" Hook for calendar.vim
if g:wiki_use_calendar
  let g:calendar_mark = 'right'
  let g:calendar_navi = 'both'
  let g:calendar_diary = $HOME.'/git/wiki/journal'
  let g:calendar_filetype = 'wiki'
  let g:calendar_diary_extension = '.wiki'
  let g:calendar_action = 'MyCalAction'
  let g:calendar_sign = 'MyCalSign'
  map <LocalLeader>cv :call ToggleCalendar()<cr>

  function! ToggleCalendar()
    execute ":CalendarVR"
    if exists("g:calendar_open")
      if g:calendar_open == 1
        execute "q"
        unlet g:calendar_open
      else
        g:calendar_open = 1
      end
    else
      let g:calendar_open = 1
    end
  endfunction

  " Add zero prefix to a number
  function! s:prefix_zero(num) abort
    if a:num < 10
      return '0'.a:num
    endif
    return a:num
  endfunction

  " Build journal file name.
  function! s:build_filename(day,month,year) abort
    " day   : day you actioned
    " month : month you actioned
    " year  : year you actioned
    let day = s:prefix_zero(a:day)
    let month = s:prefix_zero(a:month)
    let sfile = a:year.'-'.month.'-'.day
    return sfile
  endfunction

  function MyCalAction(day,month,year,week,dir)
    " day   : day you actioned
    " month : month you actioned
    " year  : year you actioned
    " week  : day of week (Mo=1 ... Su=7)
    " dir   : direction of calendar
    let sfile = s:build_filename(a:day, a:month, a:year)

    if winnr('#') == 0
      if a:dir ==? 'V'
        vsplit
      else
        split
      endif
    else
      wincmd p
      if !&hidden && &modified
        new
      endif
    endif

    call wiki#journal#make_note(sfile)
  endfunction

  function MyCalSign(day,month,year)
    " day   : day you actioned
    " month : month you actioned
    " year  : year you actioned
    let sfile = s:build_filename(a:day, a:month, a:year)
    return filereadable(expand(sfile))
  endfunction
endif

" -------------------------------------------------------------------------- }}}
" -------------------------------------------------------------------------- }}}
