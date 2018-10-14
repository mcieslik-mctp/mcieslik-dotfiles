Copy and paste into terminal:
```bash
git clone --bare https://github.com/mctp/mcieslik-dotfiles $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
config checkout
config config status.showUntrackedFiles no
```
