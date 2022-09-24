#!/usr/bin/sh

DOTFILES="$(pwd)"
COLOR_GRAY="\033[1;38;5;243m"
COLOR_BLUE="\033[1;34m"
COLOR_GREEN="\033[1;32m"
COLOR_RED="\033[1;31m"
COLOR_PURPLE="\033[1;35m"
COLOR_YELLOW="\033[1;33m"
COLOR_NONE="\033[0m"

title() {
  echo -e "\n${COLOR_PURPLE}$1${COLOR_NONE}"
  echo -e "$S{COLOR_GRAY}==========================${COLOR_NONE}\n"
}


info() {
    echo -e "${COLOR_BLUE}Info: ${COLOR_NONE}$1"
}

get_linkables() {
    find -H "$DOTFILES" -maxdepth 3 -name '*.symlink'
}


setup_symlinks() {
    title "Creating symlinks"
	
    for file in $(get_linkables) ; do
	target="$HOME/.$(basename "$file" '.symlink')"
	if [ -e "$target" ]; then
	   info "~${target#$HOME} already exists... Skipping." 
}


case "$1" in
    get_linkables)
		get_linkables
		;;
esac	
	    
