" {{{ Tell Vim where our plugin manager is located.

call plug#begin('~/.vim/bundle')

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
Plug 'francoiscabrol/ranger.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'ivalkeen/nerdtree-execute', {'on': 'NERDTreeToggle'}
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kevinoid/vim-jsonc'
Plug 'kovetskiy/sxhkd-vim'
Plug 'leafgarland/typescript-vim'
Plug 'lervag/vimtex'
Plug 'luochen1990/rainbow'
Plug 'mattn/calendar-vim'
Plug 'mbbill/undotree'
Plug 'mechatroner/rainbow_csv'
Plug 'moll/vim-bbye'
Plug 'ngmy/vim-rubocop'
Plug 'rhysd/vim-grammarous'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'thoughtbot/vim-rspec'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/gem-browse'
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
Plug 'Traap/vim-dragvisuals'
Plug 'Traap/vim-helptags'
Plug 'Traap/vim-ide'
Plug 'Traap/vimwiki', {'branch': 'dev'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/gitignore'
Plug 'vim-utils/vim-most-minimal-folds'
Plug 'will133/vim-dirdiff'
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}


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

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

Plug 'tpope/vim-bundler'
Plug 'tpope/vim-projectionist'

Plug 'weirongxu/plantuml-previewer.vim'
Plug 'tyru/open-browser.vim'

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

" {{{ PlantUml Hack

function! InitUmlSettings()

  let g:puml_viewer_open = 0 let g:puml_wsl = (substitute(system('uname -r'),
  '\n', '', '') =~ 'Microsoft')

  if g:puml_wsl || has("win32unix") let g:puml_viewer = 'SumatraPDF.exe' else
    let g:puml_viewer = 'okular' endif

endfunction

function! RunPumlJavaCommand()

  " Example: !java -Djava.awt.headless=true "foo.puml"
  let s:puml_args = '-Djava.awt.headless=true'

  let s:puml_jar = '~/git/plantuml/plantuml.jar'

  let g:puml_cmd = '!java ' . s:puml_args .  \ ' -jar ' . s:puml_jar .  \ ' "'
  . expand('%') . '"'

  silent execute g:puml_cmd

endfunction

function! RunPumlViewCommand()

  " Example: !okular "foo.png" 2>/dev/null&
  if !g:puml_viewer_open

    let g:puml_viewer_open = 1

    let g:puml_view = '!' . g:puml_viewer .  \ ' "'. expand('%<') . '.png"'
    .  \ ' 2>/dev/null&' silent execute g:puml_view

  endif

endfunction

function! GenerateUmlDiagram() call RunPumlJavaCommand() call
  RunPumlViewCommand() endfunction

function! ClearUmlLaunchFlag() let g:puml_viewer_open = 0 endfunction

augroup plantuml_group autocmd!  autocmd BufRead,BufNewFile *.puml,*.wsd :call
  InitUmlSettings() autocmd BufWritePost       *.puml,*.wsd :call
  GenerateUmlDiagram() autocmd BufLeave           *.puml,*.wsd :call
  ClearUmlLaunchFlag() augroup END

" -------------------------------------------------------------------------- }}}
" {{{ TogglePostBuffer experiments. 

let g:post_buffer_on=0

function! TogglePostBuffer() if g:post_buffer_on let g:post_buffer_on=0 let
  &columns=g:post_buffer_columns let &textwidth=g:post_buffer_textwidth set
  nobreakindent else let g:post_buffer_on=1 let g:post_buffer_columns=&columns
  let g:post_buffer_textwidth=&textwidth set breakindent set
  breakindentopt=shift:2 set columns=50 set textwidth=0 endif endfunction

" -------------------------------------------------------------------------- }}}
" {{{ nvim has the last words.

if has('nvim') let g:man_hardwrap=1 let g:clipboard = { \   'name':
  'myClipboard', \   'copy': { \      '+': 'xsel --nodetach -i -b', \      '*':
  'xsel --nodetach -i -b', \    }, \   'paste': { \      '+': 'xsel -o -b',
        \      '*': 'xsel -o -b', \   }, \   'cache_enabled': 1, \ } endif

function! FixTerminal()
  if has('linux')
    set termguicolors
    colorscheme base16-chalk
    autocmd OptionSet guicursor noautocmd set guicursor=
  endif
endfunction
call FixTerminal()

" -------------------------------------------------------------------------- }}}
" -------------------------------------------------------------------------- }}}
