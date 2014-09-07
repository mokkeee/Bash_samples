#!/bin/bash

#sample commands
commands=(
	"ls -l"
	"pwd"
	"ls /tmp"
	"ls /abc"	# error command(not exists directory)
)
loop_num=${#commands[@]}

pids=()
for (( i=0; i<$loop_num; i++ ))
do
	echo  ${commands[$i]}
	eval ${commands[$i]} &
	pids[$i]=$!
done

ret_code=()
for (( i=0; i<$loop_num; i++ ))
do
	wait ${pids[$i]}
	ret_code[$i]=$?
done

for (( i=0; i<$loop_num; i++ ))
do
	echo ${ret_code[$i]}
done
