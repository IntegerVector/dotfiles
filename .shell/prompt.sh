#!/bin/zsh

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats ' %b'
zstyle ':vcs_info:git:*' actionformats ' %b|%a>'

setopt PROMPT_SUBST
PS1='%B%F{cyan}$(echo "\n\n\n %~")%f%b %F{yellow}${vcs_info_msg_0_}%f $(echo "\n\n   ")'

