#!/bin/bash
NUM=$2

for ((i=1; i<=$1; i++)); do
  echo -n `hostname`
  for((k=i;k<=$1;k++)); do
  echo -n " ";
  done
    for((j=1; j<=i; j++)); do
    echo -n "."
    done
      for((m=1;m<i;m++)); do
      echo -n "."
      done
echo
done | sed "${NUM}q;d"
