#!/bin/bash

start=$1
int=$2

function printnums() {
  if [ "$1" -gt "100" ]; then
    echo $1;
  else
    echo -n "$1 "
    printnums $(($1+$int))
  fi
}
printnums $1;
