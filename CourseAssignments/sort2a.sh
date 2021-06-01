FN=$1;
PC=`wc -l $PBS_NODEFILE`;
LCNT=`cat $1 | wc -l`;
PC_SIZE=$(($LCNT/$PC));
LEFTOVER=$(($LCNT%$PC));
echo "Piece size is $PC_SIZE";
echo "Leftover piece size is $LEFTOVER";
echo "Total # lines is $(($PC*$PC_SIZE+$LEFTOVER))";

for ((i=1; i<=$PC; i++)); do
   head -$(($PC_SIZE*$i)) $FN | tail -$PC_SIZE > piece.$i;
   sort piece.$i > piece.$i.sorted &
   pids[$i]=$!;
done;

tail -$LEFTOVER $FN >piece.$i
sort piece.$i > piece.$i.sorted &
pids[$i]=$!;

for ((i=1; i<=$(($PC+1)); i++)); do
    wait ${pids[$i]};
done
echo "Total lines in sorted document is $(wc -l sorted2.$2.txt)";
sort -m piece.*.sorted > sorted.$PC.txt;
