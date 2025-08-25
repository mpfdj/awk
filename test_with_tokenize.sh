#!/bin/bash
# https://stackoverflow.com/questions/5382712/bash-how-to-tokenize-a-string-variable

string="john is 17 years old"
for word in $string; do echo "$word"; done


# Run in a subshell
string="john_is_17_years_old"
#(IFS='_'; for word in $string; do echo "$word"; done)

(
  IFS='_';
  printf "%q\n" "$IFS"
  for word in $string;
  do
    echo "$word";
  done
)

# Note that in this second example I added parentheses around the second line.
# This creates a sub-shell so that the change to $IFS doesn't persist.
# You generally don't want to permanently change $IFS as it can wreak havoc on unsuspecting shell commands.




printf "%q\n" "$IFS"