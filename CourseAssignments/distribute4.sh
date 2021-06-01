#PBS -n sort4CaP
#PBS -o sortCaP.$PBS_JOBID
#PBS -j oe
#PBS -l walltime=1:00
#PBS -l nodes=3:ppn=16
#PBS -q tiny16core

cd $PBS_O_WORKDIR

FN="/scratch/kmdowney/Crime_and_Punishment_random.txt"
PC=48;

cp $PBS_NODEFILE nodefile
for n in `uniq $PBS_NODEFILE`; do
   ssh $n "cd $PBS_O_WORKDIR; ./nodecode4.sh nodefile"

for n in `uniq $PBS_NODEFILE`; do
   while [ `ls $n.finished|wc -l` -eq 0 ]; do
       sleep 1;
   done;
done

sort -n -m piece.*.sorted > sorted.$PC.txt;
