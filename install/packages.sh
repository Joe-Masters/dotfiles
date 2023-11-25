#!/usr/bin/sh

. ./functions.sh

install_packages() {
  title "Installing packages"
  if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
    VER=$VERSION_ID
  elif [ -f /etc/debian_version ]; then
    OS=debian
    VER=$(cat /etc/debian_version)
  fi
  case "${OS}" in
    fedora) PACKMAN=dnf; INSTALL_ARGS=y;;
    debian) PACKMAN=apt-get; INSTALL_ARGS=y;;
  esac

  info "Detected machine is running ${OS} ${VER}, attempting to use ${PACKMAN}"

  "${PACKMAN}" install \
    git \
    bash-completion \
    python \
    tmux \
    tree \
    ranger \
    neovim \
    python3-neovim \
    -"${INSTALL_ARGS}"
}
