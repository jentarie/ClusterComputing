#!/bin/bash

file1=$1
file2=$2

function displacement() {
  lines=`cat $1 | wc -l`
  for ((i=1; i<=$lines; i++)); do
    X1="$(sed -n "$i p" $1 | awk '{print $3}')";
    Y1="$(sed -n "$i p" $1 | awk '{print $4}')";
    Z1="$(sed -n "$i p" $1 | awk '{print $5}')";
    X2="$(sed -n "$i p" $2 | awk '{print $3}')";
    Y2="$(sed -n "$i p" $2 | awk '{print $4}')";
    Z2="$(sed -n "$i p" $2 | awk '{print $5}')";
    DX="$(echo "scale=2; $X1-$X2" | bc)";
    DY="$(echo "scale=2; $Y1-$Y2" | bc)";
    DZ="$(echo "scale=2; $Z1-$Z2" | bc)";
    echo "ATOM$i:disp. = $D ($X1,$Y1,$Z1) -> ($X2,$Y2,$Z2)"
  done;
}
displacement $1 $2;
