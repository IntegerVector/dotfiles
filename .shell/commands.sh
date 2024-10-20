#!/bin/bash

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
  if [ $1 = "setup" ]
  then
    __setup_os
  fi
}

