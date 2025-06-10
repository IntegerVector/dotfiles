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

  case $(run "get_os_name") in
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
}

