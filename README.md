# .vim FSC dot file
My vim dot file. `~/.vimrc` is removed and us `~/.vim/vimrc`. In this way version control can be easier.
This profile can config vim ready in 30s.
Fast，simple and credible.
<div  align="center">    

<img src="http://47.92.112.211/wp-content/uploads/2017/10/vim-profile-screen-shot.png" width = 100% height = 100% alt="Preview" />
Preview
</div>

## Follow the steps below

1. Backup your ~/.vimrc
```
cp ~/.vimrc ~/.vimrcbackup ; rm -rf ~/.vimrc ~/.vim
```


2. Clone this profile to you ~/.vim folder.
```
git clone https://github.com/iyuangang/.vim.git ~/.vim
```

3. Open vim
```
vim
```
4. Input
```
:PlugInstall
```
Enjoy your fast and beauty new vim.

## Remarks
Check update 
```
:PlugUpdate
```
Delete plugin 1, delete plugin in vimrc. 2, `:PlugClean`

Remove this profile 
```
rm -rf ~/.vim
```
