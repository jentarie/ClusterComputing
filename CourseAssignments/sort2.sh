#!/bin/bash

LCNT=`cat $1 | wc -l`
PC=$2 # change to `wc -l $PBS_NODEFILE`
PC_SIZE=$(($LCNT/$PC))
LEFTOVER=$(($LCNT%$PC))
echo "Piece size is $PC_SIZE"
echo "Leftover piece size is $LEFTOVER"
echo "Total # lines is $(($PC*$PC_SIZE+$LEFTOVER))"

for ((i=1; i<=$PC; i++)); do head -$(($PC_SIZE*$i)) $1 | tail -$PC_SIZE > piece.$i ; done
tail -$LEFTOVER $1 >> piece.$i
for i in piece.*; do sort -n -k1 $i > $i.sorted & done;
wait
sort -m -n -k1 piece.*.sorted > sorted2.$2.txt;
echo "Total lines in sorted document is $(wc -l sorted2.$2.txt)"

rm piece.*
