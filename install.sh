#!/usr/bin/env bash

set -e
echo ''

DOTFILES_ROOT="~/.dotfiles"
DOTFILES_REPO="https://github.com/mhar-andal/dotfiles.git"

if [[ ! -d ${DOTFILES_ROOT} ]]; then
  echo "Cloning repo"
  git clone ${DOTFILES_REPO} ${DOTFILES_ROOT}
fi

CONFIG="install.conf.yaml"
DOTBOT_DIR="dotbot"

DOTBOT_BIN="bin/dotbot"
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "${BASEDIR}"

git submodule update --init --recursive "${DOTBOT_DIR}"

"${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" -c "${CONFIG}" "${@}"
