" {{{ LEADER SECTION
let g:mapleader = ","
let maplocalleader = ","
set tm=2000                                   " Leader key timeout.
" LEADER SECTION END ------------------------------------------------------- }}}
" {{{ SETTINGS SECTION
" {{{ Filetype and plugin defaults.
filetype on
filetype plugin indent on
" -------------------------------------------------------------------------- }}}
" {{{ Alphabetical listing of things I set.
set autowrite
set cmdheight=1                               " Height of the command bar.
set colorcolumn=+1
set complete=.,w,b,u,t,i,kspell
set encoding=UTF-8
set fileformats=unix
set foldmethod=marker
set laststatus=2
set lazyredraw
set linebreak
set matchtime=3
set modelines=0
set nocompatible
set norelativenumber
set notimeout
set nobackup
set noswapfile
set novisualbell
set number
set numberwidth=1
set path+=**
set showbreak=↪
set showcmd
set showmatch
set showmode
set sidescroll=1
set sidescrolloff=10
set splitbelow splitright
set synmaxcol=800
set title
set ttimeoutlen=10
set ttyfast
set virtualedit+=block
set visualbell
set undodir=~/.vim/undodir
set undofile
syntax on
" -------------------------------------------------------------------------- }}}
" {{{ Show trailing whitespaces
set nolist                                    " Show trailing whitespaces
if &listchars ==# 'eol:$'                     " But only interesting whitespace
  set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:-,nbsp:+
endif
" -------------------------------------------------------------------------- }}}
" {{{ Searching
set hlsearch                                  " Highlight previous search
set ignorecase                                " Ignore case when searching
set smartcase                                 " Be smart about case.
" -------------------------------------------------------------------------- }}}
" {{{ The wild, wild, west
set wildignore+=Ankh.NoLoad
set wildignore+=*.aps
set wildignore+=*.aux
set wildignore+=*.bak
set wildignore+=*.bak.*
set wildignore+=*.bmp
set wildignore+=*.csproj.user
set wildignore+=*.dbmdl
set wildignore+=*.dll
set wildignore+=*.DS_Store
set wildignore+=*.exe
set wildignore+=*.gif
set wildignore+=.git
set wildignore+=.hg
set wildignore+=*_i.c
set wildignore+=*.ilk
set wildignore+=*.jpeg
set wildignore+=*.jpg
set wildignore+=*.lib
set wildignore+=*.log
set wildignore+=*.luac
set wildignore+=*.manifest
set wildignore+=migrations
set wildignore+=*.ncb
set wildignore+=*.o
set wildignore+=*.obj
set wildignore+=*.orig
set wildignore+=*.out
set wildignore+=*_p.c
set wildignore+=*.pdb
set wildignore+=*.png
set wildignore+=*.pyc
set wildignore+=*.resharper
set wildignore+=_ReSharper.*
set wildignore+=_ReSharper*
set wildignore+=*.resharper.user
set wildignore+=*.sbr
set wildignore+=*.sdf
set wildignore+=*.spl
set wildignore+=*.suo
set wildignore+=.svn
set wildignore+=*.sw?
set wildignore+=*.swp
set wildignore+=*.tlb
set wildignore+=*.tlh
set wildignore+=*.toc
set wildignore+=*.user
set wildignore+=*.vspscc
set wildignore+=*.vssscc
set wildmode=list:longest,full                   " Tab-complete files.
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
" -------------------------------------------------------------------------- }}}
" {{{ Colors and options specific to vim, gvim, and nvim, and OSX or Linux.
"
" Use visible search highlighting
hi! link Visual Search

" Establish setting for gui and non-gui vim sessions.
if has("gui_running")

  " Don't blink normal mode cursor
  set guicursor=n-v-c:block-Cursor
  set guicursor+=n-v-c:blinkon0

  set guioptions-=e
  set guioptions-=l
  set guioptions-=L
  set guioptions-=m
  set guioptions-=r
  set guioptions-=R
  set guioptions-=T

  " Set fonts.
  if has("gui_macvim")
    set guifont=Menlo:h13
  else
    set guifont=DejaVu\ Sans\ Mono\ 9
  endif

  set guitablabel=%M\ %t
  hi Directory guifg=#8ac6f2
else

  let &t_SI.="\e[5 q" "SI = Insert
  let &t_SR.="\e[4 q" "SR = Replace
  let &t_EI.="\e[6 q" "EI = Normal

endif

" Set utf-8 as standard encoding and en_US as the standard language
if !has('nvim')
  " Only set this for vim, since neovim is utf8 as default and setting it
  " causes problems when reloading the .vimrc configuration
  set encoding=utf-8
  if exists('$TMUX')
    set term=screen-256color
  endif
endif

" disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color tmux and GNU screen.
" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
if &term =~ '256color'
  set t_ut=
endif

" VIM color are not readable.
if !has("gui_running")
  colorscheme desert
endif

" Use same color behind concealed unicode characters
hi clear Conceal
set t_Co=18

" Disable visual flash.:
set t_vb=

" I am using color 18 or 19, which will change because I use base16 functions
" such as base16_chalk to set my terminal color.
highlight ColorColumn ctermbg=18
highlight SignColumn ctermbg=18
"set signcolumn=yes

" -------------------------------------------------------------------------- }}}
" {{{ Automatic spelling and typo corrections.
iabbrev efk            gary.howard@fresenius-kabi.com
iabbrev egh            gary.a.howard@mac.com
iabbrev developmetn    development
iabbrev heigth         heigth
iabbrev liek           likewisee
iabbrev liekwise       likewise
iabbrev manditory      mandatory
iabbrev moer           more
iabbrev pritn          print
iabbrev reprot         report
iabbrev retrun         return
iabbrev sectoin        section
iabbrev subsectoin     subsection
iabbrev subsubsectoin  subsubsection
iabbrev teh            the
iabbrev thier          their
iabbrev verboase       verbose
iabbrev waht           what
iabbrev weight         weigth
iabbrev weihg          weigh
iabbrev widht          width
iabbrev wiegh          weigh
iabbrev wiegth         weigth

" ------------------------------------------------------------------------- }}}
" {{{ grep experiment
" Yank visually selected test and search for it in any file.
vnoremap _g y:exe "grep /. escape(@", '\\/') . "/ *.*"<cr>

" ------------------------------------------------------------------------- }}}
" {{{ Auto commands for filetypes.
autocmd BufRead,BufNewFile *.adoc,*adoci,*.txt,*.asciidoc,README
        \ setlocal filetype=asciidoc

autocmd BufRead,BufNewFile *.tex,*.bbl,*.bib,*.texx,*.texb,*.cls
        \ setlocal filetype=tex

autocmd BufRead,BufNewFile *.muttrc setlocal filetype=muttrc

autocmd BufRead,BufNewFile *.csv,*.md setlocal nowrap tw=0

autocmd BufRead,BufNewFile *.yaml setlocal nowrap tw=80

autocmd BufRead,BufNewFile config setlocal nowrap tw=117

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
vnoremap Q gq

" Substitute
nnoremap <c-s> :%s/
vnoremap <c-s> :s/

" Map O to :only so that only one view is visable.
nnoremap <silent> O :only<cr>

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

" Normal mode copy & paste
nnoremap cc "+y
nnoremap cv "+p

" Visual mode copy & paste
vnoremap cc "+y
vnoremap cv "+p

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
" ------------------------------------------------------------------------- }}}
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
" noremap ' `
" noremap æ '
" noremap ` <C-^>
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
" {{{ vimdiff and spelling colors
highlight clear SpellBad
highlight DiffAdd    cterm=bold      ctermfg=10  ctermbg=19 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold      ctermfg=5   ctermbg=19 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold      ctermfg=9   ctermbg=19 gui=none guifg=bg guibg=Red
highlight search     cterm=bold      ctermfg=16  ctermbg=19 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold      ctermfg=155 ctermbg=19 gui=none guifg=bg guibg=Red
highlight Folded                     ctermfg=100 ctermbg=19 gui=none guifg=bg guibg=Red
highlight SpellBad   cterm=underline ctermfg=3   ctermbg=19 gui=undercurl
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

nnoremap <leader>ma :e ~/git/dotfiles/my_aliases<cr>
nnoremap <leader>mc :e ~/git/dotfiles/my_completions<cr>
nnoremap <leader>me :e ~/git/dotfiles/my_exports<cr>
nnoremap <leader>mf :e ~/git/dotfiles/my_functions<cr>
nnoremap <leader>mp :e ~/git/dotfiles/my_paths<cr>
nnoremap <leader>mt :e ~/git/dotfiles/my_prompt<cr>

nnoremap <leader>i3 :e ~/git/dotfiles/i3-config<cr>
nnoremap <leader>xi :e ~/git/dotfiles/xinitrc<cr>

" -------------------------------------------------------------------------- }}}
" {{{ Print options
set printoptions=paper:A4,duplex:off,collate:n,syntax:y,number:y,top:5pc,right:2pc,bottom:5pc,left:2pc
" -------------------------------------------------------------------------- }}}
" {{{ neovim
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  set mouse=nvi
  behave xterm
endif
" -------------------------------------------------------------------------- }}}
" {{{ Using shift versus control when I'm lazy.
nnoremap B <c-b>
nnoremap F <c-f>
" -------------------------------------------------------------------------- }}}
" SETTINGS SECTION END ----------------------------------------------------- }}}
" {{{ BUNDLES SECTION
" {{{ Air line
if !exists('g:airline_symbols')               " Use powerline fonts for airline
  let g:airline_symbols = {}
endif

" Unicode symbols
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
" ------------------------------------------------------------------------- }}}
" {{{ base16-vim
let g:base16_shell_path="$HOME/git/color/base16-shell/scripts"
" -------------------------------------------------------------------------- }}}
" {{{ Bbye (Buffer Bye) for Vim
nnoremap <leader>q :Bdelete<cr>
nnoremap <leader>Q :bufdo :Bdelete<cr>
nnoremap <leader>X :bdelete<cr>
" -------------------------------------------------------------------------- }}}
" {{{ Buffer resize 
map <m-h> :vertical resize -1<cr>
map <m-j> :resize +1<cr>
map <m-k> :resize -1<cr>
map <m-l> :vertical resize +1<cr>
" -------------------------------------------------------------------------- }}}
" {{{ coc-vim : Language Server Protocol 
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

nnoremap gD <Plug>(coc-definition)
" -------------------------------------------------------------------------- }}}
" {{{ Escape replacement
inoremap ,, <esc>
" inoremap <esc> <nop>
vnoremap ,, <esc>
" vnoremap <esc> <nop>
" -------------------------------------------------------------------------- }}}
" {{{ Fuzzy file finders
if has('unix')
  if has('nvim')
    nnoremap <silent> <leader>ff :FZF<CR>
  else
    nnoremap <silent> <leader>ff :FZF<CR>
    " let g:ctrlp_max_files = 0
    " let g:ctrlp_show_hidden=1
    " let g:ctrlp_custom_ignore = { 'dir': '\v[\/](.git|.cabal-sandbox|.stack-work)$' }
    " nnoremap <silent> <leader>ff :CtrlP<CR>
  endif
endif
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
let g:haskell_enable_quantification = 1       " Highlight forall
let g:haskell_enable_recursivedo = 1          " Highlight mdo and rec
let g:haskell_enable_arrowsyntax = 1          " Highlight proc
let g:haskell_enable_pattern_synonyms = 1     " Highlight pattern
let g:haskell_enable_typeroles = 1            " Highlight type roles
let g:haskell_enable_static_pointers = 1      " Highlight static
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
" {{{ Tmux Runner
"
" Below are the suggested Tmux Runner default mappings.  I decided to explicitly
" reference them with defaults before I start changing them.
nnoremap <leader>rr  :VtrResizeRunner<cr>
nnoremap <leader>ror :VtrReorientRunner<cr>
nnoremap <leader>sc  :VtrSendCommandToRunner<cr>
nnoremap <leader>sf  :VtrSendFile!<cr>
nnoremap <leader>sl  :VtrSendLinesToRunner<cr>
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
let g:VtrClearSequence = ""
let g:VtrClearBeforeSend = 1

" -------------------------------------------------------------------------- }}}
" {{{ The Silver Search through ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'
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
" {{{ vitality
if has('macunix')
  let g:vitality_fix_cursor = 1
  let g:vitality_normal_cursor = 0
  let g:vitality_insert_cursor = 1
  let g:vitality_fix_focus = 1
  let g:vitality_fix_cursor = 1
endif
" -------------------------------------------------------------------------- }}}
" {{{ vimtex
let g:tex_flavor = 'latex'

let g:vimtex_fold_enabled = 1
let g:vimtex_fold_manual = 0

let g:vimtex_format_enabled = 1

let g:vimtex_complete_enabled = 1
let g:vimtex_complete_close_braces = 1

let g:vimtex_latexmk_enabled = 1

let g:vimtex_quickfix_mode = 2
let g:vimtex_view_enabled = 1

let g:vimtex_quickfix_latexlog = {
      \ 'empty glossary' : 0,
      \ 'font warning' : 0,
      \ 'overfull' : 0,
      \ 'specifier change to' : 0,
      \ 'underfull' : 0,
      \ 'packages' : {
      \   'tocloft' : 0,
      \  },
      \ }

if has('nvim')
  let g:vimtex_compiler_progname="nvr"
endif

if has("win32unix")
  let g:vimtex_view_general_viewer = 'SumatraPDF'
  let g:vimtex_compiler_latexmk = {
        \ 'backend' : 'jobs',
        \ 'background' : 0,
        \ 'build_dir' : '_build',
        \ 'executable' : 'latexmk',
        \ 'callback' : 1,
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
  " let g:vimtex_view_general_viewer = 'zathura'
  let g:vimtex_view_general_viewer = 'okular'
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
" {{{ Vim Completes Me
augroup VimCompletesMeTex
  autocmd!
  autocmd FileType tex
      \ let b:vcm_omni_pattern = g:vimtex#re#neocomplete
augroup END
" -------------------------------------------------------------------------- }}}
" {{{ You Complete Me
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme
" -------------------------------------------------------------------------- }}}
" BUNDLES SECTION END ------------------------------------------------------ }}}
