#!/bin/bash
touch standart_deviation.txt
line_count=`awk 'END{print NR}' average.txt`
for ((i=1;i<=$line_count;i++))
do
	sd=`tail -8 results/tables/dfrmsd/result_$i.txt | awk '{sum+=$1; sumsq+=$1*$1} END {print sqrt(sumsq/NR - (sum/NR)**2)}'`
	echo "$sd - $i" >> standart_deviation.txt
	echo "$i/$line_count"
done
sort -go standart_deviation.txt standart_deviation.txt
echo "Process finished."
read
