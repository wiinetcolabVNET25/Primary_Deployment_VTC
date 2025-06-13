# GRASP SOLUTION

## compile

    make

## execute

    ./n-deployment <num of rsus> <contacts time threshold> <GRASP's rcl length> <n-deploy num iterations> <num of contacts> <GRASP's seed> <trace file path>

e.g.

    /n-deployment 100 30 15 100 1 123 ./../6_to_8am.csv

- &lt;GRASP's rcl length&gt;: size of the restricted candidate list
- &lt;num of contacts&gt;: number of contacts vehicles have to achieve - <strong>primary deployment</strong> restricts this to 1
- &lt;GRASP's seed&gt;: random number generator seed

## output

- rsus file (ends with "rsus.csv"): contains solution - lines of cells coordinates separated by ","
- summary file (ends with "summary.txt"): contains arguments, execution time and objective function value
- best coverage log file (ends with "best_coverage_log.csv"): contains the best solution value achieved over the iterations, along with the iteration number first, separated by ","