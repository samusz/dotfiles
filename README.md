# My dotfile repo 

Created with `tuckr`  [https://github.com/RaphGL/Tuckr]

The following are my cheatsheet on `tuckr`.

## Add a dotfile to be tracked 

To add a new config file directory :
``` bash
tuckr push groupname path-of-files-or-folder
```
to update a group :  


## To update a group 

The first time get the files as they are :  
```shell
tuckr add -a groupname
```

Later on do :
```bash
tuckr add groupname
```

## To get system up to date with repo

For a new machine:

1. clone your dotfile repos,
```shl
git clone <this repo> ~/.config/dotfiles
```

2. install tuck 
```shell
cargo install --git https://github.com/RaphGL/Tuckr.git
```

3. Update local dotfiles to your repos' dotfiles.
```shell

:TODO:
tuckr 
```
```
