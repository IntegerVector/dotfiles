#!/bin/zsh

run () {
  if [ $1 = "get" ]
  then
    if [ $2 = "ip" ]
    then
      __get_ip
    fi
    if [ $2 = "os" ]
    then
      __get_os_name
    fi
  fi
  if [ $1 = "install" ] || [ $1 = "i" ]
  then
    if [ -n $2 ]
    then
      __install $2
    fi
  fi
  if [ $1 = "os" ]
  then
    if [ $2 = "setup" ]
    then
      __setup_os
    fi
    if [ $2 = "clean" ]
    then
      __clean_os
    fi
    if [ $2 = "update" ]
    then
      __update_os
    fi
  fi
}

