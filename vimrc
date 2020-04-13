" {{{ Author: gary.a.howard@mac.com
"
" Influenced by:
"   Steve Losh <steve@stevelosh.com>
"     http://bitbucket.org/sjl/dotfiles/src/tip/vim/
"
"   James Morrin
"     https://github.com/treasonx/
"
"   Tim Pope
"     https://github.com/tpope/
"
"   Junegunn Choi
"     https://github.com/junegunn/
" -------------------------------------------------------------------------- }}}
" {{{ Initialize my Vim Personalization.  

" I always root my GitHub repositories at ~/git.
let s:vim_home = '~/git/vim/'

" My private and public keys are maintained in a private repository.
let s:vim_ssh = '~/git/ssh/'

" A list of items I want installed, and the order I want Vim to source them.
let s:config_list = [ s:vim_home . 'bootstrap.vim'
                \ , s:vim_home . 'autoload/plug.vim'
                \ , s:vim_home . 'vim-plug.vim'
                \ , s:vim_home . 'settings.vim'
                \ , s:vim_ssh  . 'config.vim'
                \ ]

" Now kick-start Vim. 
for files in s:config_list
  for f in split(expand(files), '\n')
    exec 'source '.f
  endfor
endfor
" -------------------------------------------------------------------------- }}}
