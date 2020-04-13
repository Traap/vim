### Vim
The piece parts I use to personalize Vim.

#### Installation warning: There [be dragons](https://github.com/tpope/tpope) here (paraphrased).
I have customized my Vim/neovim setup to operate on linux, macunix, and win32unix.  
I set up Vim with following simple steps.

```bash
cd 
mkdir git
cd ~/git
rm -rf ~/git/vim
git clone https://github.com:Traap/vim.git
vim
```
Watch the magic!!!

### Overview
I use different methods to install Vim and Neovim.  I use the steps listed above if I choose to reset my environment or after installing Vim or NeoVim.

I files listed below are sourced by vimrc.  The installation follows a precise order to orchestrate the setup.

#### vimrc
1. s:vim_home defines the location of my Vim preferences.
2. s:vim_ssh represents the private repository for my public and private keys.
3. s:config_list concatenates s:vim_home or s:vim_ssh with the appropriate component.
4. Iterate s:config_list to kick-start Vim.

#### bootstrap.vim
I use [vim-plug](https://github.com/junegunn/vim-plug) to manage Vim plugins.  bootstrap.vim installs [vim-plug](https://github.com/junegunn/vim-plug) when necessary.

When g:not_finish_vimplug is "no" [vim-plug](https://github.com/junegunn/vim-plug) installed using  
```vim
silent !\curl -fLo ~/.vim/autoload/plug.vim
  \ --create-dirs 
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

#### plug.vim
[vim-plug](https://github.com/junegunn/vim-plug) is used.  I install two types of plugins:
1. Community plugs are listed alphabetically when possible.
2 I have public repositories for each community plugin that I customize.  I use vim-bundle-xyz for my bundle patterns.  A bundle may reference personalization for one or more community plugin.   As an example, [vim-bundle-settings](https://github.com:Traap/vim-bundle-settings) was heavily inspired by [Steve Losh](https://github.com/sjl).
3. When g:not_finished_vimplug is "yes", PlugInstall is used.

```vim 
autocmd VimEnter * PlugInstall
```

#### config.vim
Connect to my private and public keys.

#### Symbolic links
I use symbolic links from $HOME to .vim, .vimrc, and .vimrc_background
so that my Vim environment is controlled.
