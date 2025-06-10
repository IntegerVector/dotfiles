#!/bin/zsh

# os specific
case $(uname -s) in
  "Linux")
    source ~/.shell/linux.sh
    ;;
  "Darwin")
    source ~/.shell/darwin.sh
    ;;
esac

# generic
source ~/.shell/lua-utils.sh
source ~/.shell/setup.sh
source ~/.shell/zsh-base-cfg.sh
source ~/.shell/prompt.sh
source ~/.shell/decoration.sh
source ~/.shell/aliases.sh
source ~/.shell/dev-tools.sh

