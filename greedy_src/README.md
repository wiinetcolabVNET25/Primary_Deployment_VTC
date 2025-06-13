# GREEDY SOLUTION

## compile

    make

## execute

    ./greedy <num of rsus> <contacts time threshold> <num of contacts> <trace file path>

e.g.

    ./greedy 100 30 1 ./../6_to_8am.csv

- primary deployment solution corresponds to executing with &lt;num of contacts&gt; equal to 1

## output

- rsus file (ends with "rsus.csv"): contains solution - lines of cells coordinates separated by ","
- summary file (ends with "summary.txt"): contains arguments, execution time and objective function value