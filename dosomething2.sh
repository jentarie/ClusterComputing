#!/bin/bash

myname=$1;
echo -n "" >numbers.$myname


stop=$(($RANDOM%5))
echo "I will be running for $stop seconds";
for ((i=0; i<$stop; i++)); do
   echo "$myname.$i" >> numbers.$myname
   sleep 1;
done

touch $myname.finished
