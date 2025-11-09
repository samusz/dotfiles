if status is-interactive
    # Commands to run in interactive sessions can go here
end

if type -q tmux
    tmux attach-session -t default || tmux new-session -s default
end

set -gx EDITOR nvim
set -gx PATH ~/.asdf/shims $PATH
set -gx PATH ~/.local/bin $PATH
