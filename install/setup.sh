#!/usr/bin/sh

ORIGINGAL_WD="${PWD}"
cd "$(dirname "${0}")" || exit 1
DOTFILES="$(cd ..; pwd)"

. ./functions.sh
. ./packages.sh

get_linkables() {
    find -H "$DOTFILES" -maxdepth 3 -name '*.symlink'
}


setup_symlinks() {
  title "Creating symlinks"

  for file in $(get_linkables) ; do
  target="$HOME/.$(basename "$file" '.symlink')"
  if [ -e "$target" ]; then
    info "~${target#$HOME} already exists... Skipping." 
  else
    info "Creating symlink for ${file}"
    ln -s "${file}" "${target}"
  fi
  done

}


case "$1" in
    --all)
      setup_symlinks
      install_packages
      ;;
    --links)
      setup_symlinks;;
    --packages)
      install_packages;;
esac	

cd "${ORIGINGAL_WD}" || exit 1

