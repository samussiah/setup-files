# setup-files
Maintain setup files across work environments.

## software
* [git](https://git-scm.com/)
* [vim](http://www.vim.org/)
* [dev server](http://www.easyphp.org/)
* [AutoHotKey](https://autohotkey.com/)

## setup

### vim
```
cd ~
git clone http://github.com/samussiah/setup-files.git ~/vimfiles
ln -s ~/vimfiles/_vimrc ~/_vimrc
cd ~/vimfiles
git submodule init
git submodule update
```
