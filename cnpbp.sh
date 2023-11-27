#!/bin/bash

# perl SPN_PBP-Gene_Typer.pl -c /data5/wycho/spn/test/KG-16_unfiltered.fasta -n CMC -r /data5/wycho/spn/pbp_connectagen/Spn_Reference_DB/MOD_bLactam_resistance.fasta -o /data5/wycho/spn/result/ -s "SPN" -p '1A,2B,2X'

while getopts s:n:o: option
do
  # shellcheck disable=SC2220
  case $option in
      s) scaffold_file=$OPTARG;;
      n) sample_name=$OPTARG;;
      o) out_dir=$OPTARG;;
  esac
done

# Get the path of the current script
script_path="$$0"

if [ -z "$out_dir" ]; then
  echo "CANNOT BE EXECUTED"
else
  echo "Scaffold file is $scaffold_file"
  echo "sample name is $sample_name"
  echo "out directory is $out_dir"

  echo "Running PBP check"
  perl "$script_path"/SPN_PBP-Gene_Typer.pl -c "$scaffold_file" -n "$sample_name" -r /data5/wycho/spn/pbp_connectagen/Spn_Reference_DB/MOD_bLactam_resistance.fasta -o "$out_dir" -s "SPN" -p '1A,2B,2X'
  echo "Done running PBP check"
  echo "Results"
  cat "$out_dir"/TEMP_pbpID_Results.txt
  echo "Running MIC prediction"
  bash "$script_path"/bLactam_MIC_Rscripts/PBP_AA_sampledir_to_MIC_20180710.sh "$out_dir" "$script_path"
  # rm "$out_dir"/*
fi
  #

