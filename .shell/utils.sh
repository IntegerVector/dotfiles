#!/bin/bash

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

  ssh-keygen -t ed25519 -C "andrii.ruban@outlook.com"
  eval "$(ssh-agent -s)"

  case $(__get_os_name) in
    "Linux")
      ssh-add ~/.ssh/id_ed25519

      sudo apt install -y flatpak gnome-software-plugin-flatpak
      ;;
    "Darwin")
      touch ~/.ssh/config
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

  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

  nvm ls-remote
}

__clear_os () {
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
  __show_header_image_$(($RANDOM/10000))
}

__show_header_image_0 () {
  echo "$_IMG_PENGUIN"
}

__show_header_image_1 () {
  echo "$_IMG_PIKACHO"
}

__show_header_image_2 () {
  echo "$_IMG_SAILOR_MOON_LUNA"
}

__show_header_image_3 () {
  echo "$_IMG_EYES"
}

