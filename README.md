# .vim FSC dot file
[![Build Status](https://travis-ci.org/iyuangang/.vim.svg?branch=master)](https://travis-ci.org/iyuangang/.vim)

My vim dot file. `~/.vimrc` is removed and us `~/.vim/vimrc`. In this way version control can be easier.
This profile can config vim ready in 5s.
Fast，simple and credible.
<div  align="center">    

<img src="http://47.92.112.211/wp-content/uploads/2017/10/fscvim-1.png" width = 100% height = 100% alt="Preview" />
Preview
</div>

## Linux & MacOS

### Follow the steps below

Automatic by 1 line code.
```
curl http://dwz.cn/fscvim -L > fsc.sh && sh fsc.sh
```

You can also manually operate it.

1. Backup your ~/.vimrc
```
cp ~/.vimrc ~/.vimrcbak ; cp -r ~/.vim ~/.vimbak ; rm -rf ~/.vimrc ~/.vim
```


2. Clone this profile to you ~/.vim folder, run vim.
```
git clone https://github.com/iyuangang/.vim.git ~/.vim ; vim
```

Wait plugin auto install. Enjoy your fast and beauty new vim.

## Windows

### Follow the steps below

1. Download [install.cmd](https://raw.githubusercontent.com/iyuangang/linuxconf/master/install.cmd).
2. Run the cmd file as Administrator.
3. Open Gvim. Enjoy it.

## Instructions

### Check update

```
:PlugUpdate
```

### Add plugin

1. Edit vim config file `vim ~/.vim/vimrc`
2. add plugin into
```
call plug#begin('~/.vim/plugged')
...
call plug#end()
```

### Delete plugin

1. delete plugin config code in vimrc.
2. `:PlugClean`

### Remove this profile

```
rm -rf ~/.vim ; cp ~/.vimrcbak ~/.vimrc ; cp -r ~/.vimbak ~/.vim
```
