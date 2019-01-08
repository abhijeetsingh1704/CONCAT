#!/bin/bash/

#This program makes concatanate sequence for the multifasta file
#written by Abhijeet Singh {abhijeetsingh.aau@gmail.com}

echo "Input your multifasta file name"
read filename
fasta_file=filename
grep -v '^>' ${!fasta_file} > ${!fasta_file}_1
perl -pe '/^>/ ? print "\n" : chomp' ${!fasta_file}_1 > ${!fasta_file}_12
sed -e '1i\>Concatanate_sequence' ${!fasta_file}_12 > ${!fasta_file}_concatanate.fasta
rm -f ${!fasta_file}_1 ${!fasta_file}_12

echo "Your concatanated fasta sequence is in the file named below "
echo "================================="
echo "${!fasta_file}_concatanate.fasta"
echo "================================="
