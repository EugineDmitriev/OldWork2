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

echo "--------------------"
read -p "Enter index line from 0 to $((n-1)): " p
read -p "Enter index row from 0 to $((n-1)): " q
if [ $p -ge $n -o $q -ge $n ]; then
    echo "Wrong"
    exit
fi
echo

for ((i=0, j=0; i<n;)); do
    if [ $i -eq $q ]; then
        ((i++))
        continue
    elif [ $j -eq $p ]; then
        ((j++))
        continue
    fi
    tmp=${matrix[$p,$i]}
    matrix[$p,$i]=${matrix[$j,$q]}
    matrix[$j,$q]=$tmp
    ((j++))
    ((i++))
done

echo "New matrix"

echo "--------------------"

for ((i = 0; i < n; i++)); do
    for ((j = 0; j < n; j++)); do
        printf "%-4d" ${matrix[$i,$j]}
    done
    echo
done

echo "--------------------"
