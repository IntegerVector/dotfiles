#!/bin/zsh

run () {
  previous_dir=$(pwd)
  cd ~/.shell
  luajit 'run.lua' $@
  cd $previous_dir
}

