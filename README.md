#dotfiles
This repository contains my personal dotfiles that I use for my system.

# System Description
* arch
* i3-gaps
* terminator
* zsh && oh-my-zsh
* polybar
* vim

# Setup
For setup of this repository, first create an alias in `.bashrc` or `zshrc`:
```
alias config='/usr/bin/git --git-dir=$HOME/dv/an/dotfiles --work-tree=$HOME'
```
Then we clone this repository, but make sure to use the `--bare` flag:
```
git clone --bare git@github.com:quocanha/dotfiles.git $HOME/dv/an/dotfiles
```
Then source the file containing the alias above or enter manually in the current shell.
We also set the `showUntrackedFiles` flag to no on this repository.
```
dotfiles config --local status.showUntrackedFiles no
```
Afterwards, to have git download all dotfiles into our system, run:
```
dotfiles checkout
```

## Setup Troubeshooting
### Existing files
Git throws an error if files from the repository already exist locally.
To solve this, we simply have to backup/remove them.

# Usage 
This repository is managed as described in [this blogpage](https://atlassian.com/git/tutorials/dotfiles), based on the comment by *StreakyCobra* on [Hacker News](https://news.ycombinator.com/item?id=11070797).

The setup here is that a git repository is created in a sub-directory of `$HOME`: `$HOME/dv/an/dotfiles`. An `alias` is then created where we manually specify the git directory and the working directory. `alias dotfiles="/usr/bin/git --git-dir=$HOME/dv/an/dotfiles --work-tree=$HOME"`.

This setup allows us to add all files in `$HOME` to the repostiory without the need of using symbolic links. We can simply use: `dotfiles add .zshrc`.
