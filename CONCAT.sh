#!/bin/bash

#This program makes concatanate sequence for the multifasta file
#written by Abhijeet Singh {abhijeetsingh.aau@gmail.com}

if [ "$#" -gt 0 ]; then
	filename=$1
else
    clear
    echo "Input your multifasta file name: "
    read filename
fi
fasta_file=filename
clear
echo "Input your name of fasta header (without >): "
read header
header_name=header
grep -v '^>' ${!fasta_file} > ${!fasta_file}_1
grep -e '^>' ${!fasta_file} > ${!fasta_file}.log
perl -pe '/^>/ ? print "\n" : chomp' ${!fasta_file}_1 > ${!fasta_file}_12
length="$(cat ${!fasta_file}_12 | wc -c)"
sed -e "1i\>${!header_name}_${length}bp" ${!fasta_file}_12 > ${!fasta_file}_concat.fasta
rm -f "${!fasta_file}"{_1,_12}
echo "Your concatanated fasta sequence is in the file named below "
echo "================================="
echo "${!fasta_file}_concat.fasta"
echo "================================="
