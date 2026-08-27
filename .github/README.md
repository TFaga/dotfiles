# dotfiles

Personal dotfiles managed with a [bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles).

## How it works

This repository uses the "bare repository" approach: the Git repository lives in
`~/.local/share/dotfiles/` and your home directory is treated as its working
tree. A small shell alias lets you run Git against it without clobbering other
repositories:

```sh
alias config="/usr/bin/git --git-dir=$HOME/.local/share/dotfiles/ --work-tree=$HOME"
```

## Install on a new machine

### One-liner

The fastest way to bootstrap is the `dotfiles-install` script, which performs
all of the manual steps below (clone over HTTPS, check out, hide untracked
files, and switch the remote to SSH). Pass `--setup` to also run
`dotfiles-setup` afterwards (Homebrew, Brewfile, fish as the login shell,
mise, and ffmpeg/ffprobe):

```sh
# Clone + check out only:
curl -fsSL https://raw.githubusercontent.com/TFaga/dotfiles/main/.local/bin/dotfiles-install | bash
```

```sh
# Clone, check out, and run the full setup/bootstrap:
curl -fsSL https://raw.githubusercontent.com/TFaga/dotfiles/main/.local/bin/dotfiles-install | bash -s -- --setup
```

Both scripts are idempotent and safe to re-run.

### Manual steps

```sh
# 1. Clone the bare repo
git clone --bare git@github.com:TFaga/dotfiles.git $HOME/.local/share/dotfiles

# 2. Define the alias (persist it in your shell rc afterwards)
alias config="/usr/bin/git --git-dir=$HOME/.local/share/dotfiles/ --work-tree=$HOME"

# 3. Check out the files (back up any conflicts first if needed)
config checkout

# 4. Hide untracked files (your whole $HOME) from `config status`
config config --local status.showUntrackedFiles no
```

## Usage

```sh
config status
config add ~/.gitconfig
config commit -m "feat: update gitconfig"
config push
```
