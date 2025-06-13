#!/bin/bash
INITIAL_WORKING_DIRECTORY=$(pwd)

cd "$(dirname "$0")"

BASELINE_DIR=.

INPUT_DIR=..
INPUT_PATH="${INPUT_DIR}/6_to_8am.csv"

RESULTS_DIR=baseline_results

MIN_N_RSUS=43
MAX_N_RSUS=423
N_RSUS_STEP=10

rm -rf "$RESULTS_DIR"
mkdir "$RESULTS_DIR"

mkdir "$RESULTS_DIR/rsu=[${MIN_N_RSUS}_${MAX_N_RSUS}_${N_RSUS_STEP}]"

for ((n_rsus = $MIN_N_RSUS; n_rsus <= $MAX_N_RSUS; n_rsus += $N_RSUS_STEP))
do
  $BASELINE_DIR/baseline "$n_rsus" "$INPUT_PATH"

  rm *summary*
  mv *rsus* "$RESULTS_DIR/rsu=[${MIN_N_RSUS}_${MAX_N_RSUS}_${N_RSUS_STEP}]"
done