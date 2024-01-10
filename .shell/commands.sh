#!/bin/bash

run () {
  if [ $1 = "get" ]
  then
    if [ $2 = "ip" ]
    then
      __get_ip
    fi
  fi
  if [ $1 = "os" ]
  then
    if [ $2 = "setup" ]
    then
      __setup_os
    fi
    if [ $2 = "clear" ]
    then
      __clear_os
    fi
    if [ $2 = "update" ]
    then
      __update_os
    fi
  fi
}

