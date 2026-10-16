#!/bin/zsh

setup () {
  touch ~/.hushlogin
  git config --global user.name IntegerVector
  git config --global user.email andrii.ruban@outlook.com
  git config --global alias.b branch
  git config --global alias.c commit
  git config --global alias.s status
  git config --global alias.a add
  git config --global alias.last 'log -1 HEAD'
  git config --global alias.amend 'commit --amend --no-edit'
  git config --global init.defaultBranch main
  git config --global push.autoSetupRemote true
  git config --global push.default simple

  ssh-keygen -t ed25519 -C "andrii.ruban@outlook.com"
  eval "$(ssh-agent -s)"

  case $(uname -s) in
    "Linux")
      ssh-add ~/.ssh/id_ed25519
      ;;
    "Darwin")
      echo "Host github.com" >> ~/.ssh/config
      echo "  AddKeysToAgent yes" >> ~/.ssh/config
      echo "  IdentityFile ~/.ssh/id_ed25519" >> ~/.ssh/config
      ssh-add --apple-use-keychain ~/.ssh/id_ed25519

      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      eval "$(/opt/homebrew/bin/brew shellenv)"
      ;;
  esac

  # Dev tools:
  # Rust
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  # Bun
  curl -fsSL https://bun.com/install | bash
  # Python UV
  curl -LsSf https://astral.sh/uv/install.sh | sh
  # Headroom for AI
  uv tool install --python 3.13 "headroom-ai[all]"
  # RTK
  curl -fsSL https://raw.githubusercontent.com/rtk-ai/rtk/master/install.sh | sh
  # OpenCode
  curl -fsSL https://opencode.ai/v2/install | bash

  rtk init -g --opencode
}

