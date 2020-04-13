# Vim
The piece parts I use to personalize Vim.

## Installation 
#### **WARNING:** There [be dragons](https://github.com/tpope/tpope) here (paraphrased).
I have customized my Vim/neovim setup to operate on linux, macunix, and win32unix.  I set up Vim with following simple steps.

```bash
cd 
mkdir git
cd ~/git
rm -rf ~/git/vim
git clone https://github.com:Traap/vim.git
vim
```
*Watch the magic!!!*

## Overview
I use different methods to install Vim and Neovim.  I use the steps listed above if I choose to reset my environment or after installing Vim or NeoVim.  The files listed below are sourced by vimrc.  The installation follows a precise order to orchestrate the setup.

### vimrc
1. *s:vim_home* defines the location of my Vim preferences.
2. *s:vim_ssh* represents the private repository for my public and private keys.
3. *s:config_list* concatenates s:vim_home or s:vim_ssh with the appropriate component.
4. Iterate *s:config_list* to kick-start Vim.

### bootstrap.vim
I use [vim-plug](https://github.com/junegunn/vim-plug) to manage Vim plugins.  bootstrap.vim installs [vim-plug](https://github.com/junegunn/vim-plug) when necessary.

When g:not_finish_vimplug is **no** [vim-plug](https://github.com/junegunn/vim-plug) is installed using:
```vim
silent !\curl -fLo ~/.vim/autoload/plug.vim
  \ --create-dirs 
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### plug.vim
[vim-plug](https://github.com/junegunn/vim-plug) is used.  I install two types of plugins:
1. Community plugs are listed alphabetically when possible.
2 I have public repositories for each community plugin that I customize.  I use vim-bundle-xyz for my bundle patterns.  A bundle may reference personalization for one or more community plugin.   As an example, [vim-bundle-settings](https://github.com/Traap/vim-bundle-settings) was heavily inspired by [Steve Losh](https://github.com/sjl).
3. When g:not_finished_vimplug is **yes**, PlugInstall is used.

```vim 
autocmd VimEnter * PlugInstall
```

### config.vim
Connect to my private and public keys.

### Symbolic links
I use symbolic links from $HOME to .vim, .vimrc, and .vimrc_background so that my Vim environment is controlled.

## History
I started using Vim during my Christmas 2015 work break.  I chose Vim because I needed an editor that I could use consistently across various Linux, OSX, and Windows environments.  I only know how to start and exit Vim.  I could not do the same with Emacs.  

I started my journey searching [YouTube](https://www.youtube.com) for Vim.  I was amazed at what I leaned.  I saw men, women, and college students showing how they used Vim to increase their productivity.  The creativity I witnessed amazed me. -- I was hooked!

## Acknowledgments
I learned about dotfiles, Vim, TMUX, and so much more.  I am listing Vim contributors I followed when I began.
1. [Tim Pope](https://github.com/tpope) prolific is an understatement.  I started with [Fugitive](https://github.com/tpope/vim-fugitive) and [Pathogen](https://github.com/tpope/vim-pathogen).   
2. [Steve Losh](https://github.com/sjl) challenged me to think differently. [Learning Vimscript the Hard Way](https://learnvimscriptthehardway.stevelosh.com/) guided me.  I backlogged items to study. 
3. [Junegunn Choi](https://github.com/junegunn/) nearly caused my heart to with [vim-easy-align](https://github.com/junegunn/vim-easy-align).  I cannot count the months, days, hours, and minutes I have wasted using 'repeated-space-key-pattern' to align text.  [fzf](https://github.com/junegunn/fzf), [fzf.vim](https://github.com/junegunn/fzf.vim),  and [vim-plug](https://github.com/junegunn/vim-plug) have my lasted updates possible.
4. [James Morrin](https://github.com/treasonx) vimrc and OSX setups were studied.  
5. [Chris Toomey](https://github.com/christoomey) has two excellent plugins [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) and [vim-tmux-runner](https://github.com/christoomey/vim-tmux-runner) that I used to learn Tmux.
6. [Karl Yngve Lervåg](https://github.com/lervag) increased my LaTeX productivity with [vimtex](https://github.com/lervag/vimtex).

I learned from many others, also.  There are too many to name.

## Why the [vim-bundle-xxx](https://github.com/Traap/vim-bundle-settings) Pattern?
Are you Nuts?  The short answer is **Yes**.

Naming conventions are essential axioms to well-written programs.   I needed a construct that was just another Vim plugin.

I spend a significant amount of time breaking and rebuilding computers.  I have had four computers physically break within the last six months: motherboards, disk drives, monitors, and more.  Rebuilding computers quickly is in my DNA.  The bottom line is simple, 'My computers are not Traap proof.'

My goal was to type Vim have it automatically bootstrap itself.  I also want to experiment with Vim plugins and settings. Now that I use [vim-plug](https://github.com/junegunn/vim-plug), I can safely comment out a few [plug](https://github.com/Traap/vim/blob/master/plug.vim)  lines without much effort.

I centrally located my [vim-bundle-keybindings](https://github.com/Traap/vim-bundle-keybindings/blob/master/plugin/bundle-keybindings.vim).  LaTeX the primary language I use for writtiig documents.  I personalized [vimtex](https://github.com/lervag/vimtex) with [vim-bundle-vimtex](https://github.com/Traap/vim-bundle-vimtex/blob/master/plugin/bundle-vimtex.vim).  These simple abstractions support [loose coupling](https://en.wikipedia.org/wiki/Coupling_(computer_programming)) and [high cohesion](https://en.wikipedia.org/wiki/Cohesion_(computer_science)) I try practice.
