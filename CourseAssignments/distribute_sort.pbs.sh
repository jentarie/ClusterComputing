#PBS -l walltime=5:00
#PBS -l nodes=3:ppn=16
#PBS -q tiny16core
#PBS -o sort.$PBS_JOBID
#PBS -N sort_jmbeals

cd $PBS_O_WORKDIR
PC=48
FN='/scratch/jmbeals/smallfile.fastq';
LCNT=`cat $FN | wc -l`;
PC_SIZE=$(($LCNT/$PC));
LEFTOVER=$(($LCNT%$PC));

for ((i=1; i<=$PC; i++)); do
   head -$(($PC_SIZE*$i)) $FN | tail -$PC_SIZE > piece.$i;
done;

tail -$LEFTOVER $FN >> piece.$PC


cp $PBS_NODEFILE nodefile
for n in `uniq $PBS_NODEFILE`; do
   ssh $n "cd $PBS_O_WORKDIR; ./nodesort.sh nodefile"
done;

for n in `uniq $PBS_NODEFILE`; do
   while [ `ls $n.finished|wc -l` -eq 0 ]; do
       sleep 1;
   done;
done
sort -m -n -k1 piece.*.sorted > sorted.$PC.txt;
wait;
rm piece.*
rm *.finished
