#!/bin/bash
FN=$1
LINES="cat $1 | wc -l"
for i in $(seq 1 $LINES); do
  line=`head -$i $1 | tail -1` ;
    if [ $line == `hostname` ]; then ./tree2.sh `cat $1 | wc -l` $i ;
    fi ;
done
