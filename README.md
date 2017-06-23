# vim-config
My vim configuration backup

Mainly refer to https://github.com/derekwyatt/vim-config

But only use the plugins I need and use my own config.

Also set the Vundle as submodule, So can use
```
git submodule init
git submodule update
```

# Instal Vundle's plugins
```
cp _vimrc ~/.vimrc
vim +PluginInstall +qall
```
# Requirement
## ctags
CentOS: yum install ctags
Windows: Download ctagsxx.zip from http://ctags.sourceforge.net/, copy the ctags.exe to Vim Installation directory (e.g. C:\Program Files (x86)\Vim\vim80)
## flake8
pip install flake8
