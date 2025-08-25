{
    number_of_patterns = NR
    number_of_machines += $6
    arr[NR-1] = sprintf("%-40s%-20s%-16s%-8s%-10s", $3, $4, $5, $6, " ")
}
END {
    printf "================================================================================\n\n"
    printf "Tibco stack: %s\n", $1
    printf "Stage: %s\n", $2
    printf "Number of patterns: %s\n", number_of_patterns
    printf "Number of machines: %s\n\n", number_of_machines
    printf "================================================================================\n\n"
    printf "%-40s%-20s%-16s%-8s%-10s\n", "purpose_code", "srv_number", "runtime_pairs", "size", " "

    for(i=1; i<length(arr); i++) {
        print arr[i]
    }

    number_of_blank_lines = (MAX_NUMBER_OF_LINES - NR) + 2

    for(i=1; i<=number_of_blank_lines; i++) {
        printf "@@blank@@\n"
    }

}
