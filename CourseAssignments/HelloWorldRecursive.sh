#!/bin/bash

n=$1

function HelloWorld() {
  if [ "$1" -lt "1" ]; then
    echo "Hello World!";
  else
    echo "Hell No! "
    HelloWorld $(($1-1))
  fi
}
HelloWorld $1;
