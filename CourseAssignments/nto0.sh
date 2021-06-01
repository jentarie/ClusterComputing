#!/bin/bash

#num=$1;
#
#function fact() {
#   if [ "$1" -lt 2 ]; then
#      rv=1;
#   else
#      prev=$(($1-1));
#      fact $prev;
#      fact_prev=$retval;
#      rv=$(($1 * $fact_prev));
#   fi
#   echo ${FUNCNAME[@]};
#   retval=$rv;
#}
#
#fact $num;
#echo "Factorial of $num is $retval";


#num=$1

#function nto0() {
# echo $num
# if [ "$new" -lt 1 ]; then
#  echo $new
# else
#  new=$(($num-1))
#  echo -n $new;
# fi
#}


function nto0 () {
  if [ "$1" -lt "1" ]; then
    echo $1;
  else
    echo -n "$1 "
    nto0 $(($1-1))
  fi
}
nto0 $1;
