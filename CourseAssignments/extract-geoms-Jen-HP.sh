#!/bin/bash

file=$1

function optimize() {
  grep -A 14 "Optimization Cycle" $file >> $file.extract

}
