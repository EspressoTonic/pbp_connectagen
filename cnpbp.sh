#!/bin/bash

# perl SPN_PBP-Gene_Typer.pl -c /data5/wycho/spn/test/KG-16_unfiltered.fasta -n CMC -r /data5/wycho/spn/pbp_connectagen/Spn_Reference_DB/MOD_bLactam_resistance.fasta -o /data5/wycho/spn/result/ -s "SPN" -p '1A,2B,2X'

while getopts :s:n:o:
do
  case $option in
      s) scaffold_file=$OPTARG;;
      n) sample_name=$OPTARG;;
      o) out_dir=$OPTARG;;
  esac
done

echo "Running PBP check"
perl SPN_PBP-Gene_Typer.pl -c "$scaffold_file" -n "$sample_name" \
    -r /data5/wycho/spn/pbp_connectagen/Spn_Reference_DB/MOD_bLactam_resistance.fasta \
    -o "$out_dir" -s "SPN" -p '1A,2B,2X'
echo "Done running PBP check"
echo "Results"
cat "$out_dir"/cat TEMP_pbpID_Results.txt
echo "Removing results..."
rm "$out_dir"/*
