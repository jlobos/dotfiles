```bash
$ ln -s ~/dotfiles/bashrc ~/.bashrc
$ ln -s ~/dotfiles/xinitrc ~/.xinitrc
$ ln -s ~/dotfiles/i3-config ~/.config/i3/config
$ ln -s ~/dotfiles/terminator-config ~/.config/terminator/config
$ ln -s ~/dotfiles/gitconfig ~/.gitconfig
```

```bash
$ yaourt -Qqe > packages.txt
$ yaourt -S $(cat packages.txt)
```
