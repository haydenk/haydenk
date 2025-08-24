set fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.config/fish/functions/*.fish

fish_add_path --append "$HOME/.docker/bin"

eval $($HOMEBREW_PREFIX/bin/brew shellenv)
