#!/bin/bash

source ~/.shell/prompt.sh
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

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

echo ""
echo ""
__ttai " $USER "

