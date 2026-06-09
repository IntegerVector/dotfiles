#!/bin/zsh

export LUA_PATH="$HOME/.shell/?.lua;$HOME/.shell/?/init.lua;;"
export LUA_CPATH="$HOME/.shell/?.so;;"

run () {
  luajit ~/.shell/run.lua $@
}

