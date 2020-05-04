#!/bin/sh 

wmctrl -l | grep -F 'Mozilla Firefox' | awk '{print $1;}' > /tmp/addsBlockSave

echo "Firefox Adds Block script is running!"
echo "Press Ctrl + C to stop it..."

while true
do
	wmctrl -l | grep -F 'Mozilla Firefox' | awk '{print $1;}' > /tmp/addsBlockTmp
	sleep 0.15s
	diff --changed-group-format='%<' --unchanged-group-format='' /tmp/addsBlockTmp /tmp/addsBlockSave | 
		while read -r line
		do 
			wmctrl -ic $line
		 	#echo "close"
		done
done

# sudo teleport fjuчr @ iam marsovac . bleja
