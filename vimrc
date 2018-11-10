" Author: gary.a.howard@mac.com
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
"
" I always root my GitHub repositories at ~/git.
let s:vim_home = '~/git/vim/'

" My private and public keys are maintained in a private repository.
let s:vim_ssh = '~/git/ssh/'

" A list of items and the order I want Vim to source them.
let config_list = [ s:vim_home . 'autoload/vim-plug/plug.vim'
                \ , s:vim_home . 'vim-plug.vim'
                \ , s:vim_home . 'settings.vim'
                \ , s:vim_ssh  . 'config.vim'
                \ ]

" Now kick-start Vim with my personalization. 
for files in config_list
  for f in split(expand(files), '\n')
    exec 'source '.f
  endfor
endfor
