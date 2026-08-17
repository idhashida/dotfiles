#!/usr/bin/env fish

set pane_dir (tmux display-message -p '#{pane_current_path}')
set pane_id (tmux display-message -p '#{pane_id}')
set pane_pid (tmux display-message -p '#{pane_pid}')

# Проверка AI
set ai_mode false
if pgrep -P "$pane_pid" -f "claude" >/dev/null
    set ai_mode true
end

# Git root
set git_root (cd "$pane_dir"; git rev-parse --show-toplevel 2>/dev/null; or echo "$pane_dir")

# Выбор файлов
set selected (cd "$git_root"; fd --type f --hidden --follow --exclude .git | \
    fzf --multi --height 100% --color=bg:#090B10,fg:#e0def4,hl:#c4a7e7,fg+:#e0def4,bg+:#403d52,hl+:#9ccfd8,info:#6e6a86,prompt:#31748f,pointer:#ebbcba,marker:#eb6f92,spinner:#f6c177,header:#6e6a86,border:#26233a --preview "bat --style=numbers --color=always {}")

if test -z "$selected"
    exit 0
end

# Форматирование
if test "$ai_mode" = true
    set output (string join ' ' (string replace -r '^' '@' (string split ' ' $selected)))
else
    set output (string join ' ' (string escape -- $selected))
end

tmux send-keys -t "$pane_id" "$output"
