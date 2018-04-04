" Author: gary.a.howard@mac.com
"
 "Influenced by:
"    Steve Losh <steve@stevelosh.com>
"      http://bitbucket.org/sjl/dotfiles/src/tip/vim/
"
"    James Morrin
"      https://github.com/treasonx/
"
"    Tim Pope
"      https://github.com/tpope/
"
let s:vim_home = '~/git/vim/'
let s:vim_ssh = '~/git/ssh/'

let config_list = [ s:vim_home . 'autoload/vim-plug/plug.vim'
                \ , s:vim_home . 'vim-plug.vim'
                \ , s:vim_home . 'settings.vim'
                \ , s:vim_ssh  . 'config.vim'
                \ ]

for files in config_list
  for f in split(expand(files), '\n')
    exec 'source '.f
  endfor
endfor
