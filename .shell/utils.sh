#!/bin/zsh

__get_ip () {
  curl ifconfig.me
}

__get_os_name () {
  uname -s
}

__install () {
  case $(__get_os_name) in
    "Linux")
      sudo apt install -y $1
      ;;
    "Darwin")
      brew install $1
      ;;
  esac
}

__setup_os () {
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

  ssh-keygen -t ed25519 -C "andrii.ruban@outlook.com"
  eval "$(ssh-agent -s)"

  case $(__get_os_name) in
    "Linux")
      ssh-add ~/.ssh/id_ed25519

      sudo apt install -y flatpak gnome-software-plugin-flatpak
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

  __install vim
  __install kitty

  nvm ls-remote
}

__clean_os () {
  rm -rf ~/.tmp
  case $(__get_os_name) in
    "Linux")
      sudo apt autoremove
      sudo apt clean
      flatpak uninstall --unused
      ;;
    "Darwin")
      brew cleanup --prune=all
      ;;
  esac
}

__update_os () {
  case $(__get_os_name) in
    "Linux")
      sudo apt update && sudo apt upgrade
      flatpak update
      ;;
    "Darwin")
      brew update && brew upgrade
      ;;
  esac
}

__show_random_header_img () {
  echo "$_HEADER_IMG_UWU"
}

