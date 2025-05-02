# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

export PATH=$PATH:/opt/zig

# PS1='\[\e[0;38;5;82m\]$ \[\e[0;38;5;45m\]\u \[\e[0;38;5;45m\](\[\e[0;38;5;39m\]\W\[\e[0;38;5;45m\]) \[\e[0;1;38;5;45m\]>\[\e[0m\]'


# PS1='\[\e[0;4;53m\]\u\[\e[0;2;4;53m\]@\[\e[0;1;4;53m\]\w\[\e[0;1;4;53m\]>\[\e[0m\]'
# PS1='\[\e[0;2;38;5;160m\]# \[\e[0;1;38;5;160m\]\u \[\e[0;1;38;5;160m\]~\[\e[0m\]'
# PS1='\[\e[0;2m\]\$ \[\e[0m\]\u\[\e[0;2m\]@\[\e[0m\]\h \[\e[0m\](\[\e[0m\]\W\[\e[0m\]) \[\e[0;1m\]~ \[\e[0m\]'
# PS1='\[\e[0;2m\]\$ \[\e[0;1m\]\w \[\e[0;1m\]> \[\e[0m\]'
# PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# Git branch
parse_git_branch() {
  git rev-parse --is-inside-work-tree &>/dev/null || return
  branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
  echo " ($(basename "$branch"))"
}

# Show user@host only if in SSH
show_user_host() {
  [ -n "$SSH_CONNECTION" ] && echo -e "\[\e[38;5;140m\]$USER@$HOSTNAME "
}

# Update PS1 dynamically
update_ps1() {
  PS1="\$(show_user_host)\[\e[38;5;110m\]\w\[\e[0m\]\[\e[38;5;102m\]\$(parse_git_branch)\n\[\e[38;5;168m\]❯ \[\e[0m\]"
}
PROMPT_COMMAND=update_ps1
