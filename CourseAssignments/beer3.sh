#!/bin/bash

echo -n "Beer, ";
function beer() {
  if [ "$1" -lt "1" ]; then
    echo "all the beers!";
  elif [ "$1" -eq "1" ]; then
    echo -n "more beer, ";
    beer $(($1-1))
  else
    echo -n "beer, ";
    beer $(($1-1))
  fi
}
beer $(($1-1));
