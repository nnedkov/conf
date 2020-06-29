# .bashrc

# User specific aliases and functions


# extend PATH environment variable
export PATH=$PATH:~/bin


# global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

PS1="\[\e[31;1m\]\u@\[\e[33;1m\]\h:\[\e[34;1m\]\w\$(git branch 2>/dev/null | grep -e '\* ' | sed 's/^..\(.*\)/(\1)/')> \[\e[0m\]"

# aliases
alias grep='grep --color=auto'
alias mypubip='curl icanhazip.com'
alias gitaddmod=$'for i in `git status | awk \'/modified:/ { print $2 }\'`; do git add $i; done'
# TOADD:  (ls | xargs -n1 -P32 -iF mv F ../results) >& ../results-mv.log   # move in parallel
# git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

source <(kubectl completion bash)
