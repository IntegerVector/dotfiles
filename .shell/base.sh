#!/bin/zsh

source ~/.shell/prompt.sh
source ~/.shell/resources.sh
source ~/.shell/aliases.sh
source ~/.shell/utils.sh
source ~/.shell/commands.sh

# os specific
case $(__get_os_name) in
  "Linux")
    source ~/.shell/linux.sh
    ;;
  "Darwin")
    source ~/.shell/darwin.sh
    ;;
esac

# additional configs
source ~/.shell/custom.sh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

__show_random_header_img

