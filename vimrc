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

" s:vim_home defines the location of my Vim preferences.
let s:vim_home = '$VIMHOME/'

" s:vim_ssh represents the private repository for my public and private keys.
let s:vim_ssh = '$SSHHOME/'

" s:config_list concatenates s:vim_home or s:vim_ssh with the appropriate
" component.
let s:config_list =
                \ [ s:vim_home . 'bootstrap.vim'
                \ , s:vim_home . 'autoload/plug.vim'
                \ , s:vim_home . 'plug.vim'
                \ , s:vim_ssh  . 'config.vim'
                \ ]

" Iterate s:config_list to kick-start Vim.
for files in s:config_list
  for f in split(expand(files), '\n')
    exec 'source '.f
  endfor
endfor
" -------------------------------------------------------------------------- }}}
