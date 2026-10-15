#!/bin/zsh

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

bindkey -v

zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit && compinit

insert-newline() {
  LBUFFER+=$'\n'
}

delete-empty-line-backward() {
  if [[ $LBUFFER == *$'\n' && ( -z $RBUFFER || $RBUFFER == $'\n'* ) ]]; then
    LBUFFER=${LBUFFER%$'\n'}
  else
    zle backward-delete-char
  fi
}

zle -N insert-newline
zle -N delete-empty-line-backward

bindkey '^M' accept-line
bindkey '^[[27;2;13~' insert-newline
bindkey '^?' delete-empty-line-backward

