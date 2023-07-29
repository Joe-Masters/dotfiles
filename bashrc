# .bashrc

function source_if_exists() {
  if [ -f "${1}" ]; then
    . "${1}"
  fi
}

source_if_exists /etc/bashrc
source_if_exists /usr/share/bash-completion/bash_completion
source_if_exists ~/scripts/git_prompt.sh


# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
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

alias ls="ls -hal --color"
alias vi="vim"
alias vim="nvim"
alias view="gnome-open"
alias open="gnome-open"

# Prompt

# Disable python venv prompt and replace with custom handler
export VIRTUAL_ENV_DISABLE_PROMPT=1

function virtualenv_info()
{
  [[ -n "$VIRTUAL_ENV" ]] && printf "(${VIRTUAL_ENV##*/}) "
}

function rightprompt()
{
    printf "%*s" $COLUMNS "$(date +%A\ %H\:%M\:%S)"
}
DATEPROMPT="\033[2;36m\[\$(tput sc; rightprompt; tput rc)\]\033[0m"
NERDPROMPT=$(printf "\ue34b  ")
USERPROMPT="\033[95m\u\033[0m"
AT_PROMPT="\033[36;2m@\033[0m"
HOSTPROMPT="\033[95;1m\h\033[0m"
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWUNTRACKEDFILES=true
VENV_PROMPT="\033[2;36m\[\$(virtualenv_info)\]\033[0m"
PS1="\
${DATEPROMPT}\
${VENV_PROMPT}\
${USERPROMPT}${AT_PROMPT}${HOSTPROMPT}:\w\
\$(__git_ps1) \
\n${NERDPROMPT}${RESET}"

unset rc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Terminal stuff
export TERMINFO=/etc/terminfo

. "$HOME/.cargo/env"
source /home/joe/dev/alacritty/extra/completions/alacritty.bash

# Set nvim to be default editor
export EDITOR=/usr/bin/nvim
