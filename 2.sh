#!/bin/bash
read -p "Enter size of matrix: " n
declare -A matrix

for ((i = 0; i < n; i++)); do
    for ((j = 0; j < n; j++)); do
        matrix[$i,$j]=`shuf -i 0-200 -n 1`
    done
done

echo "--------------------"
echo "The matrix $n x $n:"

for ((i = 0; i < n; i++)); do
    echo -n " "
    for ((j = 0; j < n; j++)); do
        printf " %3d" ${matrix[$i,$j]}
    done
    echo " "
done

count=0
for ((j = 0; j < n; j++)); do
    for ((i = 0; i < n; i++)); do
        let count=count+matrix[$i,$j]
    done
let count=count/n
echo "Stolb $j $count "
count=0
done
