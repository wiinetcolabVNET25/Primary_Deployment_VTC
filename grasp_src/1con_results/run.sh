#!/bin/bash
INITIAL_WORKING_DIRECTORY=$(pwd)

cd "$(dirname "$0")"

N_DEPLOY_DIR=..

GRASP_RCL_LEN=15
N_ITER=1000
CONTACT_TIME=30
N_CONTACTS=1
RNG_SEED=123

INPUT_DIR=../..
INPUT_PATH="${INPUT_DIR}/6_to_8am.csv"

MIN_N_RSUS=43
MAX_N_RSUS=423
N_RSUS_STEP=10

RESULTS_DIR="rsu=[${MIN_N_RSUS}_${MAX_N_RSUS}_${N_RSUS_STEP}]"

rm -rf "$RESULTS_DIR"
mkdir "$RESULTS_DIR"

for ((n_rsus = $MIN_N_RSUS; n_rsus <= $MAX_N_RSUS; n_rsus += $N_RSUS_STEP))
do
    $N_DEPLOY_DIR/n-deployment $n_rsus $CONTACT_TIME $GRASP_RCL_LEN $N_ITER $N_CONTACTS $RNG_SEED $INPUT_PATH
done

wait

for ((n_rsus = $MIN_N_RSUS; n_rsus <= $MAX_N_RSUS; n_rsus += $N_RSUS_STEP))
do
    mv *rsu=${n_rsus}_tau=${CONTACT_TIME}*rsus.csv "${RESULTS_DIR}"
    mv *rsu=${n_rsus}_tau=${CONTACT_TIME}*summary.txt "${RESULTS_DIR}"

done

rm *best_coverage*