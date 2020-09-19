# Description
My vim configuration backup

Mainly refer to https://github.com/derekwyatt/vim-config

But only use the plugins I need and use my own config.

# Usage
```
cd ~
git clone https://github.com/ryanaaa/vim-config.git .vim
cd .vim
cp _vimrc ~/.vimrc

# install vundle
git submodule init
git submodule update

# install plugins
vim +PluginInstall +qall
```

# Requirements
## ctags (pernatiy/taglist.vim)
- CentOS: yum install ctags
- Windows: Download ctagsxx.zip from http://ctags.sourceforge.net/, copy the ctags.exe to Vim Installation directory (e.g. C:\Program Files (x86)\Vim\vim80)

## flake8 (nvie/vim-flake8)
pip install flake8
