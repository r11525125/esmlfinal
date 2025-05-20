#!/bin/sh
#MyApp="dmasg.bin"
#export PATH=$PATH:<<PATH_TO_MODELSIM>>/bin/vsim

dateVar=`date +%Y-%m-%d_%H-%M-%S`
stamp="SimSOC_$dateVar"
byte=32

if [ -z "$MyApp" ]
then
        echo "MyApp variable isn't set, running DEFAULT DMA APP..."
        echo "Copy your software bin file, eg.blinkAndEcho.bin to this directory"
        echo "Set MyApp environment variable as your software bin file name"
else
	echo "Converting $MyApp to MEM.TXT"
	app_file="hex_apps.txt"
	app1_file="hex_apps_1.txt"
	appt_file="hex_apps_trim.txt"
	if [ -f "MEM.TXT" ]; then
		rm MEM.TXT
	fi
	
	od -An -vtx1 -w16 $MyApp | cut -c2- > hex_apps.txt
	
	while IFS= read -r line
	do
		echo $line | sed 's/ //g' >> $app1_file 
	done < "$app_file"
	
	while IFS= read -r line
	do
		echo $line | ./endian.sh >> $appt_file 
	done < "$app1_file"
	
	cat hex_dummy.txt hex_apps_trim.txt > MEM.TXT
	
	rm $app_file $app1_file $appt_file  
fi

mkdir -p $stamp
cp *.bin $stamp
cp *.do $stamp
cp *.v $stamp
cp *.vh $stamp
cp *.TXT $stamp

cd $stamp
vsim -do sim.do

