#!/bin/bash
                # argument 1 is a listing of nodes
                # assigned to the PBS job ($PBS_NODEFILE)
i=0;
for node in `cat $1`; do              # go through each line of PBS_NODEFILE
   if [ "$node" == `hostname` ]; then # if line contains the hostname of the
      ./dosomething.sh p$i &          # the node script is running on lauch
   fi;                                # a background process
   i=$(($i+1));
done;
wait;
touch `hostname`.finished;
