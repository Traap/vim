" {{{ LEADER SECTION
let g:mapleader = ","
let maplocalleader = ","
set tm=2000                                   " Leader key timeout.
" LEADER SECTION END ------------------------------------------------------- }}}
" {{{ SETTINGS SECTION
" {{{ First things ...
" Set things that should come first.
filetype on
filetype plugin indent on
" -------------------------------------------------------------------------- }}}
" {{{ Alphabetical listing of things I set.
set autowrite
set complete=.,w,b,u,t,i,kspell
set cmdheight=1                               " Height of the command bar.
set encoding=utf-8
set fileformats=unix,mac,dos
set matchtime=3
set modelines=0
set mouse=a
set nocompatible
set norelativenumber
set notimeout
set path+=**
set ttimeoutlen=10
set ttyfast
set virtualedit=block
nnoremap Q <no>                               " Don't allow Ex mode.
" -------------------------------------------------------------------------- }}}
" {{{ Show trailing whitespaces
set nolist                                    " Show trailing whitespaces
if &listchars ==# 'eol:$'                     " But only interesting whitespace
  set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:-,nbsp:+
endif
" -------------------------------------------------------------------------- }}}
" {{{ Buffer visualization settings
set colorcolumn=+1
set foldmethod=marker
set laststatus=2
set lazyredraw
set linebreak
set number
set numberwidth=1
set showbreak=↪
set showcmd
set showmatch
set showmode
set sidescroll=1
set sidescrolloff=10
set splitbelow
set synmaxcol=800
set title
set virtualedit+=block
set visualbell
syntax on
" -------------------------------------------------------------------------- }}}
" {{{ Searching
set hlsearch                                     " Hilight previous search
set ignorecase                                   " Ignore case when searching
set smartcase                                    " Be smart about case.
" -------------------------------------------------------------------------- }}}
" {{{ The wild, wild, west
set wildignore+=*.DS_Store                       " OSX
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.orig                           " Merge resolution files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=migrations                       " Django migrations
set wildmode=list:longest,full                   " Tab0-complete files.
" -------------------------------------------------------------------------- }}}
" {{{ Tabs, spaces and wrapping
set expandtab
set formatoptions=qrn1t
set shiftround
set shiftwidth=2
set softtabstop=2
set tabstop=2
set textwidth=80
set wrap
" ---------------------------------------------------------------------------}}}
" {{{ Colors and options specific to vim, gvim, and nvim, and Osx or Linux.
" if
if filereadable(expand("~./vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

highlight ColorColumn ctermbg=18
highlight SignColumn ctermbg=18
set signcolumn=yes

" Use same color behind concealed unicode characters
hi clear Conceal
set t_Co=256

" Disable visual flash.
set t_vb=

" Use visible search hilighting
hi! link Visual Search

" Establish setting for gui and non-gui vim sessions.
if has("gui_running")

  " Set searching colors.
  hi search guifg=#ffffff guibg=#e5786d gui=none

  " Don't blink normal mode cursor
  set guicursor=n-v-c:block-Cursor
  set guicursor+=n-v-c:blinkon0

  set guioptions-=T
  set guioptions-=e
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L

  " Set fonts.
  if has("gui_macvim")
    set guifont=Menlo:h13
  else
    set guifont=DejaVu\ Sans\ Mono\ 10
  endif

  " Colors
  colorscheme base16-solarized-dark

  set guitablabel=%M\ %t
  hi Directory guifg=#8ac6f2

  hi Cursor guibg=cyan

  hi Folded guibg=black guifg=blue
else
  hi Folded ctermbg=black ctermfg=blue
  hi search ctermfg=white ctermbg=173 cterm=none
endif


" Set utf8 as standard encoding and en_US as the standard language
if !has('nvim')
  " Only set this for vim, since neovim is utf8 as default and setting it
  " causes problems when reloading the .vimrc configuration
  set encoding=utf8
endif

" disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color tmux and GNU screen.
" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
if &term =~ '256color'
  set t_ut=
endif
if exists('$TMUX')
  set term=screen-256color
endif

" Default background is dark.  Colors work well shell/vim and tmux/shell/vim.
set background=dark

" -------------------------------------------------------------------------- }}}
" {{{ Automatic spelling corrections.
iab developmetn development
iab liek     like
iab liekwise likewise
iab moer     more
iab pritn    print
iab retrun   return
iab teh      the
iab verboase verbose
" -------------------------------------------------------------------------  }}}
" {{{ Auto commands for filetypes.
autocmd BufRead,BufNewFile *.adoc,*adoci,*.txt,*.asciidoc,README
        \ setlocal filetype=asciidoc

autocmd BufRead,BufNewFile *.tex,*.bbl,*.bib,*.texx,*.texb,*.cls
        \ setlocal filetype=tex

autocmd BufRead,BufNewFile *.muttrc setlocal filetype=muttrc

autocmd BufRead,BufNewFile *.csv setlocal nowrap tw=0

autocmd BufRead,BufNewFile *.yaml setlocal nowrap tw=80

autocmd FileType tex inoremap <leader>ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Esc>2kA\item<Space>
autocmd FileType tex nnoremap <leader>ul i\begin{itemize}<Enter><Enter>\end{itemize}<Enter><Esc>2kA\item<Space>

autocmd FileType help setlocal number tw=78
" -------------------------------------------------------------------------- }}}
" {{{ Obfuscate screen contents
nnoremap <F1> mzggg?G`z
" -------------------------------------------------------------------------- }}}
" {{{ Delete line and more
"Delete line
map - dd

" Save file
noremap s :w<cr>

" Reformat lines.
nnoremap Q gqip
vnoremap Q gq

" Substitute
nnoremap <c-s> :%s/
vnoremap <c-s> :s/
" -------------------------------------------------------------------------- }}}
" {{{ Quicker access to Ex commands and sourcing.
nmap ; :
nnoremap <leader>sv :source $MYVIMRC<CR>
" -------------------------------------------------------------------------- }}}
" {{{ Toggle search results
noremap <silent><leader><space> :set hlsearch!<CR>
" -------------------------------------------------------------------------- }}}
" {{{ Sort lines
nnoremap <leader>s vip:!sort<cr>
vnoremap <leader>s :!sort<cr>
vnoremap <leader>u :sort u<cr>
" -------------------------------------------------------------------------- }}}
" {{{ Clean trailing whitespace
nnoremap <leader>ww mz:%s/\s\+$//<cr>:let @/=''<cr>`z
nnoremap <leader>wo :%bwipeout<cr>
nnoremap <leader>wr :%s/\r//g<cr>
" -------------------------------------------------------------------------- }}}
" {{{ Select entire buffer
nnoremap vaa ggvGg_
nnoremap Vaa ggVG
" -------------------------------------------------------------------------- }}}
" {{{ Copy and Paste
vnoremap xc "+y
nnoremap xv "+p

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif
" -------------------------------------------------------------------------- }}}
" {{{ Zoom to head level.
nnoremap zh mzzt10<c-u>
" -------------------------------------------------------------------------- }}}
" {{{ Easier linewise reselection of what you just pasted.
nnoremap <leader>V V`]
" -------------------------------------------------------------------------- }}}
" {{{ Indent/dedent/autoindent what you just pasted.
nnoremap <lt>> V`]<
nnoremap ><lt> V`]>
nnoremap =- V`]=
" -------------------------------------------------------------------------  }}}
" {{{ Join line
" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Join an entire paragraph
nnoremap <leader>J myvipJ`ygq<CR>
" -------------------------------------------------------------------------- }}}
" {{{ Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w
" -------------------------------------------------------------------------- }}}
" {{{ Source lines
vnoremap <leader>S y:@"<CR>
nnoremap <leader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>
" -------------------------------------------------------------------------- }}}
" {{{ Marks and Quotes
noremap ' `
noremap æ '
noremap ` <C-^>
" -------------------------------------------------------------------------- }}}
" {{{ Select (charwise) the contents of the current line, excluding indentation.
nnoremap vv ^vg_
" -------------------------------------------------------------------------- }}}
" {{{ Sudo to write
cnoremap w!! w !sudo tee % >/dev/null
" -------------------------------------------------------------------------- }}}
" {{{ Toggle [i]nvisible characters
nnoremap <leader>i :set list!<cr>
" -------------------------------------------------------------------------- }}}
" {{{ Redraw my screen
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>
" -------------------------------------------------------------------------- }}}
" {{{ Insert Mode Completion
inoremap <c-f> <c-x><c-f>
inoremap <c-]> <c-x><c-]>
inoremap <c-l> <c-x><c-l>
" -------------------------------------------------------------------------- }}}
" {{{ Execute the current line of text as a shell command.
noremap <leader>E !!$SHELL<cr>
" -------------------------------------------------------------------------- }}}
" {{{ junegunn: chmod
"
" EX | chmod +x " | https://github.com/junegunn/dotfiles/blob/master/vimrc
"
command! EX if !empty(expand('%'))
  \|   write
  \|   call system('chmod +x '.expand('%'))
  \|   silent e
  \| else
  \|   echohl WarningMsg
  \|   echo 'Save the file first'
  \|   echohl None
  \| endif
" -------------------------------------------------------------------------- }}}
" {{{ junegunn: Google it / Feeling Lucky
"
" <Leader>?/! | Google it / Feeling luckey | junegunn/dotfiles
"
function! s:goog(pat, lucky)

  let q = '"'.substitute(a:pat, '["\n]', ' ', 'g').'"'
  let q = substitute(q, '[[:punct:] ]',
       \ '\=printf("%%%02X", char2nr(submatch(0)))', 'g')
  if has("win32unix")
    call system(printf('cygstart --open "https://www.google.com/search?%sq=%s"',
                   \ a:lucky ? 'btnI&' : '', q))
  else
    call system(printf('open "https://www.google.com/search?%sq=%s"',
                   \ a:lucky ? 'btnI&' : '', q))
  endif

endfunction

nnoremap <leader>? :call <SID>goog(expand("<cWORD>"), 0)<cr>
nnoremap <leader>! :call <SID>goog(expand("<cWORD>"), 1)<cr>
xnoremap <leader>? "gy:call <SID>goog(@g, 0)<cr>gv
xnoremap <leader>! "gy:call <SID>goog(@g, 1)<cr>gv
" -------------------------------------------------------------------------- }}}
" {{{ Display help in vertical buffer.
nnoremap <leader>HH :silent vert bo help<cr>
" -------------------------------------------------------------------------- }}}
" {{{ Quick editing of my personalization files.
nnoremap <leader>ea :e ~/git/dotfiles/alias_and_functions<cr>
nnoremap <leader>eg :e ~/git/ssh/gitconfig<cr>
nnoremap <leader>ec :e ~/git/ssh/config.vim<cr>
nnoremap <leader>et :e ${HOME}/.tmux.conf<cr>
nnoremap <leader>ed :e ~/git/vim/custom-dictionary.utf-8.add<cr>
nnoremap <leader>ep :e ~/git/vim/vim-plug.vim<cr>
nnoremap <leader>es :e ~/git/vim/settings.vim<cr>
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>.  :e.<cr>
" -------------------------------------------------------------------------- }}}
" {{{ Print options
set printoptions=paper:A4,duplex:off,collate:n,syntax:y,number:y,top:5pc,right:2pc,bottom:5pc,left:2pc
" -------------------------------------------------------------------------- }}}
" SETTINGS SECTION END ----------------------------------------------------- }}}
" {{{ BUNDLES SECTION
" {{{ Air line
if !exists('g:airline_symbols')               " Use powerline fonts for airline
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline_powerline_fonts = 1
let g:airline_symbols.space = "\ua0"

let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }

let g:airline_theme='base16_chalk'
" -------------------------------------------------------------------------  }}}
" {{{ base16-vim 
let g:base16_shell_path="$HOME/git/color/base16-shell/scripts"
" -------------------------------------------------------------------------- }}}
" {{{ Bbye (Buffer Bye) for Vim
nnoremap <leader>q :Bdelete<cr>
nnoremap <leader>Q :bufdo :Bdelete<cr>
nnoremap <leader>X :bdelete<cr>
" -------------------------------------------------------------------------- }}}
" {{{ CTRL-P
let g:ctrlp_max_files = 0
let g:ctrlp_show_hidden=1
let g:ctrlp_custom_ignore = { 'dir': '\v[\/](.git|.cabal-sandbox|.stack-work)$' }

nnoremap <silent> <leader>ff :CtrlP<CR> "Fuzzy find
" -------------------------------------------------------------------------- }}}
" {{{ Drag Visual Block
" Remove any introduced trailing whitespace after moving.
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()
let g:DVB_TrimWS = 1
" -------------------------------------------------------------------------- }}}
" {{{ Dispatch
let g:dispatch_compilers = {
     \ 'haskell': 'cabal install',
     \ 'pdflatex': 'tex',
     \ 'ruby': 'rake'
     \ }
" -------------------------------------------------------------------------- }}}
" {{{ Docbld
nnoremap <leader>tl :silent Dispatch rake --rakefile ~/git/docbld/Rakefile list_files<cr>:copen<cr>
nnoremap <leader>tb :silent Dispatch rake --rakefile ~/git/docbld/Rakefile texx<cr>:copen<cr>
" -------------------------------------------------------------------------- }}}
" {{{ EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign in motino/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

nmap <bar> gaip*<bar>
" -------------------------------------------------------------------------- }}}
" {{{ Fugitive
nnoremap <leader>gp :Gpush<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gh :silent vert bo help fugitive<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gP :Gpull<cr>
nnoremap <leader>gs :Gstatus<cr>gg<c-n>
nnoremap <leader>gD :Gvdiff<cr>
" -------------------------------------------------------------------------- }}}
" {{{ github-issues
let g:gissues_async_omni = 1
let g:gissues_lazy_load = 1
let g:gissues_new_assignee = 'Traap'
let g:gissues_new_label = 'enhancement'
let g:github_same_window = 1
nnoremap <leader>gi :Gissues<cr>
nnoremap <leader>ga :Giadd<cr>
" -------------------------------------------------------------------------- }}}
" {{{ haskell-vim
let g:haskell_enable_quantification = 1       " Highlite forall
let g:haskell_enable_recursivedo = 1          " Highlite mdo and rec
let g:haskell_enable_arrowsyntax = 1          " Highlite proc
let g:haskell_enable_pattern_synonyms = 1     " Highlite pattern
let g:haskell_enable_typeroles = 1            " Highlite type roles
let g:haskell_enable_static_pointers = 1      " Highlite static
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_do = 3
let g:haskell_indent_int = 1
let g:haskell_indent_guard = 2
let g:cabal_indent_selection = 2
" -------------------------------------------------------------------------- }}}
" {{{ Helptags
noremap<leader>ph :Helptags<cr>:echo 'Helptags done!'<cr>
" -------------------------------------------------------------------------- }}}
" {{{ incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" -------------------------------------------------------------------------- }}}
" {{{ neco-ghc
let g:haskell_completion_ghc = 0              " Disabled for neco-ghc
let g:necoghc_enabled_detailed_browse = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
" -------------------------------------------------------------------------- }}}
" {{{ NERDtree
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos=1
let NERDTreeWinSize=40
nnoremap <silent><leader>nf :NERDTreeFind<CR>
nnoremap <silent><C-n> :NERDTreeToggle<CR>
" -------------------------------------------------------------------------- }}}
" {{{ neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#auto_complete_delay = 1000
" -------------------------------------------------------------------------- }}}
" {{{ Rainbow
let g:rainbow_active = 1

let rainbow_conf = {
    \   'guifgs':
    \       ['royalblue3'
    \       ,'darkorange3'
    \       ,'seagreen3'
    \       ,'firebrick'
    \       ]
    \,
    \   'ctermfgs':
    \       ['lightblue'
    \       ,'lightyellow'
    \       ,'lightcyan'
    \       ,'lightmagenta'
    \       ]
    \,
    \   'operators': '_,_'
    \,
    \   'parentheses':
    \       ['start=/(/ end=/)/ fold'
    \       ,'start=/\[/ end=/\]/ fold'
    \       ,'start=/{/ end=/}/ fold'
    \       ]
    \,
    \   'separately': {
    \       '*': {}
    \,
    \       'tex': {
    \           'parentheses':
    \                ['start=/(/ end=/)/'
    \                ,'start=/\[/ end=/\]/'
    \                ,'start=/{/ end=/}/'
    \                ]
    \,
    \       },
    \       'lisp': {
    \           'guifgs':
    \                ['royalblue3'
    \                ,'darkorange3'
    \                ,'seagreen3'
    \                ,'firebrick'
    \                ,'darkorchid3'
    \                ]
    \,
    \       },
    \       'vim': {
    \           'parentheses':
    \                ['start=/(/ end=/)/'
    \                ,'start=/\[/ end=/\]/'
    \                ,'start=/{/ end=/}/ fold'
    \                ,'start=/(/ end=/)/ containedin=vimFuncBody'
    \                ,'start=/\[/ end=/\]/ containedin=vimFuncBody'
    \                ,'start=/{/ end=/}/ fold containedin=vimFuncBody'
    \                ]
    \,
    \       },
    \       'html': {
    \           'parentheses':
    \               ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold']
    \,
    \       },
    \       'css': 0,
    \   }
    \}
" -------------------------------------------------------------------------- }}}
" {{{ rspec 
let g:rspec_command = "Dispatch rspec {spec}"
map <leader><leader>t :call RunCurrentSpecFile()<CR>
map <leader><leader>s :call RunNearestSpec()<CR>
map <leader><leader>l :call RunLastSpec()<CR>
map <leader><leader>a :call RunAllSpecs()<CR>

if has('maxunix')
  let g:rspec_runner = "os_x_iterm2"
endif

" -------------------------------------------------------------------------- }}}
" {{{ Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" -------------------------------------------------------------------------- }}}
" {{{ Tmux Runner
"
" Below are the suggested Tmux Runner default mappings.  I decided to explicitly
" reference them with defaults before I start changing them.
nnoremap <leader>rr  :VtrResizeRunner<cr>
nnoremap <leader>ror :VtrReorientRunner<cr>
nnoremap <leader>sc  :VtrSendCommandToRunner<cr>
nnoremap <leader>sf  :VtrSendFile!<cr>
nnoremap <leader>sl  :VtrSendLineToRunner<cr>
nnoremap <leader>or  :VtrOpenRunner<cr>
nnoremap <leader>kr  :VtrKillRunner<cr>
nnoremap <leader>fr  :VtrFocusRunner<cr>
nnoremap <leader>dr  :VtrDetachRunner<cr>
nnoremap <leader>ar  :VtrReattachRunner<cr>
nnoremap <leader>cr  :VtrClearRunner<cr>
nnoremap <leader>fc  :VtrFlushCommand<cr>
let g:vtr_filetype_runner_overrides = {
    \  'asciidoc': 'apdf {file}'
    \ ,'haskell': 'runhaskell {file}'
    \ }

let g:VtrOrientation = "h"
let g:VtrPercentage = 50

nnoremap <leader>db  :VtrSendCommand stack exec -- doc-build<cr>
nnoremap <leader>dc  :VtrSendCommand stack exec -- doc-build clean<cr>
nnoremap <leader>hb  :VtrSendCommand stack build hmst-documentation<cr>
nnoremap <leader>mb  :VtrSendCommand stack exec -- math-build<cr>
nnoremap <leader>mc  :VtrSendCommand stack exec -- math-build clean<cr>
" -------------------------------------------------------------------------- }}}
" {{{ vim-hoogle
let g:hoogle_search_buf_name = 'HoogleSearch'
let g:hoogle_search_count = 20
au BufNewFile,BufRead *.hs map <buffer> <leader>Hc :Hoogle<cr>
au BufNewFile,BufRead *.hs map <buffer> <leader>Hh :Hoogle<cr>
au BufNewFile,BufRead *.hs map <buffer> <leader>Hl :Hoogle<cr>
" -------------------------------------------------------------------------- }}}
" {{{ vim-most-minimal-folds
let g:most_minimal_folds_line_count = 1
" -------------------------------------------------------------------------- }}}
" {{{ vim-system-copy
" if has("win32unix")
"   let g:system_copy#paste_command='paste'
" endif
" -------------------------------------------------------------------------- }}}
" {{{ vitality
let g:vitality_fix_cursor = 1
let g:vitality_normal_cursor = 0
let g:vitality_insert_cursor = 1
let g:vitality_fix_focus = 1
let g:vitality_fix_cursor = 1
" -------------------------------------------------------------------------- }}}
" {{{ vimtex
let g:tex_flavor = 'latex'

let g:vimtex_latexmk_enabled = 1

let g:vimtex_quickfix_mode = 2
let g:vimtex_view_enabled = 1

let g:vimtex_quickfix_latexlog = {
      \ 'empty glossary' : 0,
      \ 'font warning' : 0,
      \ 'overfull' : 0,
      \ 'specifier change to' : 0,
      \ 'underfull' : 0,
      \ }

if has("win32unix")
  let g:vimtex_view_general_viewer = 'cygstart'
  let g:vimtex_view_general_options = '--open @pdf'

  let g:vimtex_compiler_latexmk = {
        \ 'background' : 0,
        \ 'build_dir' : '_build',
        \ 'executable' : 'latexmk',
        \ 'callback' : 0,
        \ 'continuous' : 0,
        \ 'options' : [
        \   '-pdf',
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
else
  let g:vimtex_compiler_latexmk = {
        \ 'background' : 0,
        \ 'build_dir' : '_build',
        \ 'executable' : 'latexmk',
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'options' : [
        \   '-pdf',
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
endif
" -------------------------------------------------------------------------- }}}
" {{{ Toggle my resume application.
let g:resume_toggle= 0
function! ToggleResumeEditor()
  if !g:resume_toggle
    e ~/git/resume/jobs/jobs.csv
    split ~/git/resume/letter/coverletter.tex
    vsplit ~/git/resume/jobs/jobnbr.tex
    :VideToggleIde
  end
  let g:resume_toggle =! g:resume_toggle
endfunction
nnoremap ]r :call ToggleResumeEditor()<cr>
" -------------------------------------------------------------------------- }}}
" {{{ Compile my resume.
function! CompileSS(file)
  if empty(glob(a:file))
    echom a:file . " does not exist."
    return
  endif

  " Create and initialize temporary compiler
  let l:options = {
        \ 'root' : fnamemodify(a:file, ':p:h'),
        \ 'target' : fnamemodify(a:file, ':p:t'),
        \ 'target_path' : fnamemodify(a:file, ':p'),
        \ 'background' : 0,
        \ 'continuous' : 0,
        \ 'callback' : 1,
        \}

  echom l:options.root
  echom l:options.target
  echom l:options.target_path

  let g:vimtex_compiler_enabled = 1
  "let l:compiler = vimtex#compiler#{g:vimtex_compiler_latexmk}#init(l:options)

  call vimtex#echo#status([
        \ ['VimtexInfo', 'vimtex: '],
        \ ['VimtexMsg', 'compiling file ' . l:options.target]])

  "call l:compiler.start()
  call vimtex#compiler#compile_ss()
endfunction

nnoremap [r :call CompileSS('~/git/resume/letter/coverletter.tex')<cr>
" -------------------------------------------------------------------------- }}}
" {{{ Wipeout all buffers.
function! Wipeout()
  if exists("g:opt_diminactivewin")
    let g:opt_diminactivewin = 0
  endif

  if exists("g:resume_toggle")
    let g:resume_toggle = 0
  endif

  if g:vide_is_on
    :VideToggleIde
  endif
  silent execute '%bwipeout!'
endfun
nnoremap ]w :call Wipeout()<cr>
" -------------------------------------------------------------------------- }}}
" BUNDLES SECTION END ------------------------------------------------------ }}}
