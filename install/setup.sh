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

  CONFIG="${HOME}/.config"
  info "Installing config to ${CONFIG}"
  if [ -f "${CONFIG}" ]; then
    info "Making ${CONFIG} directory"
    mkdir -p "${CONFIG}"
  fi

  DOTFILES_CONFIG=$(find "$DOTFILES/config" -maxdepth 1 2>/dev/null)
  for config in $DOTFILES_CONFIG; do
    target="$CONFIG/$(basename $config)"
    if [ -e "$target" ]; then
        info "~${target#$HOME} already exists... Skipping."
    else
        info "Creating symlink for $config"
        ln -s "$config" "$target"
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

