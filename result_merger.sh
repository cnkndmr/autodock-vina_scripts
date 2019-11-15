#!/bin/bash
mkdir results
res1=$(ls results1 | wc -l)
res2=$(ls results2 | wc -l)
total_res=$(echo "$((res1 + res2))")
cp results1/* results/
x=1
for ((i=$((res1+1));i<=$total_res;i++))
do
	cp results2/result_$x.txt results/result_$i.txt
	x=$((x+1))	
done
