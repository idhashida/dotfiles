# for macos
if test -e "/opt/homebrew/bin"
    fish_add_path "$HOME/opt/homebrew/bin"
end

set -x GOPATH $HOME/.local/share/mise/installs/go
fish_add_path $GOPATH/bin
fish_add_path $HOME/.local/bin

set -U fish_greeting
set -gx DO_NOT_TRACK 1
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx MANPAGER "nvim +Man!"

# Запускает виртуальную машину для docker
alias colimastart="colima start --profile ozon --cpu 2 --disk 60"
# Останавливает виртуальную машину для docker
alias colimastop="colima stop ozon"

alias lg="lazygit"

# eza (better ls)
alias l="eza --icons"
alias ls="eza --icons"
alias ll="eza -l --icons"
alias la="eza -la --icons"

# o3-cli
alias o3="~/.o3-cli/bin/o3"

# zoxide (better cd)
zoxide init fish | source
