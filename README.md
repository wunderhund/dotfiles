# dotfiles
miscellaneous user environment files I use

## craig-magic.zsh-theme installation

1. [Install Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)
1. Download craig-magic.zsh-theme and save it in `~/.oh-my-zsh/themes/`.
1. Open `~/.zshrc` in a text editor of your choice.
  1. Find the line with `ZSH_THEME=` and replace it with `ZSH_THEME="craig-magic"`.
  1. Find the `plugins=( )` array and add `virtualenv` to it (if you use virtualenv).
1. Save and exit your text editor.
1. Run `source ~/.zshrc` to reload your shell.
1. Enjoy!
