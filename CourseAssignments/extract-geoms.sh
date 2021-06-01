#!/bin/bash

file=$1

function optimize() {
  sed -n '/Optimization Cycle/,/Point Group/p' $file > $file.extract1;
  egrep -v "Optimization|Coordinates|ATOM|Point|^$" $file.extract1 > $file.extract2;
  lines=`cat $file.extract2 | wc -l`;
  cycles=`grep "Optimization Cycle" $file.extract1 | wc -l`;
  echo "Number of optimization cycles performed: $cycles";
  steps=$(($lines/$cycles));
  echo "Number of atoms optimized: $steps";
  for ((i=1; i<=$cycles; i++)); do head -$(expr $steps \* $i) "$file.extract2" | tail -$steps > geom.$i ; done
}
optimize $1;
rm *.extract1
rm *.extract2
