https://www.tutorialspoint.com/awk/

Important feature is "line selection"





# Dump variables generates awkvars.out
awk --dump-variables -f greet.awk


# Run awk scripts
awk -f greet.awk

# marks.txt
awk 'BEGIN { print "Subject\t\tMark" } \
     { sum+=$4; printf "%s\t\t%s\n", $3, $4} \
     END {print "Average:\t"sum/NR}' \
marks.txt

awk '$3 ~ /Maths|English/{ print }' marks.txt

awk '$3 ~ /Maths|English/{ count++ } END { print "Count: " count }' marks.txt

awk 'length($3)>5 { print $3 "\t length: " length($3) }' marks.txt

# Regex
echo -e "aaa\nbbb\nccc" | awk '/[^bc]/{ print }'
echo -e "aaa\nbbb\nccc" | awk '/^(bbb|ccc)/{ print }'
echo -e "Colour\nColor" | awk '/Colou?r/ { print }'

# Standard AWK variables

# Print an environment variable
awk 'BEGIN { print ENVIRON["USER"] }'



# gawk inplace update
gawk -i inplace -v INPLACE_SUFFIX=.bak '{ gsub(/Maths/, "Wiskunde", $3) } { print }' marks_1.txt
awk '{ gsub(/Maths/, "Wiskunde", $3) } { print }' marks_1.txt | column -t | sponge marks_1.txt


# Pipe output to another linux command
awk 'BEGIN { print "hello, world !!!" | "tr [a-z] [A-Z]" }'


# Set 3th column to uppercase
echo "hello world hello world" | awk '{ $3 = "aaa" toupper($3) "bbb"; print }'


# Regex (example with corporate keys)
sort /etc/passwd | awk -F ':' '/^[a-z]{2}[0-9]{2}[a-z]{2}/ { $1 = toupper($1); match($1, /[0-9]{2}/); print $1 " " $5 " " substr($1, RSTART, RLENGTH) }'| sort -k2

# Using reference groups
sort /etc/passwd | awk -F ':' '/^[a-z]{2}[0-9]{2}[a-z]{2}/ { $1 = toupper($1); match($1, /([0-9]{2})/, arr); print $1 " " $5 " " arr[1] }'| sort -k2