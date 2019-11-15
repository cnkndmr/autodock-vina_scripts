#!/bin/bash
maxattempt=1000
if [ ! -d "results" ]
then
	mkdir results
fi
config=$(ls | grep 'conf.txt')
result_count=$(ls -A results/ | wc -l)
for ((i = $result_count+1; i<=maxattempt; i++))
do
	echo "$i started..."
	vina --config $config > results/result_$i.txt
	echo "$i done."
done
echo "Process finished"
