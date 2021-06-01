#!/bin/bash

function beer() {
  if [ "$1" -lt "1" ]; then
    echo -n "all the beers!";
  else
    echo -n "beer, "
    beer $(($1-1))
  fi
}
beer $1;
