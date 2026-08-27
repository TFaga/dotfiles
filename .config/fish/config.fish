if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Brew
set --global --export HOMEBREW_PREFIX "/opt/homebrew";
set --global --export HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set --global --export HOMEBREW_REPOSITORY "/opt/homebrew";
fish_add_path --global --move --path "/opt/homebrew/bin" "/opt/homebrew/sbin";
if test -n "$MANPATH[1]"; set --global --export MANPATH '' $MANPATH; end;
if not contains "/opt/homebrew/share/info" $INFOPATH; set --global --export INFOPATH "/opt/homebrew/share/info" $INFOPATH; end;

# Environment
set --global --export EDITOR vim
set --global --export XDG_CONFIG_HOME $HOME/.config
set --global --export XDG_CACHE_HOME $HOME/.cache
set --global --export XDG_DATA_HOME $HOME/.local/share
set --global --export XDG_STATE_HOME $HOME/.local/state

# Config git dotfiles
alias config "/usr/bin/git --git-dir=$HOME/.local/share/dotfiles/ --work-tree=$HOME"

# Local Cellar
fish_add_path "$HOME/.local/bin"

# Libvirt
set --global --export LIBVIRT_HOST labnode-01
