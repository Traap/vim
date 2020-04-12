" {{{ LEADER SECTION
let g:mapleader = ","
let maplocalleader = ","
set tm=750                                   " Leader key timeout.
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
" {{{ Toggle [i]nvisible characters
nnoremap <leader>i :set list!<cr>
" -------------------------------------------------------------------------- }}}
" {{{ Insert Mode Completion
inoremap <c-f> <c-x><c-f>
inoremap <c-]> <c-x><c-]>
inoremap <c-l> <c-x><c-l>
" -------------------------------------------------------------------------- }}}
" {{{ Execute the current line of text as a shell command.
noremap <leader>E !!$SHELL<cr>
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
" {{{ base16-vim
let g:base16_shell_path="$HOME/git/color/base16-shell/scripts"
" -------------------------------------------------------------------------- }}}
" {{{ Dispatch
let g:dispatch_compilers = {
     \ 'pdflatex': 'tex',
     \ 'ruby': 'rake'
     \ }
" -------------------------------------------------------------------------- }}}
" {{{ rspec
let g:rspec_command = "Dispatch rspec {spec}"
" -------------------------------------------------------------------------- }}}
" {{{ The Silver Search through ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'
" -------------------------------------------------------------------------- }}}
" {{{ vim-most-minimal-folds
let g:most_minimal_folds_line_count = 1
" -------------------------------------------------------------------------- }}}
" BUNDLES SECTION END ------------------------------------------------------ }}}
