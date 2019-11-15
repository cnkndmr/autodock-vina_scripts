#!/bin/bash
if [ ! -d "results" ]
then
	echo "No 'results' folder found!"
	exit 1
fi
if [ $(ls | grep "results_table.csv" | wc -l) -eq 0 ]
then
	echo "Average dist from rmsd value,Maximum dist from rmsd value,Lowest affinity value,Average best mode rmsd value,Result seed,Result number" > results_table.csv
fi
result_count=$(ls -A results | wc -l)
for ((i=1;i<=result_count;i++))
do
	linenum=$(wc -l results/result_$i.txt | awk -F' ' '{print $1}')
	if [ "$linenum" -gt 35 ]
	then
		dist_from_rmsd_average=$(sed '0,/^mode/d' results/result_$i.txt | sed '1,2d;12d' | awk -F' ' '{print $3}' | awk '{sum+=$1} END {print sum/8}')
		dist_from_rmsd_maximum=$(sed '0,/^mode/d' results/result_$i.txt | sed '1,2d;12d' | awk -F' ' '{print $3}' | sort -n | tail -1)
		best_affinity=$(sed '0,/^mode/d' results/result_$i.txt | sed '1,2d;12d' | awk -F' ' '{print $2}' | sort -n | head -1)
		best_mode_rmsd_average=$(sed '0,/^mode/d' results/result_$i.txt | sed '1,2d;12d' | awk -F' ' '{print $4}' | awk '{sum+=$1} END {print sum/8}')
		docking_seed=$(grep "seed" results/result_$i.txt | awk '{print $4}')
		echo "$dist_from_rmsd_average,$dist_from_rmsd_maximum,$best_affinity,$best_mode_rmsd_average,$docking_seed,$i" >> results_table.csv
		echo "$i/$result_count"
	else
		echo "$i/$result_count ERROR"
	fi
done
sort -go results_table.csv results_table.csv
echo "Finished."
