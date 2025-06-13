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

RESULTS_DIR="results"

rm -rf "$RESULTS_DIR"
mkdir "$RESULTS_DIR"

for n_rsus in 42 211 422 633 845 1056 1267 1478 1690 1901 2112
do
    $N_DEPLOY_DIR/n-deployment $n_rsus $CONTACT_TIME $GRASP_RCL_LEN $N_ITER $N_CONTACTS $RNG_SEED $INPUT_PATH
done

wait

for n_rsus in 42 211 422 633 845 1056 1267 1478 1690 1901 2112
do
    mv *rsu=${n_rsus}_tau=${CONTACT_TIME}*rsus.csv "${RESULTS_DIR}"
    mv *rsu=${n_rsus}_tau=${CONTACT_TIME}*summary.txt "${RESULTS_DIR}"

done

rm *best_coverage*