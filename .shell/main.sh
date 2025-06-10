#!/bin/zsh

source ~/.shell/lua-utils.sh
source ~/.shell/setup.sh
source ~/.shell/zsh-base-cfg.sh
source ~/.shell/prompt.sh
source ~/.shell/decoration.sh
source ~/.shell/aliases.sh
source ~/.shell/dev-tools.sh

# os specific
case $(run "get_os_name") in
  "Linux")
    source ~/.shell/linux.sh
    ;;
  "Darwin")
    source ~/.shell/darwin.sh
    ;;
esac

