#!/bin/bash
--sort into pieces
FN=$1
PC=$2;
LCNT=`cat $1 | wc -l`;
PC_SIZE=$(($LCNT/$PC));
LEFTOVER=$(($LCNT%$PC));

for ((i=1; i<=$PC; i++)); do
   head -$(($PC_SIZE*$i)) $FN | tail -$PC_SIZE  > piece.$i;
   sort piece.$i > piece.$i.sorted &
done;

tail -$LEFTOVER $FN >piece.$i
sort piece.$i > piece.$i.sorted;

sort -m piece.*.sorted > sorted.$2.txt;
rm piece.*
