#!/bin/bash


greeting="hello"
echo $greeting

# Get value from subshell
greeting=$(
  greeting="bye"
  echo $greeting
)

echo $greeting